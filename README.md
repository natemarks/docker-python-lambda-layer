# docker-python-lambda-layer

This is a sample project that demonstrates how to build a Lambda layer using Docker.  It builds the docker image containing the python package directories, then uses a mount point to copy those to the build directory in a layer/zip file


## Usage

```bash
make docker-export
```