test:
	go install github.com/git-hooks/git-hooks
	ENV=test go test -v ./...

clean:
	rm -rf build/*

build: clean
	gox -output="build/{{.Dir}}_{{.OS}}_{{.Arch}}"
	find build -type f | xargs -I_file -- sh -c 'tar czvf _file.tar.gz _file && rm _file'

get:
	go get github.com/tools/godep
	godep restore ./...

.PHONY: test clean build get
