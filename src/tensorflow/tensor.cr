module Tensorflow
  class Tensor
    DEALOC = ->(a : Pointer(Void), b : UInt64, c: Pointer(Void)) {}

    getter :type, :type_string, :operation, :outputs

    #@outputs : Array(LibTensorflow::Output)

    def initialize(@value : String, @operation : Operation)
      @dims = [] of Int64
      @data = @value

      @type = LibTensorflow::Datatype::String
      @type_string = "string"

      #@outputs = initialize_outputs

      @tensor = LibTensorflow.new_tensor(@type,
                                         @dims, @dims.size,
                                         @data, @data.size,
                                         DEALOC, nil)
    end

    def initialize(@value : Float64, @operation : Operation)
      @dims = [] of Int64
      @data = @value

      @type = LibTensorflow::Datatype::Float
      @type_string = "float"

      #@outputs = initialize_outputs

      @tensor = LibTensorflow.new_tensor(@type,
                                         @dims, @dims.size,
                                         pointerof(@data), 8,
                                         DEALOC, nil)
    end

    def to_unsafe
      @tensor
    end

    def outputs
      output = LibTensorflow::Output.new
      output.oper = @operation
      output.index = 0
      [output]
    end
  end
end
