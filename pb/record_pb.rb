# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: record.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("record.proto", :syntax => :proto3) do
    add_message "GetRecordReq" do
      optional :id, :string, 1
    end
    add_message "GetRecordRes" do
      optional :record, :message, 1, "Record"
    end
    add_message "Record" do
      optional :id, :string, 1
      optional :name, :string, 2
    end
  end
end

GetRecordReq = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("GetRecordReq").msgclass
GetRecordRes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("GetRecordRes").msgclass
Record = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("Record").msgclass
