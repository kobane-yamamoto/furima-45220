#!/usr/bin/env bash
# エラーが出たら止める
set -o errexit

# 画像処理に必要なパッケージをインストール
apt-get update && apt-get install -y imagemagick libvips

# Gem のインストール
bundle install

# アセットのプリコンパイル
bundle exec rails assets:precompile

# データベースのマイグレーション
bundle exec rails db:migrate