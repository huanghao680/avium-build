#!/bin/bash
# Avium 编译依赖安装脚本
set -e

echo "========================================="
echo " Avium 自动编译 - 环境准备"
echo "========================================="

echo "[1/5] 更新系统包列表..."
sudo apt-get update -qq

echo "[2/5] 安装基础依赖..."
sudo apt-get install -y -qq \
    git git-core git-man \
    build-essential clang flex bison g++ gawk gcc-multilib g++-multilib \
    gettext gcc-multilib p7zip-full msmtp unzip \
    libncurses5-dev python3 python3-pip python3-ply \
    rsync subversion swig \
    xsltproc zlib1g-dev libssl-dev

echo "[3/5] 安装 pip 包..."
pip3 install --user cmake ninja-build

echo "[4/5] 配置 Git..."
git config --global user.name "GitHub Actions"
git config --global user.email "actions@github.com"
git config --global core.compression 6
git config --global http.postBuffer 524288000

echo "[5/5] 创建编译目录..."
mkdir -p ~/avium
echo "编译目录: ~/avium"

echo ""
echo "✅ 环境准备完成!"
