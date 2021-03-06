IMAGE_NAME=seldon-java-wrapper
VERSION_FILE=target/version.txt

build_jar: update_proto
	mvn clean package -B

seldon-core:
	git clone git@github.com:SeldonIO/seldon-core.git

update_proto: seldon-core
	@cp -v seldon-core/proto/prediction.proto src/main/proto/

clean:
	rm -rf seldon-core
	rm -rf src/main/proto/*
	mvn clean
