#!/bin/bash

apt-get update
apt-get install -y cron

# Start and sctivated
service cron start
systemctl enable cron

# created /root/sysinfo.sh
cat << 'EOF' > /root/sysinfo.sh
#!/bin/bash

# Запис поточних дати і часу
echo "===== $(date) =====" >> /var/log/sysinfo

# Час роботи системи, користувачі та завантаження CPU
w >> /var/log/sysinfo

# Використання пам'яті та диска
free -m >> /var/log/sysinfo
df -h >> /var/log/sysinfo

# Відкриті TCP порти
ss -tulpn >> /var/log/sysinfo

# Перевірка з'єднання з ukr.net
ping -c1 -w1 ukr.net >> /var/log/sysinfo

# Список програм із правами SUID
find / -perm -4000 >> /var/log/sysinfo
EOF

chmod +x /root/sysinfo.sh

echo "* * * * 1-5 root /root/sysinfo.sh" >> /etc/crontab