
if [ ! -f /usr/sbin/nginx ]; then
    echo "Installing nginx"
    apt-get install -y nginx
fi

cat > /etc/nginx/sites-enabled/default <<EOF
server {

        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        index index.html index.htm;

        server_name _;

        location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }

}

EOF
echo -e "\e[32mTesting Config File\e[0m"
nginx -t

echo -e "\e[32mRestarting Nginx\e[0m"
service nginx restart

echo -e "\e[1;32mDone!\e[0m"
