# UAS@UCLA Docker Project Paradigm

Structure for projects that use Docker, including features such as saving images in the GitHub Container Registry so that developers & GitHub Actions can take advantage of the layer cache, thus saving time. It is also configured for use with VS Code via [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

See [Initializing a Project](#initializing-a-project) to get started. If you want more details about what's going on, here's what this project does:

1. Builds code and runs tests in a GitHub Workflow when there is a pull request or a push to master (this practice is known as continuous intregration or CI). Relevant Docker images are uploaded to the GitHub Container Registry on each push.
2. Creates a Docker image called "your-project-dev" that is used as the development environment for your project (where your project folder is mounted as a volume). This usually doesn't change very often, so using cache from the Container Registry saves time when rebuilding on your machine or in CI. This happens automatically. Conveniently, the same image is used for both CI and VS Code Remote - Containers.
3. Creates a Docker image called "your-project" that is based on the dev image, but contains a copy of the built version of your project. This could potentially be used for deployment, but is also convenient for others who may want to test your project without downloading and building the code themselves. This could be useful  if your team has projects that depend on eachother, and a team member wants to test with a project that they depend on but do not contribute to. Or, perhaps you could make a Docker Compose file that runs images from multiple projects and tests their integration, which can be easily run from anywhere.
4. Is set up in a simple way that is easy to understand and customize.

## Initializing a Project
Make a copy of this repository (click "Use this template" above), or copy these files into an existing project. Replace instances of "docker-paradigm" with your project name (in docker-compose.yml and prod.Dockerfile). If you are outside UAS@UCLA, replace uas-at-ucla with your GitHub organization or username.

## Enabling GitHub Container Registry
This project stores images in the GitHub Container Registry. As of writing this, the GitHub Container Registry is in beta, and needs to be enabled for your account or organization. See https://docs.github.com/en/packages/working-with-a-github-packages-registry/enabling-improved-container-support-with-the-container-registry

## Enabling Docker BuildKit
To get the most out of this on your local computer (i.e. take advantage of layer caching from remote images), you should enable Docker BuildKit. This is done by setting the environment variables `DOCKER_BUILDKIT=1` and `COMPOSE_DOCKER_CLI_BUILD=1`. For more info, see https://docs.docker.com/develop/develop-images/build_enhancements

## Logging into the GitHub Container Registry
You may need to log in to the GitHub Container Registry if you make this a private repository or want to manually upload images. Instructions can be found here: https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry
