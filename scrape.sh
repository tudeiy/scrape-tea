#!/bin/bash

echo "🔧 Memulai full install untuk Linux kosong..."

# Step 1: Update & install tools dasar
echo "📦 Update dan install dependencies..."
sudo apt-get update -y
sudo apt-get install -y curl git build-essential

# Step 2: Install Node.js LTS 18 dan npm
echo "⬇️ Menginstall Node.js + npm..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Step 3: Cek versi
echo "✅ Node.js versi: $(node -v)"
echo "✅ npm versi: $(npm -v)"

# Step 6: Install dependency
echo "📦 Menjalankan npm install..."
npm install

echo "✅ Jalankan script node scrape.js"

