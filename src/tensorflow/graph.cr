module Tensorflow
  class Graph
    def initialize
      @status = Status.new
      @graph = LibTensorflow.new_graph
    end

    def import_from_file(file_name)
      file = File.read(file_name)
      buffer = LibTensorflow.new_buffer_from_string(file, file.size)
      import_opts = LibTensorflow.new_import_graph_def_options
      LibTensorflow.graph_import_graph_def(@graph, buffer, import_opts, @status)
      @status.check
    end

    def export
      buffer = LibTensorflow.new_buffer
      LibTensorflow.graph_to_graph_def(@graph, buffer, @status)
      @status.check
      String.new(buffer.value.data.as(UInt8*))
    end

    def to_unsafe
      @graph
    end

    def constant(value)
      op = Operation.new(@graph, "Const")
      tensor = Tensor.new(value, op)
      op["dtype"] = tensor.type
      op["value"] = tensor
      op.finish
      tensor.outputs[0]
    end
  end
end
