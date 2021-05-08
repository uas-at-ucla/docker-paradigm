# UAS@UCLA Docker Project Paradigm

Structure for projects that use Docker, including features such as saving images in the GitHub Container Registry so that developers & GitHub Actions can take advantage of the layer cache, thus saving time. It is also configured for use with VS Code via [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

## Initializing a Project
Make a copy of this repository (click "Use this template" above), or copy these files into an existing project. Replace instances of "docker-paradigm" with your project name (in docker-compose.yml and prod.Dockerfile). If you are outside UAS@UCLA, replace uas-at-ucla with your GitHub organization or username.

## Enabling GitHub Container Registry
This project stores images in the GitHub Container Registry. As of writing this, the GitHub Container Registry is in beta, and needs to be enabled for your account or organization. See https://docs.github.com/en/packages/working-with-a-github-packages-registry/enabling-improved-container-support-with-the-container-registry

## Enabling Docker BuildKit
To get the most out of this on your local computer (i.e. take advantage of layer caching from remote images), you should enable Docker BuildKit. See https://docs.docker.com/develop/develop-images/build_enhancements

## Logging into the GitHub Container Registry
You may need to log in to the GitHub Container Registry if you make this a private repository or want to manually upload images. Instructions can be found here: https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry
