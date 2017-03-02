module Tensorflow
  class Operation

    @@count = 0

    def initialize(graph, type, name = nil)
      @status = Status.new
      @operation_desc = LibTensorflow.new_operation(graph, type, name || default_name(type))
    end

    def to_unsafe
      @operation
    end

    def []=(name : String, value : String)
      LibTensorflow.set_attr_string(@operation_desc, name, value, value.size)
    end

    def []=(name : String, value : Tensor)
      LibTensorflow.set_attr_tensor(@operation_desc, name, value, @status)
      @status.check
    end

    def []=(name : String, value : LibTensorflow::Datatype)
      LibTensorflow.set_attr_type(@operation_desc, name, value)
    end

    def finish
      @operation = LibTensorflow.finish_operation(@operation_desc, @status)
      @status.check
      @operation
    end

    def default_name(type)
      @@count += 1
      "#{type}:#{@@count}"
    end
  end
end
