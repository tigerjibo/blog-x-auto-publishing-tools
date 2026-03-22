#!/bin/bash
# install-deps.sh - 安装 blog-x-auto-publishing-tools 的 Python 依赖

echo "==================================="
echo "安装 Python 依赖"
echo "==================================="

# 检查是否在虚拟环境中
if [ -z "$VIRTUAL_ENV" ]; then
    echo "⚠️  未检测到虚拟环境"
    echo "创建虚拟环境..."
    python3 -m venv /tmp/blog-tools-env
    source /tmp/blog-tools-env/bin/activate
    echo "✅ 虚拟环境已激活"
fi

# 升级 pip
echo ""
echo "升级 pip..."
pip install --upgrade pip

# 安装依赖
echo ""
echo "安装项目依赖..."
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
else
    echo "未找到 requirements.txt，手动安装依赖..."
    pip install pyperclip
    pip install pyyaml
    pip install selenium
fi

# 验证安装
echo ""
echo "==================================="
echo "验证安装"
echo "==================================="

python3 -c "
import sys
try:
    import pyperclip
    print('✅ pyperclip 安装成功')
except ImportError:
    print('❌ pyperclip 安装失败')
    sys.exit(1)

try:
    import yaml
    print('✅ pyyaml 安装成功')
except ImportError:
    print('❌ pyyaml 安装失败')
    sys.exit(1)
"

echo ""
echo "==================================="
echo "✅ 依赖安装完成"
echo "==================================="
