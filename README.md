# UAS@UCLA Docker Project Paradigm

Structure for projects that use Docker, including features such as saving images in Docker Hub so that developers & Travis CI can use the cached layers, thus saving time.

## Initializing a Project
Make a copy of this repository / copy these files into an existing project. Replace instances of "docker-paradigm" with your project name (in docker-compose.yml and prod.Dockerfile).

### Configuring the UAS@UCLA Docker Hub password
Encrypted Travis environment variables need to be setup for each individual repository. Someone in the club will know the password. Here's how to set it up:
```bash
# Make sure you are in the project directory
gem install travis
travis login --pro # Log in with your GitHub account
travis encrypt --pro DOCKER_PASSWORD="secretpassword"
# Replace the "secure" entry in .travis.yml with the output
```

### Uploading the first Docker image (with Travis)
docker-compose.yml tries to pull the development image from Docker Hub to use as cache, but it doesn't exist yet on the first run. To upload it, temporarily add the following as the first command in the .travis.yml script:
```yml
  - "docker-compose build dev"
```
After committing this change and pushing to GitHub, you can immediately revert back (builds will still fail before the initial Docker image is uploaded, but that's ok).

### Uploading the first Docker image (manually)
You may find it more convenient to upload the initial image from your computer instead of fiddling with Travis/GitHub:
```bash
docker-compose build dev
docker login -u uasatucla
docker-compose push dev
```
