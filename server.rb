# frozen_string_literal: true

Dir['./pb/*.rb'].each { |f| require f }
Dir['./service/*.rb'].each { |f| require f }

class RecordServer < RecordService::Service
  def get_record(req, _call)
    puts "Current timestamp: #{Time.now.to_i}"

    # # Uncomment to respond Unavailable error
    # raise GRPC::Unavailable.new

    r = Record.new(id: '1', name: 'test')
    GetRecordRes.new(record: r)
  end
end

port = '0.0.0.0:50051'
s = GRPC::RpcServer.new
s.add_http2_port(port, :this_port_is_insecure)
puts "... running insecurely on #{port}"
s.handle(RecordServer.new)

s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
