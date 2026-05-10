#!/bin/bash
echo "========================================"
echo "لینک اشتراک g2ray / Xray:"
echo ""

IP=$(curl -s ifconfig.me)
PORT=$(grep -o '"port":[0-9]*' /etc/xray/g2ray.json | grep -o '[0-9]*')
UUID=$(grep -o '"id":"[^"]*"' /etc/xray/g2ray.json | cut -d'"' -f4)

if [ -n "$UUID" ]; then
    echo "vmess://$UUID@$IP:$PORT?security=none&type=tcp#G2ray-Codespaces"
    echo ""
    echo "این لینک رو کپی کن و تو کلاینت استفاده کن."
else
    echo "خطا: UUID پیدا نشد. کانفیگ رو چک کن."
fi

echo "========================================"
systemctl is-active --quiet xray && echo "✅ Xray در حال اجراست" || echo "❌ Xray متوقف است"
