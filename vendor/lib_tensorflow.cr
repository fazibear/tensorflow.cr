@[Link("tensorflow")]
lib LibTensorflow
  fun version = TF_Version : LibC::Char*
  Float = 1
  Double = 2
  Int32 = 3
  Uint8 = 4
  Int16 = 5
  Int8 = 6
  String = 7
  Complex64 = 8
  Complex = 8
  Int64 = 9
  Bool = 10
  Qint8 = 11
  Quint8 = 12
  Qint32 = 13
  Bfloat16 = 14
  Qint16 = 15
  Quint16 = 16
  Uint16 = 17
  Complex128 = 18
  Half = 19
  Resource = 20
  fun data_type_size = TF_DataTypeSize(dt : Datatype) : LibC::SizeT
  enum Datatype
    Float = 1
    Double = 2
    Int32 = 3
    Uint8 = 4
    Int16 = 5
    Int8 = 6
    String = 7
    Complex64 = 8
    Complex = 8
    Int64 = 9
    Bool = 10
    Qint8 = 11
    Quint8 = 12
    Qint32 = 13
    Bfloat16 = 14
    Qint16 = 15
    Quint16 = 16
    Uint16 = 17
    Complex128 = 18
    Half = 19
    Resource = 20
  end
  Ok = 0
  Cancelled = 1
  Unknown = 2
  InvalidArgument = 3
  DeadlineExceeded = 4
  NotFound = 5
  AlreadyExists = 6
  PermissionDenied = 7
  Unauthenticated = 16
  ResourceExhausted = 8
  FailedPrecondition = 9
  Aborted = 10
  OutOfRange = 11
  Unimplemented = 12
  Internal = 13
  Unavailable = 14
  DataLoss = 15
  alias Status = Void
  fun new_status = TF_NewStatus : X_Status
  type X_Status = Void*
  fun delete_status = TF_DeleteStatus(x0 : X_Status)
  fun set_status = TF_SetStatus(s : X_Status, code : Code, msg : LibC::Char*)
  enum Code
    Ok = 0
    Cancelled = 1
    Unknown = 2
    InvalidArgument = 3
    DeadlineExceeded = 4
    NotFound = 5
    AlreadyExists = 6
    PermissionDenied = 7
    Unauthenticated = 16
    ResourceExhausted = 8
    FailedPrecondition = 9
    Aborted = 10
    OutOfRange = 11
    Unimplemented = 12
    Internal = 13
    Unavailable = 14
    DataLoss = 15
  end
  fun get_code = TF_GetCode(s : X_Status) : Code
  fun message = TF_Message(s : X_Status) : LibC::Char*
  struct Buffer
    data : Void*
    length : LibC::SizeT
    data_deallocator : (Void*, LibC::SizeT -> Void)
  end
  fun new_buffer_from_string = TF_NewBufferFromString(proto : Void*, proto_len : LibC::SizeT) : Buffer*
  fun new_buffer = TF_NewBuffer : Buffer*
  fun delete_buffer = TF_DeleteBuffer(x0 : Buffer*)
  fun get_buffer = TF_GetBuffer(buffer : Buffer*) : Buffer
  alias Tensor = Void
  fun new_tensor = TF_NewTensor(x0 : Datatype, dims : Int64T*, num_dims : LibC::Int, data : Void*, len : LibC::SizeT, deallocator : (Void*, LibC::SizeT, Void* -> Void), deallocator_arg : Void*) : X_Tensor
  alias Int64T = LibC::LongLong
  type X_Tensor = Void*
  fun allocate_tensor = TF_AllocateTensor(x0 : Datatype, dims : Int64T*, num_dims : LibC::Int, len : LibC::SizeT) : X_Tensor
  fun delete_tensor = TF_DeleteTensor(x0 : X_Tensor)
  fun tensor_type = TF_TensorType(x0 : X_Tensor) : Datatype
  fun num_dims = TF_NumDims(x0 : X_Tensor) : LibC::Int
  fun dim = TF_Dim(tensor : X_Tensor, dim_index : LibC::Int) : Int64T
  fun tensor_byte_size = TF_TensorByteSize(x0 : X_Tensor) : LibC::SizeT
  fun tensor_data = TF_TensorData(x0 : X_Tensor) : Void*
  fun string_encode = TF_StringEncode(src : LibC::Char*, src_len : LibC::SizeT, dst : LibC::Char*, dst_len : LibC::SizeT, status : X_Status) : LibC::SizeT
  fun string_decode = TF_StringDecode(src : LibC::Char*, src_len : LibC::SizeT, dst : LibC::Char**, dst_len : LibC::SizeT*, status : X_Status) : LibC::SizeT
  fun string_encoded_size = TF_StringEncodedSize(len : LibC::SizeT) : LibC::SizeT
  alias Sessionoptions = Void
  fun new_session_options = TF_NewSessionOptions : X_Sessionoptions
  type X_Sessionoptions = Void*
  fun set_target = TF_SetTarget(options : X_Sessionoptions, target : LibC::Char*)
  fun set_config = TF_SetConfig(options : X_Sessionoptions, proto : Void*, proto_len : LibC::SizeT, status : X_Status)
  fun delete_session_options = TF_DeleteSessionOptions(x0 : X_Sessionoptions)
  alias Graph = Void
  fun new_graph = TF_NewGraph : X_Graph
  type X_Graph = Void*
  fun delete_graph = TF_DeleteGraph(x0 : X_Graph)
  alias Operationdescription = Void
  alias Operation = Void
  struct Input
    oper : X_Operation
    index : LibC::Int
  end
  type X_Operation = Void*
  struct Output
    oper : X_Operation
    index : LibC::Int
  end
  fun graph_set_tensor_shape = TF_GraphSetTensorShape(graph : X_Graph, output : Output, dims : Int64T*, num_dims : LibC::Int, status : X_Status)
  fun graph_get_tensor_num_dims = TF_GraphGetTensorNumDims(graph : X_Graph, output : Output, status : X_Status) : LibC::Int
  fun graph_get_tensor_shape = TF_GraphGetTensorShape(graph : X_Graph, output : Output, dims : Int64T*, num_dims : LibC::Int, status : X_Status)
  fun new_operation = TF_NewOperation(graph : X_Graph, op_type : LibC::Char*, oper_name : LibC::Char*) : X_Operationdescription
  type X_Operationdescription = Void*
  fun set_device = TF_SetDevice(desc : X_Operationdescription, device : LibC::Char*)
  fun add_input = TF_AddInput(desc : X_Operationdescription, input : Output)
  fun add_input_list = TF_AddInputList(desc : X_Operationdescription, inputs : Output*, num_inputs : LibC::Int)
  fun add_control_input = TF_AddControlInput(desc : X_Operationdescription, input : X_Operation)
  fun colocate_with = TF_ColocateWith(desc : X_Operationdescription, op : X_Operation)
  fun set_attr_string = TF_SetAttrString(desc : X_Operationdescription, attr_name : LibC::Char*, value : Void*, length : LibC::SizeT)
  fun set_attr_string_list = TF_SetAttrStringList(desc : X_Operationdescription, attr_name : LibC::Char*, values : Void**, lengths : LibC::SizeT*, num_values : LibC::Int)
  fun set_attr_int = TF_SetAttrInt(desc : X_Operationdescription, attr_name : LibC::Char*, value : Int64T)
  fun set_attr_int_list = TF_SetAttrIntList(desc : X_Operationdescription, attr_name : LibC::Char*, values : Int64T*, num_values : LibC::Int)
  fun set_attr_float = TF_SetAttrFloat(desc : X_Operationdescription, attr_name : LibC::Char*, value : LibC::Float)
  fun set_attr_float_list = TF_SetAttrFloatList(desc : X_Operationdescription, attr_name : LibC::Char*, values : LibC::Float*, num_values : LibC::Int)
  fun set_attr_bool = TF_SetAttrBool(desc : X_Operationdescription, attr_name : LibC::Char*, value : UInt8)
  fun set_attr_bool_list = TF_SetAttrBoolList(desc : X_Operationdescription, attr_name : LibC::Char*, values : UInt8*, num_values : LibC::Int)
  fun set_attr_type = TF_SetAttrType(desc : X_Operationdescription, attr_name : LibC::Char*, value : Datatype)
  fun set_attr_type_list = TF_SetAttrTypeList(desc : X_Operationdescription, attr_name : LibC::Char*, values : Datatype*, num_values : LibC::Int)
  fun set_attr_shape = TF_SetAttrShape(desc : X_Operationdescription, attr_name : LibC::Char*, dims : Int64T*, num_dims : LibC::Int)
  fun set_attr_shape_list = TF_SetAttrShapeList(desc : X_Operationdescription, attr_name : LibC::Char*, dims : Int64T**, num_dims : LibC::Int*, num_shapes : LibC::Int)
  fun set_attr_tensor_shape_proto = TF_SetAttrTensorShapeProto(desc : X_Operationdescription, attr_name : LibC::Char*, proto : Void*, proto_len : LibC::SizeT, status : X_Status)
  fun set_attr_tensor_shape_proto_list = TF_SetAttrTensorShapeProtoList(desc : X_Operationdescription, attr_name : LibC::Char*, protos : Void**, proto_lens : LibC::SizeT*, num_shapes : LibC::Int, status : X_Status)
  fun set_attr_tensor = TF_SetAttrTensor(desc : X_Operationdescription, attr_name : LibC::Char*, value : X_Tensor, status : X_Status)
  fun set_attr_tensor_list = TF_SetAttrTensorList(desc : X_Operationdescription, attr_name : LibC::Char*, values : X_Tensor*, num_values : LibC::Int, status : X_Status)
  fun set_attr_value_proto = TF_SetAttrValueProto(desc : X_Operationdescription, attr_name : LibC::Char*, proto : Void*, proto_len : LibC::SizeT, status : X_Status)
  fun finish_operation = TF_FinishOperation(desc : X_Operationdescription, status : X_Status) : X_Operation
  fun operation_name = TF_OperationName(oper : X_Operation) : LibC::Char*
  fun operation_op_type = TF_OperationOpType(oper : X_Operation) : LibC::Char*
  fun operation_device = TF_OperationDevice(oper : X_Operation) : LibC::Char*
  fun operation_num_outputs = TF_OperationNumOutputs(oper : X_Operation) : LibC::Int
  fun operation_output_type = TF_OperationOutputType(oper_out : Output) : Datatype
  fun operation_output_list_length = TF_OperationOutputListLength(oper : X_Operation, arg_name : LibC::Char*, status : X_Status) : LibC::Int
  fun operation_num_inputs = TF_OperationNumInputs(oper : X_Operation) : LibC::Int
  fun operation_input_type = TF_OperationInputType(oper_in : Input) : Datatype
  fun operation_input_list_length = TF_OperationInputListLength(oper : X_Operation, arg_name : LibC::Char*, status : X_Status) : LibC::Int
  fun operation_input = TF_OperationInput(oper_in : Input) : Output
  fun operation_output_num_consumers = TF_OperationOutputNumConsumers(oper_out : Output) : LibC::Int
  fun operation_output_consumers = TF_OperationOutputConsumers(oper_out : Output, consumers : Input*, max_consumers : LibC::Int) : LibC::Int
  fun operation_num_control_inputs = TF_OperationNumControlInputs(oper : X_Operation) : LibC::Int
  fun operation_get_control_inputs = TF_OperationGetControlInputs(oper : X_Operation, control_inputs : X_Operation*, max_control_inputs : LibC::Int) : LibC::Int
  fun operation_num_control_outputs = TF_OperationNumControlOutputs(oper : X_Operation) : LibC::Int
  fun operation_get_control_outputs = TF_OperationGetControlOutputs(oper : X_Operation, control_outputs : X_Operation*, max_control_outputs : LibC::Int) : LibC::Int
  AttrString = 0
  AttrInt = 1
  AttrFloat = 2
  AttrBool = 3
  AttrType = 4
  AttrShape = 5
  AttrTensor = 6
  AttrPlaceholder = 7
  AttrFunc = 8
  struct Attrmetadata
    is_list : UInt8
    list_size : Int64T
    type : Attrtype
    total_size : Int64T
  end
  enum Attrtype
    AttrString = 0
    AttrInt = 1
    AttrFloat = 2
    AttrBool = 3
    AttrType = 4
    AttrShape = 5
    AttrTensor = 6
    AttrPlaceholder = 7
    AttrFunc = 8
  end
  fun operation_get_attr_metadata = TF_OperationGetAttrMetadata(oper : X_Operation, attr_name : LibC::Char*, status : X_Status) : Attrmetadata
  fun operation_get_attr_string = TF_OperationGetAttrString(oper : X_Operation, attr_name : LibC::Char*, value : Void*, max_length : LibC::SizeT, status : X_Status)
  fun operation_get_attr_string_list = TF_OperationGetAttrStringList(oper : X_Operation, attr_name : LibC::Char*, values : Void**, lengths : LibC::SizeT*, max_values : LibC::Int, storage : Void*, storage_size : LibC::SizeT, status : X_Status)
  fun operation_get_attr_int = TF_OperationGetAttrInt(oper : X_Operation, attr_name : LibC::Char*, value : Int64T*, status : X_Status)
  fun operation_get_attr_int_list = TF_OperationGetAttrIntList(oper : X_Operation, attr_name : LibC::Char*, values : Int64T*, max_values : LibC::Int, status : X_Status)
  fun operation_get_attr_float = TF_OperationGetAttrFloat(oper : X_Operation, attr_name : LibC::Char*, value : LibC::Float*, status : X_Status)
  fun operation_get_attr_float_list = TF_OperationGetAttrFloatList(oper : X_Operation, attr_name : LibC::Char*, values : LibC::Float*, max_values : LibC::Int, status : X_Status)
  fun operation_get_attr_bool = TF_OperationGetAttrBool(oper : X_Operation, attr_name : LibC::Char*, value : UInt8*, status : X_Status)
  fun operation_get_attr_bool_list = TF_OperationGetAttrBoolList(oper : X_Operation, attr_name : LibC::Char*, values : UInt8*, max_values : LibC::Int, status : X_Status)
  fun operation_get_attr_type = TF_OperationGetAttrType(oper : X_Operation, attr_name : LibC::Char*, value : Datatype*, status : X_Status)
  fun operation_get_attr_type_list = TF_OperationGetAttrTypeList(oper : X_Operation, attr_name : LibC::Char*, values : Datatype*, max_values : LibC::Int, status : X_Status)
  fun operation_get_attr_shape = TF_OperationGetAttrShape(oper : X_Operation, attr_name : LibC::Char*, value : Int64T*, num_dims : LibC::Int, status : X_Status)
  fun operation_get_attr_shape_list = TF_OperationGetAttrShapeList(oper : X_Operation, attr_name : LibC::Char*, dims : Int64T**, num_dims : LibC::Int*, num_shapes : LibC::Int, storage : Int64T*, storage_size : LibC::Int, status : X_Status)
  fun operation_get_attr_tensor_shape_proto = TF_OperationGetAttrTensorShapeProto(oper : X_Operation, attr_name : LibC::Char*, value : Buffer*, status : X_Status)
  fun operation_get_attr_tensor_shape_proto_list = TF_OperationGetAttrTensorShapeProtoList(oper : X_Operation, attr_name : LibC::Char*, values : Buffer**, max_values : LibC::Int, status : X_Status)
  fun operation_get_attr_tensor = TF_OperationGetAttrTensor(oper : X_Operation, attr_name : LibC::Char*, value : X_Tensor*, status : X_Status)
  fun operation_get_attr_tensor_list = TF_OperationGetAttrTensorList(oper : X_Operation, attr_name : LibC::Char*, values : X_Tensor*, max_values : LibC::Int, status : X_Status)
  fun operation_get_attr_value_proto = TF_OperationGetAttrValueProto(oper : X_Operation, attr_name : LibC::Char*, output_attr_value : Buffer*, status : X_Status)
  fun graph_operation_by_name = TF_GraphOperationByName(graph : X_Graph, oper_name : LibC::Char*) : X_Operation
  fun graph_next_operation = TF_GraphNextOperation(graph : X_Graph, pos : LibC::SizeT*) : X_Operation
  fun graph_to_graph_def = TF_GraphToGraphDef(graph : X_Graph, output_graph_def : Buffer*, status : X_Status)
  alias Importgraphdefoptions = Void
  fun new_import_graph_def_options = TF_NewImportGraphDefOptions : X_Importgraphdefoptions
  type X_Importgraphdefoptions = Void*
  fun delete_import_graph_def_options = TF_DeleteImportGraphDefOptions(opts : X_Importgraphdefoptions)
  fun import_graph_def_options_set_prefix = TF_ImportGraphDefOptionsSetPrefix(opts : X_Importgraphdefoptions, prefix : LibC::Char*)
  fun import_graph_def_options_add_input_mapping = TF_ImportGraphDefOptionsAddInputMapping(opts : X_Importgraphdefoptions, src_name : LibC::Char*, src_index : LibC::Int, dst : Output)
  fun import_graph_def_options_add_control_dependency = TF_ImportGraphDefOptionsAddControlDependency(opts : X_Importgraphdefoptions, oper : X_Operation)
  fun import_graph_def_options_add_return_output = TF_ImportGraphDefOptionsAddReturnOutput(opts : X_Importgraphdefoptions, oper_name : LibC::Char*, index : LibC::Int)
  fun import_graph_def_options_num_return_outputs = TF_ImportGraphDefOptionsNumReturnOutputs(opts : X_Importgraphdefoptions) : LibC::Int
  fun graph_import_graph_def_with_return_outputs = TF_GraphImportGraphDefWithReturnOutputs(graph : X_Graph, graph_def : Buffer*, options : X_Importgraphdefoptions, return_outputs : Output*, num_return_outputs : LibC::Int, status : X_Status)
  fun graph_import_graph_def = TF_GraphImportGraphDef(graph : X_Graph, graph_def : Buffer*, options : X_Importgraphdefoptions, status : X_Status)
  fun operation_to_node_def = TF_OperationToNodeDef(oper : X_Operation, output_node_def : Buffer*, status : X_Status)
  struct Whileparams
    ninputs : LibC::Int
    cond_graph : X_Graph
    cond_inputs : Output*
    cond_output : Output
    body_graph : X_Graph
    body_inputs : Output*
    body_outputs : Output*
    name : LibC::Char*
  end
  fun new_while = TF_NewWhile(g : X_Graph, inputs : Output*, ninputs : LibC::Int, status : X_Status) : Whileparams
  fun finish_while = TF_FinishWhile(params : Whileparams*, status : X_Status, outputs : Output*)
  fun abort_while = TF_AbortWhile(params : Whileparams*)
  alias Session = Void
  fun new_session = TF_NewSession(graph : X_Graph, opts : X_Sessionoptions, status : X_Status) : X_Session
  type X_Session = Void*
  fun load_session_from_saved_model = TF_LoadSessionFromSavedModel(session_options : X_Sessionoptions, run_options : Buffer*, export_dir : LibC::Char*, tags : LibC::Char**, tags_len : LibC::Int, graph : X_Graph, meta_graph_def : Buffer*, status : X_Status) : X_Session
  fun close_session = TF_CloseSession(x0 : X_Session, status : X_Status)
  fun delete_session = TF_DeleteSession(x0 : X_Session, status : X_Status)
  fun session_run = TF_SessionRun(session : X_Session, run_options : Buffer*, inputs : Output*, input_values : X_Tensor*, ninputs : LibC::Int, outputs : Output*, output_values : X_Tensor*, noutputs : LibC::Int, target_opers : X_Operation*, ntargets : LibC::Int, run_metadata : Buffer*, x11 : X_Status)
  fun session_p_run_setup = TF_SessionPRunSetup(x0 : X_Session, inputs : Output*, ninputs : LibC::Int, outputs : Output*, noutputs : LibC::Int, target_opers : X_Operation*, ntargets : LibC::Int, handle : LibC::Char**, x8 : X_Status)
  fun session_p_run = TF_SessionPRun(x0 : X_Session, handle : LibC::Char*, inputs : Output*, input_values : X_Tensor*, ninputs : LibC::Int, outputs : Output*, output_values : X_Tensor*, noutputs : LibC::Int, target_opers : X_Operation*, ntargets : LibC::Int, x10 : X_Status)
  alias Deprecatedsession = Void
  fun new_deprecated_session = TF_NewDeprecatedSession(x0 : X_Sessionoptions, status : X_Status) : X_Deprecatedsession
  type X_Deprecatedsession = Void*
  fun close_deprecated_session = TF_CloseDeprecatedSession(x0 : X_Deprecatedsession, status : X_Status)
  fun delete_deprecated_session = TF_DeleteDeprecatedSession(x0 : X_Deprecatedsession, status : X_Status)
  fun reset = TF_Reset(opt : X_Sessionoptions, containers : LibC::Char**, ncontainers : LibC::Int, status : X_Status)
  fun extend_graph = TF_ExtendGraph(x0 : X_Deprecatedsession, proto : Void*, proto_len : LibC::SizeT, x3 : X_Status)
  fun run = TF_Run(x0 : X_Deprecatedsession, run_options : Buffer*, input_names : LibC::Char**, inputs : X_Tensor*, ninputs : LibC::Int, output_names : LibC::Char**, outputs : X_Tensor*, noutputs : LibC::Int, target_oper_names : LibC::Char**, ntargets : LibC::Int, run_metadata : Buffer*, x11 : X_Status)
  fun p_run_setup = TF_PRunSetup(x0 : X_Deprecatedsession, input_names : LibC::Char**, ninputs : LibC::Int, output_names : LibC::Char**, noutputs : LibC::Int, target_oper_names : LibC::Char**, ntargets : LibC::Int, handle : LibC::Char**, x8 : X_Status)
  fun p_run = TF_PRun(x0 : X_Deprecatedsession, handle : LibC::Char*, input_names : LibC::Char**, inputs : X_Tensor*, ninputs : LibC::Int, output_names : LibC::Char**, outputs : X_Tensor*, noutputs : LibC::Int, target_oper_names : LibC::Char**, ntargets : LibC::Int, x10 : X_Status)
  alias Library = Void
  fun load_library = TF_LoadLibrary(library_filename : LibC::Char*, status : X_Status) : X_Library
  type X_Library = Void*
  fun get_op_list = TF_GetOpList(lib_handle : X_Library) : Buffer
  fun delete_library_handle = TF_DeleteLibraryHandle(lib_handle : X_Library)
  fun get_all_op_list = TF_GetAllOpList : Buffer*
end
