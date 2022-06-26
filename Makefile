default:
	mkdir -p server_go
	buf generate
	rm -f ../greyvar-server/gen/greyvarprotocol/*
	cp -r server_go/* ../greyvar-server/
	pbjs *.proto -t static-module -w es6 --es6 --no-comments --no-beautify -r 'roots' > greyvarproto.js
	rm -rf /var/www/html/greyvar-webclient/src/js/greyvarproto.js
	cp -r greyvarproto.js /var/www/html/greyvar-webclient/src/js/

clean:
	rm -rf server_go/*
	rm -f greyvarproto.js
