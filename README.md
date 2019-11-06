# Docker images for GitHub Actions runner

Docker images for self-hosted [GitHub Actions runner](https://help.github.com/en/github/automating-your-workflow-with-github-actions/hosting-your-own-runners).

## Supported tags and respective `Dockerfile` links

- [`ubuntu-18.04`](./ubuntu-18.04/Dockerfile)

## Environment variables

| Name | Description |
|---|---|
| `REPO_URL` | **Required**. The URL of the repository. |
| `GITHUB_TOKEN` | **Required**. A GitHub token. This is used for runner registration. |
| `RUNNER_NAME` | The name of the runner. Default: `$(hostname)`. |
| `WORK_FOLDER` | The name of the work folder. Default: `_work`. |

## How to use this image

### Start runner

```sh
$ docker run \
  -e REPO_URL=https://github.com/octocat/hello-world \
  -e GITHUB_TOKEN=AIHLTGQK4JJJ7G4RRQ5GPVJJGJ5QL \
  joakimhellum/actions-runner:ubuntu-18.04
```

### Run once 

```sh
$ docker run \
  -e REPO_URL=https://github.com/octocat/hello-world \
  -e GITHUB_TOKEN=AIHLTGQK4JJJ7G4RRQ5GPVJJGJ5QL \
  joakimhellum/actions-runner:ubuntu-18.04 --once
```
