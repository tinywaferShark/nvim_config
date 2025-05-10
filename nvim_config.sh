#!/bin/bash

# 用法:
# 主机模式: ./nvim_config.sh host [output_file]
# 从机模式: ./nvim_config.sh client [input_file]

set -e

NVIM_DIRS=(
  "$HOME/.config/nvim"
  "$HOME/.local/share/nvim"
  "$HOME/.local/state/nvim"
  "$HOME/.cache/nvim"
)

ARCHIVE_NAME="nvim_backup_$(date +%Y%m%d_%H%M%S).tar.gz"

host_mode() {
  local out_file="${1:-$ARCHIVE_NAME}"
  tar -czvf "$out_file" \
    --exclude='.git' \
    --exclude='*/.git' \
    --exclude='*/.git/*' \
    "${NVIM_DIRS[@]}"
  echo "已打包到 $out_file"
}

client_mode() {
  local in_file="$1"
  if [[ ! -f "$in_file" ]]; then
    echo "未找到压缩包: $in_file"
    exit 1
  fi
  tar -xzvf "$in_file" -C /
  echo "已解压并覆盖到目标位置"
}

case "$1" in
  host)
    host_mode "$2"
    ;;
  client)
    client_mode "$2"
    ;;
  *)
    echo "用法:"
    echo "  主机模式: $0 host [输出文件名]"
    echo "  从机模式: $0 client [输入文件名]"
    exit 1
    ;;
esac