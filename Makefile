default:
	mkdir -p client_cpp
	protoc --grpc_out client_cpp --cpp_out client_cpp --plugin=protoc-gen-grpc=`which grpc_cpp_plugin` server_interface.proto
	protoc --grpc_out client_cpp --cpp_out client_cpp --plugin=protoc-gen-grpc=`which grpc_cpp_plugin` client_to_server_messages.proto
	protoc --grpc_out client_cpp --cpp_out client_cpp --plugin=protoc-gen-grpc=`which grpc_cpp_plugin` server_to_client_messages.proto
	mkdir -p server_go
	protoc server_interface.proto --go_out=plugins=grpc:server_go
	protoc client_to_server_messages.proto --go_out=plugins=grpc:server_go
	protoc server_to_client_messages.proto --go_out=plugins=grpc:server_go
	rm -f ~/sandbox/greyvar-server/pkg/greyvarproto/*
	cp server_go/* ~/sandbox/greyvar-server/pkg/greyvarproto/
	rm -f ~/sandbox/greyvar-engine/pub/net/proto/*
	cp client_cpp/* ~/sandbox/greyvar-engine/pub/net/proto/
