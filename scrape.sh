#!/bin/bash

clear
echo ""
echo "                      .^!!^."
echo "                  .:~7?7!7??7~:."
echo "               :^!77!~:..^^~7?J?!^."
echo "           .^!7??!^..  ..^^^^^~JJJJ7~:."
echo "           7?????: ...^!7?!^^^~JJJJJJJ?."
echo "           7?????:...^???J7^^^~JJJJJJJJ."
echo "           7?????:...^??7?7^^^~JJJJJJJ?."
echo "           7?????:...^~:.^~^^^~JJJJJJJ?."
echo "           7?????:.. .:^!7!~^^~7?JJJJJ?."
echo "           7?????:.:~JGP5YJJ?7!^^~7?JJ?."
echo "           7?7?JY??JJ5BBBBG5YJJ?7!~7JJ?."
echo "           7Y5GBBYJJJ5BBBBBBBGP5Y5PGP5J."
echo "           ^?PBBBP555PBBBBBBBBBBBB#BPJ~"
echo "              :!YGB#BBBBBBBBBBBBGY7^"
echo "                 .~?5BBBBBBBBPJ~."
echo "                     :!YGGY7:"
echo "                        .."
echo ""
echo " 🚀 join channel Airdrop Sambil Rebahan : https://t.me/kingfeeder "
echo ""

#!/bin/bash

echo "🚀 Mulai instalasi otomatis untuk scraping TEA Sepolia..."

# Step 1: Update & install tool dasar
echo "📦 Update dan install dependencies dasar..."
sudo apt-get update -y
sudo apt-get install -y curl git build-essential

# Step 2: Install Node.js LTS (versi 18)
echo "⬇️ Menginstall Node.js + npm..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "✅ Node.js versi: $(node -v)"
echo "✅ npm versi: $(npm -v)"

# Step 4: Install puppeteer
npm init -y

npm install puppeteer

echo "✅ Instalasi & scraping selesai!"
echo "📁 Hasil scraping ada di: $TARGET_DIR/scraped_addresses.txt"
