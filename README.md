### Usage

```
git clone https://github.com/simatei/initial-server-setup.git
cd initial-server-setup
sudo bash setup_server.sh

```
##### Setup Watchtower for CI/CD
```
docker run -d \
    --name watchtower \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower \
    -i 30
```

##### Setup Watchtower email notifications
```
docker run -d \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e WATCHTOWER_NOTIFICATIONS=email \
  -e WATCHTOWER_NOTIFICATION_EMAIL_FROM=fromaddress@gmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_TO=toaddress@gmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER=smtp.gmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PORT=587 \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_USER=fromaddress@gmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PASSWORD=app_password \
  -e WATCHTOWER_NOTIFICATION_EMAIL_DELAY=2 \
  containrrr/watchtower
```
