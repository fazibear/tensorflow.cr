require "./spec_helper"

describe "LibTensorflow" do
  it "initializes session" do
    opts    = LibTensorflow.new_session_options
    status  = LibTensorflow.new_status
    graph   = LibTensorflow.new_graph
    session = LibTensorflow.new_session(graph, opts, status)
    LibTensorflow.get_code(status).should eq(LibTensorflow::Code::Ok)
  end
end
