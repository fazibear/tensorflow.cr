module Tensorflow
  class Session
    getter :graph

    def initialize(graph)
      @opts = LibTensorflow.new_session_options
      @status = Status.new
      @graph = graph || Graph.new
      @session = LibTensorflow.new_session(@graph, @opts, @status)
      @status.check
    end

    def to_unsafe
      @session
    end

    def run(input)

    end
  end
end
