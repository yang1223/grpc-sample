install:create_dirs
	grpc_tools_ruby_protoc -I ./protos --ruby_out=pb --grpc_out=service ./protos/record.proto

create_dirs:
	mkdir -p pb service

install_gems:
	bundle install

clean:
	rm -rf pb service

fix:
	sed -i -r "/require.*?pb'/d" ./service/*.rb

server: clean install fix
	bundle exec ruby server.rb

irb:
	bundle exec ruby client.rb
