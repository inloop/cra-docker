# cra-docker

Create statically built CRA applications docker images for easy deployment.

## Usage

All you need to do is get the content of built app (`build` folder) inside docker image in `/app` folder.

To get this working firstly create `Dockerfile` in your project root with content:

```
FROM inloopx/cra-docker

COPY build /app
```

then you can call:

```
# or npm run build
yarn build
docker build -t my-new-app .
```

Once the build is done, you should have your image ready. To verify it, run the image bind to 8080 port:

```
docker run --rm -p 8080:80 my-new-app
```

Now if you open [http://localhost:8080](http://localhost:8080) You should see your app.

You can find more in [example](example) directory. Also if you use gitlab, don't miss the [pipeline configuration file example](example/.gitlab-ci.yml)
