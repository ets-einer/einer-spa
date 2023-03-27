

[![docker pull danihre/spa-nginx][image shield]][docker hub]

This is a Docker image used to serve a Single Page App (pure frontend javascript) using nginx, it support PushState, and includes a way to pass configuration at run time.

## Supported tags and `Dockerfile` links

-	[`latest` (*Dockerfile*)][latest]

# App Setup

This docker image is built for `index.html` file being in the `/app` directory. `pushState` is enabled.

At a minimum, you will want this in your `Dockerfile`:

```Dockerfile
FROM danihre/spa-nginx

COPY build/ /app
COPY index.html /app/index.html
```

Then you can build & run your app in the docker container. It will be served by a nginx static server.

```bash
$ docker build -t your-app-image .
$ docker run -p 8000:80 your-app-image
```

You can then go to `http://docker-ip:8000/` to see it in action.

This will create a `config.js` file, which you can then add to your index.html, or load asynchronously. The path can be controlled with `CONFIG_FILE_PATH` environmental variable.

[push state]: https://developer.mozilla.org/en-US/docs/Web/API/History_API
[latest]: https://github.com/ets-einer/einer-spa/blob/main/Dockerfile
[base image]: https://github.com/nginxinc/docker-nginx
[image shield]: https://img.shields.io/badge/dockerhub-danihre%2Fspa--nginx-blue.svg
[docker hub]: https://hub.docker.com/r/danihre/spa-nginx
