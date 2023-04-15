default:
	mkdir -p server_go
	buf generate
	rm -f ../server/gen/greyvarprotocol/*
	cp -r server_go/* ../server/
	pbjs *.proto -t static-module -w es6 --es6 --no-comments --no-beautify -r 'roots' > greyvarproto.js
	rm -rf ../webclient/src/js/greyvarproto.js
	cp -r greyvarproto.js ../webclient/src/js/

clean:
	rm -rf server_go/*
	rm -f greyvarproto.js
