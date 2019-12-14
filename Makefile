OUTDIR=bq_schema

.PHONY: build
## build: builds BigQuery schema from Protobuf using Docker image
build:
	@echo "Building..."
	@mkdir -p ${OUTDIR}
	@docker run -i -t -v $(shell pwd):/workdir \
		chuhlomin/protoc-gen-bq-schema:1.5 \
		-I/workdir -I/protobuf \
		--bq-schema_out=enumsasints=true:/workdir/${OUTDIR} \
		/workdir/foo/foo.proto
	@echo "Done"

.PHONY: clean
## clean: removes all files from output directory
clean:
	@echo "Cleaning..."
	@rm -r -f ${OUTDIR}/*
	@echo "Done"

.PHONY: help
## help: prints this help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'
