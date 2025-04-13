const fs = require('fs');
const path = require('path');
const puppeteer = require('puppeteer');

async function scrapeFromAddresses(limit = 150, existing = []) {
    const baseUrl = 'https://sepolia.tea.xyz';
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    const fromAddresses = new Set();

    try {
        console.log('🌐 Membuka halaman explorer...');
        await page.goto(`${baseUrl}/txs`, { waitUntil: 'networkidle2' });

        while (fromAddresses.size < limit) {
            const newFroms = await page.evaluate(() => {
                const froms = [];
                const links = document.querySelectorAll('a[href^="/address/"]');
                for (let link of links) {
                    const addr = link.getAttribute('href').replace('/address/', '').trim();
                    if (/^0x[a-fA-F0-9]{40}$/.test(addr)) froms.push(addr.toLowerCase());
                }
                return froms;
            });

            for (let addr of newFroms) {
                if (!existing.includes(addr)) fromAddresses.add(addr);
                if (fromAddresses.size >= limit) break;
            }

            // Tombol "Load more"
            const buttons = await page.$$('button');
            let nextBtn = null;
            for (const btn of buttons) {
                const text = await page.evaluate(el => el.innerText, btn);
                if (text.includes('Load more')) {
                    nextBtn = btn;
                    break;
                }
            }

            if (!nextBtn) break;
            await nextBtn.click();
            await page.waitForTimeout(2000);
        }

        return Array.from(fromAddresses).slice(0, limit);
    } catch (err) {
        console.error("❌ Scrape error:", err.message);
        return [];
    } finally {
        await browser.close();
    }
}

// Eksekusi langsung jika file dijalankan
(async () => {
    const result1 = await scrapeFromAddresses();
    console.log(`🔁 Selesai scrape pertama, total: ${result1.length} alamat`);

    await new Promise(resolve => setTimeout(resolve, 6000)); // Delay 6 detik

    const result2 = await scrapeFromAddresses();
    console.log(`🔁 Selesai scrape kedua, total: ${result2.length} alamat`);

    // Gabungkan dan filter agar unik
    const combined = Array.from(new Set([...result1, ...result2]));

    const filePath = path.join(__dirname, 'scraped_addresses.txt');
    fs.writeFileSync(filePath, combined.join('\n'), 'utf8');
    console.log(`✅ Total ${combined.length} alamat unik disimpan di: ${filePath}`);
})();
