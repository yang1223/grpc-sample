# frozen_string_literal: true

require 'json'
require 'retryable'

Dir['./pb/*.rb'].each { |f| require f }
Dir['./service/*.rb'].each { |f| require f }

# stub = RecordService::Stub.new(
#   'localhost:50051',
#   :this_channel_is_insecure,
#   channel_args: {
#     'grpc.enable_retries' => 1,
#     'grpc.service_config' => JSON.generate(
#       retryPolicy: {
#         retryableStatusCodes: ['14'],
#         maxAttempts: 3,
#         initialBackoff: '0.1s',
#         backoffMultiplier: 2.0,
#         maxBackoff: '0.3s'
#       }
#     )
#   }
# )

stub = RecordService::Stub.new('localhost:50051', :this_channel_is_insecure)

req = GetRecordReq.new(id: '1')

res = Retryable.retryable(tries: 3, on: GRPC::Unavailable) do
  stub.get_record(req)
end

# Use res.record to check response
binding.irb
