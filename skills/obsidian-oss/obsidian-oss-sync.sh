#!/bin/bash
# Obsidian + OSS 同步示例脚本
# 配合 OpenClaw Obsidian OSS Skill 使用

# ========== 配置 ==========
VAULT_NAME="cooolink"
VAULT_PATH="/Users/a/Library/Mobile Documents/iCloud~md~obsidian/Documents/cooolink/cooolink"
OSS_BUCKET="obsidian-cooolink-sync"
OSS_REGION="cn-heyuan"
OSS_ENDPOINT="oss-cn-heyuan.aliyuncs.com"

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "💎 Obsidian + OSS 同步工具"
echo "=========================="

# 检查 vault 路径
if [ ! -d "$VAULT_PATH" ]; then
    echo -e "${RED}错误: Vault 路径不存在: $VAULT_PATH${NC}"
    exit 1
fi

# ========== 功能函数 ==========

# 备份 Vault 到 OSS
backup_to_oss() {
    echo -e "${YELLOW}正在备份 Vault 到 OSS...${NC}"

    BACKUP_NAME="obsidian-backup-$(date +%Y%m%d-%H%M%S)"
    TEMP_DIR="/tmp/$BACKUP_NAME"

    # 创建临时备份
    mkdir -p "$TEMP_DIR"
    cp -r "$VAULT_PATH/"* "$TEMP_DIR/" 2>/dev/null || true

    # 打包
    tar -czf "/tmp/${BACKUP_NAME}.tar.gz" -C "$TEMP_DIR" .

    echo "✅ 本地备份创建完成: /tmp/${BACKUP_NAME}.tar.gz"
    echo "📦 文件大小: $(du -h "/tmp/${BACKUP_NAME}.tar.gz" | cut -f1)"

    # 清理临时目录
    rm -rf "$TEMP_DIR"

    echo ""
    echo "上传到 OSS 的命令:"
    echo "  ossutil cp /tmp/${BACKUP_NAME}.tar.gz oss://${OSS_BUCKET}/backups/"
}

# 同步 Vault 到 OSS (使用 ossutil)
sync_to_oss() {
    echo -e "${YELLOW}正在同步 Vault 到 OSS...${NC}"

    if ! command -v ossutil &> /dev/null; then
        echo -e "${RED}错误: ossutil 未安装${NC}"
        echo "安装命令: curl -o /usr/local/bin/ossutil https://gosspublic.alicdn.com/ossutil/1.7.19/ossutilmac64 && chmod +x /usr/local/bin/ossutil"
        exit 1
    fi

    # 同步到 OSS
    ossutil cp -r -u "$VAULT_PATH/" "oss://${OSS_BUCKET}/"

    echo -e "${GREEN}✅ 同步完成${NC}"
}

# 从 OSS 同步到本地
sync_from_oss() {
    echo -e "${YELLOW}正在从 OSS 同步到本地...${NC}"

    if ! command -v ossutil &> /dev/null; then
        echo -e "${RED}错误: ossutil 未安装${NC}"
        exit 1
    fi

    # 先备份本地
    BACKUP_NAME="obsidian-local-backup-$(date +%Y%m%d-%H%M%S)"
    cp -r "$VAULT_PATH" "/tmp/$BACKUP_NAME"
    echo "📦 本地备份已创建: /tmp/$BACKUP_NAME"

    # 从 OSS 同步
    ossutil cp -r -u "oss://${OSS_BUCKET}/" "$VAULT_PATH/"

    echo -e "${GREEN}✅ 同步完成${NC}"
}

# 列出 OSS Bucket 内容
list_oss_contents() {
    echo -e "${YELLOW}OSS Bucket 内容 ($OSS_BUCKET):${NC}"

    if ! command -v ossutil &> /dev/null; then
        echo -e "${RED}错误: ossutil 未安装${NC}"
        exit 1
    fi

    ossutil ls oss://${OSS_BUCKET}/
}

# 显示 Vault 统计信息
vault_stats() {
    echo -e "${YELLOW}Vault 统计信息:${NC}"
    echo "Vault 路径: $VAULT_PATH"
    echo "Vault 大小: $(du -sh "$VAULT_PATH" | cut -f1)"
    echo "笔记数量: $(find "$VAULT_PATH" -name "*.md" | wc -l)"
    echo "附件数量: $(find "$VAULT_PATH" -type f ! -name "*.md" ! -path "*/.obsidian/*" | wc -l)"
    echo "最后修改: $(stat -f %Sm "$VAULT_PATH" | head -1)"
}

# 显示帮助信息
show_help() {
    echo "用法: ./obsidian-oss-sync.sh [命令]"
    echo ""
    echo "命令:"
    echo "  backup      创建 Vault 备份并准备上传到 OSS"
    echo "  sync-up     同步本地 Vault 到 OSS"
    echo "  sync-down   从 OSS 同步到本地 Vault"
    echo "  list        列出 OSS Bucket 内容"
    echo "  stats       显示 Vault 统计信息"
    echo "  help        显示帮助信息"
    echo ""
    echo "示例:"
    echo "  ./obsidian-oss-sync.sh backup"
    echo "  ./obsidian-oss-sync.sh sync-up"
    echo "  ./obsidian-oss-sync.sh stats"
}

# ========== 主程序 ==========

case "${1:-help}" in
    backup)
        backup_to_oss
        ;;
    sync-up)
        sync_to_oss
        ;;
    sync-down)
        sync_from_oss
        ;;
    list)
        list_oss_contents
        ;;
    stats)
        vault_stats
        ;;
    help|*)
        show_help
        ;;
esac
