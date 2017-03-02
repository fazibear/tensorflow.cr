module Tensorflow
  class Cancelled < ::Exception; end
  class Unknown < ::Exception; end
  class InvalidArgument < ::Exception; end
  class DeadlineExceeded < ::Exception; end
  class NotFound < ::Exception; end
  class AlreadyExists < ::Exception; end
  class PermissionDenied < ::Exception; end
  class Unauthenticated < ::Exception; end
  class ResourceExhausted < ::Exception; end
  class FailedPrecondition < ::Exception; end
  class Aborted < ::Exception; end
  class OutOfRange < ::Exception; end
  class Unimplemented < ::Exception; end
  class Internal < ::Exception; end
  class Unavailable < ::Exception; end
  class DataLoss < ::Exception; end

  class Status
    @status : LibTensorflow::X_Status
    @code : LibTensorflow::Code | Nil
    @message : String | Nil

    def check
      update
      check_status
    end

    def update
      @code = LibTensorflow.get_code(@status)
      @message = String.new(
        LibTensorflow.message(@status)
      )
    end

    def initialize
      @status = LibTensorflow.new_status
    end

    def to_unsafe
      @status
    end

    def check_status
      raise exception unless @code == LibTensorflow::Code::Ok
    end

    def exception
      case @code
      when LibTensorflow::Cancelled then Cancelled
      when LibTensorflow::Unknown then Unknown
      when LibTensorflow::InvalidArgument then InvalidArgument
      when LibTensorflow::DeadlineExceeded then DeadlineExceeded
      when LibTensorflow::NotFound then NotFound
      when LibTensorflow::AlreadyExists then AlreadyExists
      when LibTensorflow::PermissionDenied then PermissionDenied
      when LibTensorflow::Unauthenticated then Unauthenticated
      when LibTensorflow::ResourceExhausted then ResourceExhausted
      when LibTensorflow::FailedPrecondition then FailedPrecondition
      when LibTensorflow::Aborted then Aborted
      when LibTensorflow::OutOfRange then OutOfRange
      when LibTensorflow::Unimplemented then Unimplemented
      when LibTensorflow::Internal then Internal
      when LibTensorflow::Unavailable then Unavailable
      when LibTensorflow::DataLoss then DataLoss
      when LibTensorflow::Aborted then Aborted
      else Unknown
      end.new(@message)
    end
  end
end
