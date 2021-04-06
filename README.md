# UAS@UCLA Docker Project Paradigm

Structure for projects that use Docker, including features such as saving images in Docker Hub so that developers & GitHub Actions can use the cached layers, thus saving time.

## Initializing a Project
Make a copy of this repository (click "Use this template" above), or copy these files into an existing project. Replace instances of "docker-paradigm" with your project name (in docker-compose.yml and prod.Dockerfile).

### Uploading the first Docker image (with GitHub Actions)
docker-compose.yml tries to pull the development image from Docker Hub to use as cache, but it doesn't exist yet on the first run. To upload it, temporarily uncomment the following lines in .github/workflows/ci.yml:
```yml
#       - name: Force-build Docker container from scratch. Only required prior to first image upload.
#         run: docker-compose build dev
```

After committing this change and pushing to GitHub, you can immediately remove this (builds will still fail before the initial Docker image is uploaded, but that's ok).

### Uploading the first Docker image (manually)
You may find it more convenient to upload the initial image from your computer instead of fiddling with GitHub Actions:
```bash
docker-compose build dev
docker login -u uasatucla
docker-compose push dev
```

## Note on secret environment variable
The UAS@UCLA Docker Hub password is stored in a GitHub "organization secret" (safely encrypted). Organization owners can see the configuration here:
* https://github.com/organizations/uas-at-ucla/settings/secrets/actions (for uas-at-ucla)
* https://github.com/organizations/uas-at-ucla-dependencies/settings/secrets/actions (for uas-at-ucla-dependencies)

Unfortunately, organization secrets cannot by used private repositories if the organiziation is on the free plan.
