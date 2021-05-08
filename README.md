# UAS@UCLA Docker Project Paradigm

Structure for projects that use Docker, including features such as saving images in the GitHub Container Registry so that developers & GitHub Actions can use the cached layers, thus saving time.

## Initializing a Project
Make a copy of this repository (click "Use this template" above), or copy these files into an existing project. Replace instances of "docker-paradigm" with your project name (in docker-compose.yml and prod.Dockerfile). If you are outside UAS@UCLA, replace uas-at-ucla with your GitHub organization or username.

## Logging into the GitHub Container Registry
You may need to log in to the GitHub Container Registry if you make this a private repository or want to manually upload images. Instructions can be found here: https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry
