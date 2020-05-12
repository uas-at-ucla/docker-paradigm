# UAS@UCLA Docker Project Paradigm

Structure for projects that use Docker, including features such as saving images in Docker Hub so that developers & Travis CI can use the cached layers, thus saving time.

## Initializing a Project
Make a copy of this repository / copy these files into an existing project. Replace instances of "docker-paradigm" with your project name.

### Configuring the UAS@UCLA Docker Hub password
Encrypted Travis environment variables need to be setup for each individual repository. Someone in the club will know the password. Here's how to set it up:
```bash
# Make sure you are in the project directory
gem install travis
travis login --pro # Log in with your GitHub account
travis encrypt --pro DOCKER_PASSWORD="secretpassword"
```

### Uploading the first Docker image
docker-compose.yml tries to pull the development image from Docker Hub to use as cache, but it doesn't exist yet on the first run. To upload it, temporarily add the following as the first command in the .travis.yml script:
```yml
  - "docker-compose build dev"
```
After commiting this change and Travis uploads the image, revert the change and you are set.
