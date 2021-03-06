# Docker images for GitHub Actions runner

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/joakimhellum/actions-runner)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/joakimhellum/actions-runner)

(Experimental) Docker images for [GitHub Actions self-hosted runner](https://help.github.com/en/github/automating-your-workflow-with-github-actions/hosting-your-own-runners).

> ⚠️ **Warning**: Using self-hosted runners with public repositories is **not** recommended. Forks of your public repository can potentially run dangerous code on your self-hosted runner by creating a pull request that executes the code in a workflow.
> For more information, see [About self-hosted runners](https://help.github.com/en/github/automating-your-workflow-with-github-actions/about-self-hosted-runners#self-hosted-runner-security-with-public-repositories).

## Supported tags and respective `Dockerfile` links

- [`ubuntu-18.04`](./ubuntu-18.04/Dockerfile)

## Environment variables

| Name | Description |
|---|---|
| `REPO_URL` | **Required**. The URL of the repository. |
| `GITHUB_TOKEN` | **Required**. The runner registration token. |
| `RUNNER_NAME` | The name of the runner. Default: `$(hostname)`. |
| `WORK_FOLDER` | The name of the work folder. Default: `_work`. |

## How to use this image

### Start runner

```sh
$ docker run --name actions-runner \
  -e REPO_URL=https://github.com/octocat/hello-world \
  -e GITHUB_TOKEN=AIHLTGQK4JJJ7G4RRQ5GPVJJGJ5QL \
  joakimhellum/actions-runner:ubuntu-18.04
```

### Run once 

```sh
$ docker run --name actions-runner \
  -e REPO_URL=https://github.com/octocat/hello-world \
  -e GITHUB_TOKEN=AIHLTGQK4JJJ7G4RRQ5GPVJJGJ5QL \
  joakimhellum/actions-runner:ubuntu-18.04 --once
```

### Remove runner from repository

```sh
$ docker stop actions-runner
```
