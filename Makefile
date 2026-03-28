generate:
	buf generate

install:  generate
	rm -f ../server/gen/greyvarprotocol/*
	cp -r out/go/* ../server/
	rm -rf ../webclient/src/js/gen
	cp -r out/js/* ../webclient/js/gen/
	
clean:
	rm -rf out/
