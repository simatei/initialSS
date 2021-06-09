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
