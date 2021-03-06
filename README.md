# protoc-gen-bq-schema-example-proto

[![Build Status](https://ci.chuhlomin.com/api/badges/chuhlomin/protoc-gen-bq-schema-example-proto/status.svg)](https://ci.chuhlomin.com/chuhlomin/protoc-gen-bq-schema-example-proto)

This repository is used as an example to demonstrate work of [protoc-gen-bq-schema](https://github.com/chuhlomin/protoc-gen-bq-schema) plugin.

Every commit to master branch in this repository [updates](https://github.com/chuhlomin/protoc-gen-bq-schema-example-proto/blob/master/.drone.yml#L13-L26) BigQuery schema in [protoc-gen-bq-schema-example-bq](https://github.com/chuhlomin/protoc-gen-bq-schema-example-bq) repository.

To test things locally you may run:

```
mkdir bq_schema
docker run -i -t -v $(pwd):/workdir \
    chuhlomin/protoc-gen-bq-schema:1.5 \
    -I/workdir \
    -I/protobuf \
    --bq-schema_out=enumsasints=true:/workdir/bq_schema \
    /workdir/foo.proto
```
