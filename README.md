### Install necessary libraries

```bash
bundle install
```

### Generate client code

```bash
rm -rf pb service
mkdir -p pb service
grpc_tools_ruby_protoc -I ./protos --ruby_out=pb --grpc_out=service ./protos/record.proto
```

### Fix require path error manually

```bash
sed -i -r "/require.*?pb'/d" ./service/*.rb
```

### Start server

```bash
bundle exec ruby server.rb
```

### Start client in irb

```bash
bundle exec ruby client.rb
```
