# Solution updating Docker-compose version

## when newly downloaded docker-compose binary is not being recognized. This could be due to multiple reasons, such as an older version of Docker Compose still being available in a different location.

## Let's verify and fix this:

### Check if there are multiple versions of Docker Compose:

```sh
which docker-compose
```
This command will show the path of the docker-compose command being executed. Ensure it points to /usr/local/bin/docker-compose.

### Remove any older versions of Docker Compose:
If which docker-compose points to a different path, remove the older version:

```sh
sudo rm $(which docker-compose)
```

## Reinstall Docker Compose:
### Download and install the latest version again:

```sh
sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```
### Verify the installation:

```sh
docker-compose --version
```
If you still see the old version, try reloading your shell or restarting the terminal session, then check the version again. If the issue persists, manually add /usr/local/bin to your PATH:

```sh
export PATH=$PATH:/usr/local/bin
```
Then verify the Docker Compose version again:

```sh
docker-compose --version
```
This should display the updated version of Docker Compose.






