# Build MK for Linux

Scripts for building MK for Linux. The end result is a Docker container
where you have all the static libs you need. We use Alpine, which is
probably the best solution to produce statically linked Go binaries as
needed by OONI for Linux.

## Updating dependencies

Update:

1. the base image in [Dockefile](Dockerfile)

2. [curl/download.sh](curl/download.sh)

3. [curl/build.sh](curl/build.sh)

4. [libmaxminddb/download.sh](libmaxminddb/download.sh)

5. [libmaxminddb/build.sh](libmaxminddb/build.sh)

6. [measurement-kit/download.sh](measurement-kit/download.sh)

7. [measurement-kit/build.sh](measurement-kit/build.sh)

## Download dependencies

```bash
./download.sh all
```

## Prepare docker image

```bash
docker build -t openobservatory/mk-alpine:`date +%Y%m%d` .
```

## Push docker image

```bash
docker push openobservatory/mk-alpine
```

## Future improvements

We're currently recompiling curl and libmaxminddb because on Alpine curl
depends on nghttp2, for which a static library is not provided. Yet, [a
future version of Alpine will have this fixed](
https://bugs.alpinelinux.org/issues/10229), so we can further simplify
the build process when that change lands in a Docker image.

