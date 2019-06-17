# Build MK for Linux

Scripts for building MK for Linux. The end result is a Docker container
where you have all the static libs you need. We use Alpine, which is
probably the best solution to produce statically linked Go binaries as
needed by OONI for Linux.

## Updating dependencies

Update:

1. the base image in [Dockefile](Dockerfile)

2. [measurement-kit/download.sh](measurement-kit/download.sh)

3. [measurement-kit/build.sh](measurement-kit/build.sh)

## Download dependencies

```bash
./measurement-kit/download.sh
```

## Prepare docker image

```bash
docker build -t openobservatory/mk-alpine .
docker tag openobservatory/mk-alpine openobservatory/mk-alpine:`date +%Y%m%d`
```

## Push docker image

```bash
docker push openobservatory/mk-alpine
```
