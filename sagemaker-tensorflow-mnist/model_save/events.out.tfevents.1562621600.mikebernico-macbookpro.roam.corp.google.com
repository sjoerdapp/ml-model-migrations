       ŁK"	   ¨íH×Abrain.Event:2,ŃZ1     ü	éĎ:¨íH×A"Íâ

global_step/Initializer/zerosConst*
value	B	 R *
_class
loc:@global_step*
dtype0	*
_output_shapes
: 

global_step
VariableV2*
dtype0	*
_output_shapes
: *
shared_name *
_class
loc:@global_step*
	container *
shape: 
˛
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
T0	*
_class
loc:@global_step*
_output_shapes
: 

!global_step/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 

global_step/cond/SwitchSwitch!global_step/IsVariableInitialized!global_step/IsVariableInitialized*
T0
*
_output_shapes
: : 
a
global_step/cond/switch_tIdentityglobal_step/cond/Switch:1*
_output_shapes
: *
T0

_
global_step/cond/switch_fIdentityglobal_step/cond/Switch*
T0
*
_output_shapes
: 
h
global_step/cond/pred_idIdentity!global_step/IsVariableInitialized*
T0
*
_output_shapes
: 
b
global_step/cond/readIdentityglobal_step/cond/read/Switch:1*
_output_shapes
: *
T0	

global_step/cond/read/Switch	RefSwitchglobal_stepglobal_step/cond/pred_id*
T0	*
_class
loc:@global_step*
_output_shapes
: : 

global_step/cond/Switch_1Switchglobal_step/Initializer/zerosglobal_step/cond/pred_id*
_output_shapes
: : *
T0	*
_class
loc:@global_step
}
global_step/cond/MergeMergeglobal_step/cond/Switch_1global_step/cond/read*
T0	*
N*
_output_shapes
: : 
S
global_step/add/yConst*
dtype0	*
_output_shapes
: *
value	B	 R 
b
global_step/addAddglobal_step/cond/Mergeglobal_step/add/y*
T0	*
_output_shapes
: 
q
ConstConst"/device:CPU:0*-
value$B" B./data/mnist_train.tfrecords*
dtype0*
_output_shapes
: 
v
flat_filenames/shapeConst"/device:CPU:0*
valueB:
˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes
:
x
flat_filenamesReshapeConstflat_filenames/shape"/device:CPU:0*
T0*
Tshape0*
_output_shapes
:

TensorSliceDatasetTensorSliceDatasetflat_filenames"/device:CPU:0*
_output_shapes
: *
output_shapes
: *
Toutput_types
2
Ő
FlatMapDatasetFlatMapDatasetTensorSliceDataset"/device:CPU:0*8
f3R1
/__inference_Dataset_flat_map_read_one_file_1028*
_output_shapes
: *
output_types
2*

Targuments
 *
output_shapes
: 


MapDataset
MapDatasetFlatMapDataset"/device:CPU:0*#
output_shapes
:: */
f*R(
&__inference_Dataset_map__parse_fn_1061*
use_inter_op_parallelism(*
output_types
2*

Targuments
 *
_output_shapes
: *
preserve_cardinality( 
]
buffer_sizeConst"/device:CPU:0*
value
B	 Rč*
dtype0	*
_output_shapes
: 
U
seedConst"/device:CPU:0*
value	B	 R *
dtype0	*
_output_shapes
: 
V
seed2Const"/device:CPU:0*
value	B	 R *
dtype0	*
_output_shapes
: 
Ę
ShuffleDatasetShuffleDataset
MapDatasetbuffer_sizeseedseed2"/device:CPU:0*
reshuffle_each_iteration(*
_output_shapes
: *
output_types
2*#
output_shapes
:: 
_
countConst"/device:CPU:0*
dtype0	*
_output_shapes
: *
valueB	 R
˙˙˙˙˙˙˙˙˙

RepeatDatasetRepeatDatasetShuffleDatasetcount"/device:CPU:0*#
output_shapes
:: *
_output_shapes
: *
output_types
2
[

batch_sizeConst"/device:CPU:0*
value	B	 Rd*
dtype0	*
_output_shapes
: 
_
drop_remainderConst"/device:CPU:0*
value	B
 Z *
dtype0
*
_output_shapes
: 
Ţ
BatchDatasetV2BatchDatasetV2RepeatDataset
batch_sizedrop_remainder"/device:CPU:0*
_output_shapes
: *
output_types
2*
parallel_copy( *=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

optimizationsConst*V
valueMBKBmap_and_batch_fusionBnoop_eliminationBshuffle_and_repeat_fusion*
dtype0*
_output_shapes
:
ř
OptimizeDatasetOptimizeDatasetBatchDatasetV2optimizations*
output_types
2*=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
_output_shapes
: *F
optimization_configs.
,*map_vectorization:use_choose_fastest:false
Ž
ModelDatasetModelDatasetOptimizeDataset*
output_types
2*=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*

cpu_budget *
_output_shapes
: 
Ť

IteratorV2
IteratorV2*
output_types
2*
shared_name *=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
_output_shapes
: *
	container 
U
MakeIteratorMakeIteratorModelDataset
IteratorV2*
_class
loc:@IteratorV2
T
IteratorToStringHandleIteratorToStringHandle
IteratorV2*
_output_shapes
: 
Ĺ
IteratorGetNextIteratorGetNext
IteratorV2*
output_types
2*=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*>
_output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
v
CastCastIteratorGetNext*

SrcT0*
Truncate( */
_output_shapes
:˙˙˙˙˙˙˙˙˙*

DstT0
n
Cast_1CastIteratorGetNext:1*

SrcT0*
Truncate( *#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

DstT0
Š
.conv2d/kernel/Initializer/random_uniform/shapeConst*%
valueB"             * 
_class
loc:@conv2d/kernel*
dtype0*
_output_shapes
:

,conv2d/kernel/Initializer/random_uniform/minConst*
valueB
 *n§Ž˝* 
_class
loc:@conv2d/kernel*
dtype0*
_output_shapes
: 

,conv2d/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *n§Ž=* 
_class
loc:@conv2d/kernel
đ
6conv2d/kernel/Initializer/random_uniform/RandomUniformRandomUniform.conv2d/kernel/Initializer/random_uniform/shape*
dtype0*&
_output_shapes
: *

seed *
T0* 
_class
loc:@conv2d/kernel*
seed2 
Ň
,conv2d/kernel/Initializer/random_uniform/subSub,conv2d/kernel/Initializer/random_uniform/max,conv2d/kernel/Initializer/random_uniform/min*
T0* 
_class
loc:@conv2d/kernel*
_output_shapes
: 
ě
,conv2d/kernel/Initializer/random_uniform/mulMul6conv2d/kernel/Initializer/random_uniform/RandomUniform,conv2d/kernel/Initializer/random_uniform/sub*
T0* 
_class
loc:@conv2d/kernel*&
_output_shapes
: 
Ţ
(conv2d/kernel/Initializer/random_uniformAdd,conv2d/kernel/Initializer/random_uniform/mul,conv2d/kernel/Initializer/random_uniform/min*
T0* 
_class
loc:@conv2d/kernel*&
_output_shapes
: 
ą
conv2d/kernelVarHandleOp* 
_class
loc:@conv2d/kernel*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_nameconv2d/kernel
k
.conv2d/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d/kernel*
_output_shapes
: 

conv2d/kernel/AssignAssignVariableOpconv2d/kernel(conv2d/kernel/Initializer/random_uniform* 
_class
loc:@conv2d/kernel*
dtype0

!conv2d/kernel/Read/ReadVariableOpReadVariableOpconv2d/kernel* 
_class
loc:@conv2d/kernel*
dtype0*&
_output_shapes
: 

conv2d/bias/Initializer/zerosConst*
valueB *    *
_class
loc:@conv2d/bias*
dtype0*
_output_shapes
: 

conv2d/biasVarHandleOp*
_class
loc:@conv2d/bias*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_nameconv2d/bias
g
,conv2d/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d/bias*
_output_shapes
: 

conv2d/bias/AssignAssignVariableOpconv2d/biasconv2d/bias/Initializer/zeros*
dtype0*
_class
loc:@conv2d/bias

conv2d/bias/Read/ReadVariableOpReadVariableOpconv2d/bias*
_class
loc:@conv2d/bias*
dtype0*
_output_shapes
: 
e
conv2d/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
r
conv2d/Conv2D/ReadVariableOpReadVariableOpconv2d/kernel*
dtype0*&
_output_shapes
: 
ü
conv2d/Conv2DConv2DCastconv2d/Conv2D/ReadVariableOp*
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ *
	dilations
*
T0*
data_formatNHWC*
strides
*
explicit_paddings
 *
use_cudnn_on_gpu(
e
conv2d/BiasAdd/ReadVariableOpReadVariableOpconv2d/bias*
dtype0*
_output_shapes
: 

conv2d/BiasAddBiasAddconv2d/Conv2Dconv2d/BiasAdd/ReadVariableOp*
T0*
data_formatNHWC*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ 
]
conv2d/ReluReluconv2d/BiasAdd*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ 
ş
max_pooling2d/MaxPoolMaxPoolconv2d/Relu*
ksize
*
paddingVALID*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ *
T0*
data_formatNHWC*
strides

­
0conv2d_1/kernel/Initializer/random_uniform/shapeConst*%
valueB"          @   *"
_class
loc:@conv2d_1/kernel*
dtype0*
_output_shapes
:

.conv2d_1/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *ÍĚL˝*"
_class
loc:@conv2d_1/kernel

.conv2d_1/kernel/Initializer/random_uniform/maxConst*
valueB
 *ÍĚL=*"
_class
loc:@conv2d_1/kernel*
dtype0*
_output_shapes
: 
ö
8conv2d_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform0conv2d_1/kernel/Initializer/random_uniform/shape*
seed2 *
dtype0*&
_output_shapes
: @*

seed *
T0*"
_class
loc:@conv2d_1/kernel
Ú
.conv2d_1/kernel/Initializer/random_uniform/subSub.conv2d_1/kernel/Initializer/random_uniform/max.conv2d_1/kernel/Initializer/random_uniform/min*
T0*"
_class
loc:@conv2d_1/kernel*
_output_shapes
: 
ô
.conv2d_1/kernel/Initializer/random_uniform/mulMul8conv2d_1/kernel/Initializer/random_uniform/RandomUniform.conv2d_1/kernel/Initializer/random_uniform/sub*
T0*"
_class
loc:@conv2d_1/kernel*&
_output_shapes
: @
ć
*conv2d_1/kernel/Initializer/random_uniformAdd.conv2d_1/kernel/Initializer/random_uniform/mul.conv2d_1/kernel/Initializer/random_uniform/min*
T0*"
_class
loc:@conv2d_1/kernel*&
_output_shapes
: @
ˇ
conv2d_1/kernelVarHandleOp*
dtype0*
_output_shapes
: * 
shared_nameconv2d_1/kernel*"
_class
loc:@conv2d_1/kernel*
	container *
shape: @
o
0conv2d_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d_1/kernel*
_output_shapes
: 

conv2d_1/kernel/AssignAssignVariableOpconv2d_1/kernel*conv2d_1/kernel/Initializer/random_uniform*"
_class
loc:@conv2d_1/kernel*
dtype0

#conv2d_1/kernel/Read/ReadVariableOpReadVariableOpconv2d_1/kernel*"
_class
loc:@conv2d_1/kernel*
dtype0*&
_output_shapes
: @

conv2d_1/bias/Initializer/zerosConst*
valueB@*    * 
_class
loc:@conv2d_1/bias*
dtype0*
_output_shapes
:@
Ľ
conv2d_1/biasVarHandleOp*
shape:@*
dtype0*
_output_shapes
: *
shared_nameconv2d_1/bias* 
_class
loc:@conv2d_1/bias*
	container 
k
.conv2d_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d_1/bias*
_output_shapes
: 

conv2d_1/bias/AssignAssignVariableOpconv2d_1/biasconv2d_1/bias/Initializer/zeros*
dtype0* 
_class
loc:@conv2d_1/bias

!conv2d_1/bias/Read/ReadVariableOpReadVariableOpconv2d_1/bias*
dtype0*
_output_shapes
:@* 
_class
loc:@conv2d_1/bias
g
conv2d_1/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
v
conv2d_1/Conv2D/ReadVariableOpReadVariableOpconv2d_1/kernel*
dtype0*&
_output_shapes
: @

conv2d_1/Conv2DConv2Dmax_pooling2d/MaxPoolconv2d_1/Conv2D/ReadVariableOp*
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@*
	dilations
*
T0*
data_formatNHWC*
strides
*
explicit_paddings
 *
use_cudnn_on_gpu(
i
conv2d_1/BiasAdd/ReadVariableOpReadVariableOpconv2d_1/bias*
dtype0*
_output_shapes
:@

conv2d_1/BiasAddBiasAddconv2d_1/Conv2Dconv2d_1/BiasAdd/ReadVariableOp*
T0*
data_formatNHWC*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
a
conv2d_1/ReluReluconv2d_1/BiasAdd*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
ž
max_pooling2d_1/MaxPoolMaxPoolconv2d_1/Relu*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@*
T0*
data_formatNHWC*
strides
*
ksize
*
paddingVALID
d
flatten/ShapeShapemax_pooling2d_1/MaxPool*
_output_shapes
:*
T0*
out_type0
e
flatten/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
g
flatten/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
g
flatten/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Ą
flatten/strided_sliceStridedSliceflatten/Shapeflatten/strided_slice/stackflatten/strided_slice/stack_1flatten/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
b
flatten/Reshape/shape/1Const*
valueB :
˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes
: 

flatten/Reshape/shapePackflatten/strided_sliceflatten/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:

flatten/ReshapeReshapemax_pooling2d_1/MaxPoolflatten/Reshape/shape*
T0*
Tshape0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Ŕ

-dense/kernel/Initializer/random_uniform/shapeConst*
valueB"@     *
_class
loc:@dense/kernel*
dtype0*
_output_shapes
:

+dense/kernel/Initializer/random_uniform/minConst*
valueB
 *˝*
_class
loc:@dense/kernel*
dtype0*
_output_shapes
: 

+dense/kernel/Initializer/random_uniform/maxConst*
valueB
 *=*
_class
loc:@dense/kernel*
dtype0*
_output_shapes
: 
ç
5dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform-dense/kernel/Initializer/random_uniform/shape*
dtype0* 
_output_shapes
:
Ŕ*

seed *
T0*
_class
loc:@dense/kernel*
seed2 
Î
+dense/kernel/Initializer/random_uniform/subSub+dense/kernel/Initializer/random_uniform/max+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel*
_output_shapes
: 
â
+dense/kernel/Initializer/random_uniform/mulMul5dense/kernel/Initializer/random_uniform/RandomUniform+dense/kernel/Initializer/random_uniform/sub*
T0*
_class
loc:@dense/kernel* 
_output_shapes
:
Ŕ
Ô
'dense/kernel/Initializer/random_uniformAdd+dense/kernel/Initializer/random_uniform/mul+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel* 
_output_shapes
:
Ŕ
¨
dense/kernelVarHandleOp*
dtype0*
_output_shapes
: *
shared_namedense/kernel*
_class
loc:@dense/kernel*
	container *
shape:
Ŕ
i
-dense/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense/kernel*
_output_shapes
: 

dense/kernel/AssignAssignVariableOpdense/kernel'dense/kernel/Initializer/random_uniform*
_class
loc:@dense/kernel*
dtype0

 dense/kernel/Read/ReadVariableOpReadVariableOpdense/kernel*
_class
loc:@dense/kernel*
dtype0* 
_output_shapes
:
Ŕ

,dense/bias/Initializer/zeros/shape_as_tensorConst*
valueB:*
_class
loc:@dense/bias*
dtype0*
_output_shapes
:

"dense/bias/Initializer/zeros/ConstConst*
valueB
 *    *
_class
loc:@dense/bias*
dtype0*
_output_shapes
: 
Í
dense/bias/Initializer/zerosFill,dense/bias/Initializer/zeros/shape_as_tensor"dense/bias/Initializer/zeros/Const*
_output_shapes	
:*
T0*

index_type0*
_class
loc:@dense/bias


dense/biasVarHandleOp*
	container *
shape:*
dtype0*
_output_shapes
: *
shared_name
dense/bias*
_class
loc:@dense/bias
e
+dense/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOp
dense/bias*
_output_shapes
: 
{
dense/bias/AssignAssignVariableOp
dense/biasdense/bias/Initializer/zeros*
_class
loc:@dense/bias*
dtype0

dense/bias/Read/ReadVariableOpReadVariableOp
dense/bias*
_class
loc:@dense/bias*
dtype0*
_output_shapes	
:
j
dense/MatMul/ReadVariableOpReadVariableOpdense/kernel*
dtype0* 
_output_shapes
:
Ŕ

dense/MatMulMatMulflatten/Reshapedense/MatMul/ReadVariableOp*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_a( *
transpose_b( 
d
dense/BiasAdd/ReadVariableOpReadVariableOp
dense/bias*
dtype0*
_output_shapes	
:

dense/BiasAddBiasAdddense/MatMuldense/BiasAdd/ReadVariableOp*
data_formatNHWC*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
T

dense/ReluReludense/BiasAdd*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
Y
dropout/dropout/rateConst*
valueB
 *ÍĚĚ>*
dtype0*
_output_shapes
: 
_
dropout/dropout/ShapeShape
dense/Relu*
T0*
out_type0*
_output_shapes
:
g
"dropout/dropout/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *    
g
"dropout/dropout/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
­
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape*
T0*
dtype0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
seed2 *

seed 

"dropout/dropout/random_uniform/subSub"dropout/dropout/random_uniform/max"dropout/dropout/random_uniform/min*
_output_shapes
: *
T0
Ž
"dropout/dropout/random_uniform/mulMul,dropout/dropout/random_uniform/RandomUniform"dropout/dropout/random_uniform/sub*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
dropout/dropout/random_uniformAdd"dropout/dropout/random_uniform/mul"dropout/dropout/random_uniform/min*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
Z
dropout/dropout/sub/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
h
dropout/dropout/subSubdropout/dropout/sub/xdropout/dropout/rate*
T0*
_output_shapes
: 
^
dropout/dropout/truediv/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
s
dropout/dropout/truedivRealDivdropout/dropout/truediv/xdropout/dropout/sub*
T0*
_output_shapes
: 

dropout/dropout/GreaterEqualGreaterEqualdropout/dropout/random_uniformdropout/dropout/rate*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
r
dropout/dropout/mulMul
dense/Reludropout/dropout/truediv*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

dropout/dropout/CastCastdropout/dropout/GreaterEqual*

SrcT0
*
Truncate( *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*

DstT0
z
dropout/dropout/mul_1Muldropout/dropout/muldropout/dropout/Cast*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ł
/dense_1/kernel/Initializer/random_uniform/shapeConst*
valueB"   
   *!
_class
loc:@dense_1/kernel*
dtype0*
_output_shapes
:

-dense_1/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *č˝*!
_class
loc:@dense_1/kernel

-dense_1/kernel/Initializer/random_uniform/maxConst*
valueB
 *č=*!
_class
loc:@dense_1/kernel*
dtype0*
_output_shapes
: 
ě
7dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_1/kernel/Initializer/random_uniform/shape*
T0*!
_class
loc:@dense_1/kernel*
seed2 *
dtype0*
_output_shapes
:	
*

seed 
Ö
-dense_1/kernel/Initializer/random_uniform/subSub-dense_1/kernel/Initializer/random_uniform/max-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
: 
é
-dense_1/kernel/Initializer/random_uniform/mulMul7dense_1/kernel/Initializer/random_uniform/RandomUniform-dense_1/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
:	

Ű
)dense_1/kernel/Initializer/random_uniformAdd-dense_1/kernel/Initializer/random_uniform/mul-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
:	

­
dense_1/kernelVarHandleOp*
shared_namedense_1/kernel*!
_class
loc:@dense_1/kernel*
	container *
shape:	
*
dtype0*
_output_shapes
: 
m
/dense_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_1/kernel*
_output_shapes
: 

dense_1/kernel/AssignAssignVariableOpdense_1/kernel)dense_1/kernel/Initializer/random_uniform*
dtype0*!
_class
loc:@dense_1/kernel

"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel*!
_class
loc:@dense_1/kernel*
dtype0*
_output_shapes
:	


dense_1/bias/Initializer/zerosConst*
valueB
*    *
_class
loc:@dense_1/bias*
dtype0*
_output_shapes
:

˘
dense_1/biasVarHandleOp*
shape:
*
dtype0*
_output_shapes
: *
shared_namedense_1/bias*
_class
loc:@dense_1/bias*
	container 
i
-dense_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_1/bias*
_output_shapes
: 

dense_1/bias/AssignAssignVariableOpdense_1/biasdense_1/bias/Initializer/zeros*
_class
loc:@dense_1/bias*
dtype0

 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_class
loc:@dense_1/bias*
dtype0*
_output_shapes
:

m
dense_1/MatMul/ReadVariableOpReadVariableOpdense_1/kernel*
dtype0*
_output_shapes
:	

Ś
dense_1/MatMulMatMuldropout/dropout/mul_1dense_1/MatMul/ReadVariableOp*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
transpose_a( *
transpose_b( 
g
dense_1/BiasAdd/ReadVariableOpReadVariableOpdense_1/bias*
dtype0*
_output_shapes
:


dense_1/BiasAddBiasAdddense_1/MatMuldense_1/BiasAdd/ReadVariableOp*
data_formatNHWC*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
]
dense_1/SoftmaxSoftmaxdense_1/BiasAdd*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0

)Adam/iterations/Initializer/initial_valueConst*
value	B	 R *"
_class
loc:@Adam/iterations*
dtype0	*
_output_shapes
: 
§
Adam/iterationsVarHandleOp*
dtype0	*
_output_shapes
: * 
shared_nameAdam/iterations*"
_class
loc:@Adam/iterations*
	container *
shape: 
o
0Adam/iterations/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/iterations*
_output_shapes
: 

Adam/iterations/AssignAssignVariableOpAdam/iterations)Adam/iterations/Initializer/initial_value*"
_class
loc:@Adam/iterations*
dtype0	

#Adam/iterations/Read/ReadVariableOpReadVariableOpAdam/iterations*"
_class
loc:@Adam/iterations*
dtype0	*
_output_shapes
: 

!Adam/lr/Initializer/initial_valueConst*
valueB
 *ÍĚĚ=*
_class
loc:@Adam/lr*
dtype0*
_output_shapes
: 

Adam/lrVarHandleOp*
dtype0*
_output_shapes
: *
shared_name	Adam/lr*
_class
loc:@Adam/lr*
	container *
shape: 
_
(Adam/lr/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/lr*
_output_shapes
: 
w
Adam/lr/AssignAssignVariableOpAdam/lr!Adam/lr/Initializer/initial_value*
_class
loc:@Adam/lr*
dtype0
w
Adam/lr/Read/ReadVariableOpReadVariableOpAdam/lr*
_class
loc:@Adam/lr*
dtype0*
_output_shapes
: 

%Adam/beta_1/Initializer/initial_valueConst*
valueB
 *fff?*
_class
loc:@Adam/beta_1*
dtype0*
_output_shapes
: 

Adam/beta_1VarHandleOp*
shared_nameAdam/beta_1*
_class
loc:@Adam/beta_1*
	container *
shape: *
dtype0*
_output_shapes
: 
g
,Adam/beta_1/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/beta_1*
_output_shapes
: 

Adam/beta_1/AssignAssignVariableOpAdam/beta_1%Adam/beta_1/Initializer/initial_value*
_class
loc:@Adam/beta_1*
dtype0

Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_class
loc:@Adam/beta_1*
dtype0*
_output_shapes
: 

%Adam/beta_2/Initializer/initial_valueConst*
valueB
 *wž?*
_class
loc:@Adam/beta_2*
dtype0*
_output_shapes
: 

Adam/beta_2VarHandleOp*
_class
loc:@Adam/beta_2*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_nameAdam/beta_2
g
,Adam/beta_2/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/beta_2*
_output_shapes
: 

Adam/beta_2/AssignAssignVariableOpAdam/beta_2%Adam/beta_2/Initializer/initial_value*
dtype0*
_class
loc:@Adam/beta_2

Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: *
_class
loc:@Adam/beta_2

$Adam/decay/Initializer/initial_valueConst*
valueB
 *    *
_class
loc:@Adam/decay*
dtype0*
_output_shapes
: 


Adam/decayVarHandleOp*
dtype0*
_output_shapes
: *
shared_name
Adam/decay*
_class
loc:@Adam/decay*
	container *
shape: 
e
+Adam/decay/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Adam/decay*
_output_shapes
: 

Adam/decay/AssignAssignVariableOp
Adam/decay$Adam/decay/Initializer/initial_value*
_class
loc:@Adam/decay*
dtype0

Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_class
loc:@Adam/decay*
dtype0*
_output_shapes
: 
v
total/Initializer/zerosConst*
valueB
 *    *
_class

loc:@total*
dtype0*
_output_shapes
: 

totalVarHandleOp*
shared_nametotal*
_class

loc:@total*
	container *
shape: *
dtype0*
_output_shapes
: 
[
&total/IsInitialized/VarIsInitializedOpVarIsInitializedOptotal*
_output_shapes
: 
g
total/AssignAssignVariableOptotaltotal/Initializer/zeros*
dtype0*
_class

loc:@total
q
total/Read/ReadVariableOpReadVariableOptotal*
dtype0*
_output_shapes
: *
_class

loc:@total
z
count_1/Initializer/zerosConst*
valueB
 *    *
_class
loc:@count_1*
dtype0*
_output_shapes
: 

count_1VarHandleOp*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name	count_1*
_class
loc:@count_1
_
(count_1/IsInitialized/VarIsInitializedOpVarIsInitializedOpcount_1*
_output_shapes
: 
o
count_1/AssignAssignVariableOpcount_1count_1/Initializer/zeros*
_class
loc:@count_1*
dtype0
w
count_1/Read/ReadVariableOpReadVariableOpcount_1*
dtype0*
_output_shapes
: *
_class
loc:@count_1
g
metrics/acc/ArgMax/dimensionConst*
valueB :
˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes
: 

metrics/acc/ArgMaxArgMaxdense_1/Softmaxmetrics/acc/ArgMax/dimension*

Tidx0*
T0*
output_type0	*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
y
metrics/acc/CastCastmetrics/acc/ArgMax*
Truncate( *#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

DstT0*

SrcT0	
b
metrics/acc/EqualEqualCast_1metrics/acc/Cast*
T0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
z
metrics/acc/Cast_1Castmetrics/acc/Equal*

SrcT0
*
Truncate( *#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

DstT0
[
metrics/acc/ConstConst*
valueB: *
dtype0*
_output_shapes
:
{
metrics/acc/SumSummetrics/acc/Cast_1metrics/acc/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
[
metrics/acc/AssignAddVariableOpAssignAddVariableOptotalmetrics/acc/Sum*
dtype0

metrics/acc/ReadVariableOpReadVariableOptotal ^metrics/acc/AssignAddVariableOp^metrics/acc/Sum*
dtype0*
_output_shapes
: 
]
metrics/acc/SizeSizemetrics/acc/Cast_1*
T0*
out_type0*
_output_shapes
: 
l
metrics/acc/Cast_2Castmetrics/acc/Size*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0

!metrics/acc/AssignAddVariableOp_1AssignAddVariableOpcount_1metrics/acc/Cast_2 ^metrics/acc/AssignAddVariableOp*
dtype0
˘
metrics/acc/ReadVariableOp_1ReadVariableOpcount_1 ^metrics/acc/AssignAddVariableOp"^metrics/acc/AssignAddVariableOp_1*
dtype0*
_output_shapes
: 

%metrics/acc/div_no_nan/ReadVariableOpReadVariableOptotal"^metrics/acc/AssignAddVariableOp_1*
dtype0*
_output_shapes
: 

'metrics/acc/div_no_nan/ReadVariableOp_1ReadVariableOpcount_1"^metrics/acc/AssignAddVariableOp_1*
dtype0*
_output_shapes
: 

metrics/acc/div_no_nanDivNoNan%metrics/acc/div_no_nan/ReadVariableOp'metrics/acc/div_no_nan/ReadVariableOp_1*
_output_shapes
: *
T0
Y
metrics/acc/IdentityIdentitymetrics/acc/div_no_nan*
T0*
_output_shapes
: 
r
loss/dense_1_loss/Reshape/shapeConst*
valueB:
˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes
:

loss/dense_1_loss/ReshapeReshapeCast_1loss/dense_1_loss/Reshape/shape*
T0*
Tshape0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙

loss/dense_1_loss/CastCastloss/dense_1_loss/Reshape*
Truncate( *#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

DstT0	*

SrcT0
r
!loss/dense_1_loss/Reshape_1/shapeConst*
valueB"˙˙˙˙
   *
dtype0*
_output_shapes
:

loss/dense_1_loss/Reshape_1Reshapedense_1/BiasAdd!loss/dense_1_loss/Reshape_1/shape*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0*
Tshape0

;loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/ShapeShapeloss/dense_1_loss/Cast*
T0	*
out_type0*
_output_shapes
:

Yloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits#SparseSoftmaxCrossEntropyWithLogitsloss/dense_1_loss/Reshape_1loss/dense_1_loss/Cast*
T0*6
_output_shapes$
":˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
*
Tlabels0	
j
%loss/dense_1_loss/weighted_loss/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

Tloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/shapeConst*
dtype0*
_output_shapes
: *
valueB 

Sloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 
ě
Sloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/shapeShapeYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*
out_type0*
_output_shapes
:

Rloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
j
bloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
ż
Aloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/ShapeShapeYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogitsc^loss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success*
T0*
out_type0*
_output_shapes
:
ë
Aloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/ConstConstc^loss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB
 *  ?*
dtype0*
_output_shapes
: 

;loss/dense_1_loss/weighted_loss/broadcast_weights/ones_likeFillAloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/ShapeAloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/Const*
T0*

index_type0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ę
1loss/dense_1_loss/weighted_loss/broadcast_weightsMul%loss/dense_1_loss/weighted_loss/Const;loss/dense_1_loss/weighted_loss/broadcast_weights/ones_like*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
ć
#loss/dense_1_loss/weighted_loss/MulMulYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits1loss/dense_1_loss/weighted_loss/broadcast_weights*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
a
loss/dense_1_loss/ConstConst*
valueB: *
dtype0*
_output_shapes
:

loss/dense_1_loss/SumSum#loss/dense_1_loss/weighted_loss/Mulloss/dense_1_loss/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
|
loss/dense_1_loss/num_elementsSize#loss/dense_1_loss/weighted_loss/Mul*
T0*
out_type0*
_output_shapes
: 

#loss/dense_1_loss/num_elements/CastCastloss/dense_1_loss/num_elements*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
\
loss/dense_1_loss/Const_1Const*
valueB *
dtype0*
_output_shapes
: 

loss/dense_1_loss/Sum_1Sumloss/dense_1_loss/Sumloss/dense_1_loss/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0

loss/dense_1_loss/valueDivNoNanloss/dense_1_loss/Sum_1#loss/dense_1_loss/num_elements/Cast*
T0*
_output_shapes
: 
O

loss/mul/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
U
loss/mulMul
loss/mul/xloss/dense_1_loss/value*
T0*
_output_shapes
: 
x
training/gradients/ShapeConst*
valueB *
_class
loc:@loss/mul*
dtype0*
_output_shapes
: 
~
training/gradients/grad_ys_0Const*
valueB
 *  ?*
_class
loc:@loss/mul*
dtype0*
_output_shapes
: 
§
training/gradients/FillFilltraining/gradients/Shapetraining/gradients/grad_ys_0*
T0*

index_type0*
_class
loc:@loss/mul*
_output_shapes
: 

$training/gradients/loss/mul_grad/MulMultraining/gradients/Fillloss/dense_1_loss/value*
T0*
_class
loc:@loss/mul*
_output_shapes
: 

&training/gradients/loss/mul_grad/Mul_1Multraining/gradients/Fill
loss/mul/x*
_output_shapes
: *
T0*
_class
loc:@loss/mul
¤
5training/gradients/loss/dense_1_loss/value_grad/ShapeConst*
valueB **
_class 
loc:@loss/dense_1_loss/value*
dtype0*
_output_shapes
: 
Ś
7training/gradients/loss/dense_1_loss/value_grad/Shape_1Const*
dtype0*
_output_shapes
: *
valueB **
_class 
loc:@loss/dense_1_loss/value
ˇ
Etraining/gradients/loss/dense_1_loss/value_grad/BroadcastGradientArgsBroadcastGradientArgs5training/gradients/loss/dense_1_loss/value_grad/Shape7training/gradients/loss/dense_1_loss/value_grad/Shape_1*
T0**
_class 
loc:@loss/dense_1_loss/value*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
ŕ
:training/gradients/loss/dense_1_loss/value_grad/div_no_nanDivNoNan&training/gradients/loss/mul_grad/Mul_1#loss/dense_1_loss/num_elements/Cast*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
§
3training/gradients/loss/dense_1_loss/value_grad/SumSum:training/gradients/loss/dense_1_loss/value_grad/div_no_nanEtraining/gradients/loss/dense_1_loss/value_grad/BroadcastGradientArgs*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0**
_class 
loc:@loss/dense_1_loss/value

7training/gradients/loss/dense_1_loss/value_grad/ReshapeReshape3training/gradients/loss/dense_1_loss/value_grad/Sum5training/gradients/loss/dense_1_loss/value_grad/Shape*
T0*
Tshape0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
 
3training/gradients/loss/dense_1_loss/value_grad/NegNegloss/dense_1_loss/Sum_1*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
ď
<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_1DivNoNan3training/gradients/loss/dense_1_loss/value_grad/Neg#loss/dense_1_loss/num_elements/Cast*
_output_shapes
: *
T0**
_class 
loc:@loss/dense_1_loss/value
ř
<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_2DivNoNan<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_1#loss/dense_1_loss/num_elements/Cast*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
í
3training/gradients/loss/dense_1_loss/value_grad/mulMul&training/gradients/loss/mul_grad/Mul_1<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_2*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
¤
5training/gradients/loss/dense_1_loss/value_grad/Sum_1Sum3training/gradients/loss/dense_1_loss/value_grad/mulGtraining/gradients/loss/dense_1_loss/value_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 

9training/gradients/loss/dense_1_loss/value_grad/Reshape_1Reshape5training/gradients/loss/dense_1_loss/value_grad/Sum_17training/gradients/loss/dense_1_loss/value_grad/Shape_1*
T0*
Tshape0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
Ź
=training/gradients/loss/dense_1_loss/Sum_1_grad/Reshape/shapeConst*
valueB **
_class 
loc:@loss/dense_1_loss/Sum_1*
dtype0*
_output_shapes
: 

7training/gradients/loss/dense_1_loss/Sum_1_grad/ReshapeReshape7training/gradients/loss/dense_1_loss/value_grad/Reshape=training/gradients/loss/dense_1_loss/Sum_1_grad/Reshape/shape*
T0*
Tshape0**
_class 
loc:@loss/dense_1_loss/Sum_1*
_output_shapes
: 
¤
5training/gradients/loss/dense_1_loss/Sum_1_grad/ConstConst*
valueB **
_class 
loc:@loss/dense_1_loss/Sum_1*
dtype0*
_output_shapes
: 

4training/gradients/loss/dense_1_loss/Sum_1_grad/TileTile7training/gradients/loss/dense_1_loss/Sum_1_grad/Reshape5training/gradients/loss/dense_1_loss/Sum_1_grad/Const*
T0**
_class 
loc:@loss/dense_1_loss/Sum_1*
_output_shapes
: *

Tmultiples0
Ż
;training/gradients/loss/dense_1_loss/Sum_grad/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:*(
_class
loc:@loss/dense_1_loss/Sum

5training/gradients/loss/dense_1_loss/Sum_grad/ReshapeReshape4training/gradients/loss/dense_1_loss/Sum_1_grad/Tile;training/gradients/loss/dense_1_loss/Sum_grad/Reshape/shape*
_output_shapes
:*
T0*
Tshape0*(
_class
loc:@loss/dense_1_loss/Sum
Ŕ
3training/gradients/loss/dense_1_loss/Sum_grad/ShapeShape#loss/dense_1_loss/weighted_loss/Mul*
T0*
out_type0*(
_class
loc:@loss/dense_1_loss/Sum*
_output_shapes
:

2training/gradients/loss/dense_1_loss/Sum_grad/TileTile5training/gradients/loss/dense_1_loss/Sum_grad/Reshape3training/gradients/loss/dense_1_loss/Sum_grad/Shape*

Tmultiples0*
T0*(
_class
loc:@loss/dense_1_loss/Sum*#
_output_shapes
:˙˙˙˙˙˙˙˙˙

Atraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/ShapeShapeYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*
out_type0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
_output_shapes
:
ě
Ctraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape_1Shape1loss/dense_1_loss/weighted_loss/broadcast_weights*
T0*
out_type0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
_output_shapes
:
ç
Qtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/ShapeCtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape_1*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/MulMul2training/gradients/loss/dense_1_loss/Sum_grad/Tile1loss/dense_1_loss/weighted_loss/broadcast_weights*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ň
?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/SumSum?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/MulQtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/BroadcastGradientArgs*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul
Ć
Ctraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/ReshapeReshape?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/SumAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape*
T0*
Tshape0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
˝
Atraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Mul_1MulYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits2training/gradients/loss/dense_1_loss/Sum_grad/Tile*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul
Ř
Atraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Sum_1SumAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Mul_1Straining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/BroadcastGradientArgs:1*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
_output_shapes
:*

Tidx0*
	keep_dims( 
Ě
Etraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Reshape_1ReshapeAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Sum_1Ctraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape_1*
T0*
Tshape0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
§
training/gradients/zeros_like	ZerosLike[loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

É
training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradientPreventGradient[loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*´
message¨ĽCurrently there is no way to take the second derivative of sparse_softmax_cross_entropy_with_logits due to the fused implementation's interaction with tf.gradients()*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

ş
training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dimConst*
valueB :
˙˙˙˙˙˙˙˙˙*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
dtype0*
_output_shapes
: 
ţ
|training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims
ExpandDimsCtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Reshapetraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tdim0*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits

utraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mulMul|training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDimstraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradient*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

¸
9training/gradients/loss/dense_1_loss/Reshape_1_grad/ShapeShapedense_1/BiasAdd*
T0*
out_type0*.
_class$
" loc:@loss/dense_1_loss/Reshape_1*
_output_shapes
:
č
;training/gradients/loss/dense_1_loss/Reshape_1_grad/ReshapeReshapeutraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul9training/gradients/loss/dense_1_loss/Reshape_1_grad/Shape*
T0*
Tshape0*.
_class$
" loc:@loss/dense_1_loss/Reshape_1*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

ß
3training/gradients/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad;training/gradients/loss/dense_1_loss/Reshape_1_grad/Reshape*
T0*"
_class
loc:@dense_1/BiasAdd*
data_formatNHWC*
_output_shapes
:


-training/gradients/dense_1/MatMul_grad/MatMulMatMul;training/gradients/loss/dense_1_loss/Reshape_1_grad/Reshapedense_1/MatMul/ReadVariableOp*
T0*!
_class
loc:@dense_1/MatMul*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_a( *
transpose_b(

/training/gradients/dense_1/MatMul_grad/MatMul_1MatMuldropout/dropout/mul_1;training/gradients/loss/dense_1_loss/Reshape_1_grad/Reshape*
transpose_b( *
T0*!
_class
loc:@dense_1/MatMul*
_output_shapes
:	
*
transpose_a(
°
3training/gradients/dropout/dropout/mul_1_grad/ShapeShapedropout/dropout/mul*
T0*
out_type0*(
_class
loc:@dropout/dropout/mul_1*
_output_shapes
:
ł
5training/gradients/dropout/dropout/mul_1_grad/Shape_1Shapedropout/dropout/Cast*
T0*
out_type0*(
_class
loc:@dropout/dropout/mul_1*
_output_shapes
:
Ż
Ctraining/gradients/dropout/dropout/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgs3training/gradients/dropout/dropout/mul_1_grad/Shape5training/gradients/dropout/dropout/mul_1_grad/Shape_1*
T0*(
_class
loc:@dropout/dropout/mul_1*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ú
1training/gradients/dropout/dropout/mul_1_grad/MulMul-training/gradients/dense_1/MatMul_grad/MatMuldropout/dropout/Cast*
T0*(
_class
loc:@dropout/dropout/mul_1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

1training/gradients/dropout/dropout/mul_1_grad/SumSum1training/gradients/dropout/dropout/mul_1_grad/MulCtraining/gradients/dropout/dropout/mul_1_grad/BroadcastGradientArgs*
T0*(
_class
loc:@dropout/dropout/mul_1*
_output_shapes
:*

Tidx0*
	keep_dims( 

5training/gradients/dropout/dropout/mul_1_grad/ReshapeReshape1training/gradients/dropout/dropout/mul_1_grad/Sum3training/gradients/dropout/dropout/mul_1_grad/Shape*
T0*
Tshape0*(
_class
loc:@dropout/dropout/mul_1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ű
3training/gradients/dropout/dropout/mul_1_grad/Mul_1Muldropout/dropout/mul-training/gradients/dense_1/MatMul_grad/MatMul*
T0*(
_class
loc:@dropout/dropout/mul_1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
3training/gradients/dropout/dropout/mul_1_grad/Sum_1Sum3training/gradients/dropout/dropout/mul_1_grad/Mul_1Etraining/gradients/dropout/dropout/mul_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0*(
_class
loc:@dropout/dropout/mul_1*
_output_shapes
:

7training/gradients/dropout/dropout/mul_1_grad/Reshape_1Reshape3training/gradients/dropout/dropout/mul_1_grad/Sum_15training/gradients/dropout/dropout/mul_1_grad/Shape_1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*
Tshape0*(
_class
loc:@dropout/dropout/mul_1
Ł
1training/gradients/dropout/dropout/mul_grad/ShapeShape
dense/Relu*
T0*
out_type0*&
_class
loc:@dropout/dropout/mul*
_output_shapes
:

3training/gradients/dropout/dropout/mul_grad/Shape_1Const*
valueB *&
_class
loc:@dropout/dropout/mul*
dtype0*
_output_shapes
: 
§
Atraining/gradients/dropout/dropout/mul_grad/BroadcastGradientArgsBroadcastGradientArgs1training/gradients/dropout/dropout/mul_grad/Shape3training/gradients/dropout/dropout/mul_grad/Shape_1*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
T0*&
_class
loc:@dropout/dropout/mul
á
/training/gradients/dropout/dropout/mul_grad/MulMul5training/gradients/dropout/dropout/mul_1_grad/Reshapedropout/dropout/truediv*
T0*&
_class
loc:@dropout/dropout/mul*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

/training/gradients/dropout/dropout/mul_grad/SumSum/training/gradients/dropout/dropout/mul_grad/MulAtraining/gradients/dropout/dropout/mul_grad/BroadcastGradientArgs*
T0*&
_class
loc:@dropout/dropout/mul*
_output_shapes
:*

Tidx0*
	keep_dims( 

3training/gradients/dropout/dropout/mul_grad/ReshapeReshape/training/gradients/dropout/dropout/mul_grad/Sum1training/gradients/dropout/dropout/mul_grad/Shape*
T0*
Tshape0*&
_class
loc:@dropout/dropout/mul*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ö
1training/gradients/dropout/dropout/mul_grad/Mul_1Mul
dense/Relu5training/gradients/dropout/dropout/mul_1_grad/Reshape*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*&
_class
loc:@dropout/dropout/mul

1training/gradients/dropout/dropout/mul_grad/Sum_1Sum1training/gradients/dropout/dropout/mul_grad/Mul_1Ctraining/gradients/dropout/dropout/mul_grad/BroadcastGradientArgs:1*
T0*&
_class
loc:@dropout/dropout/mul*
_output_shapes
:*

Tidx0*
	keep_dims( 
˙
5training/gradients/dropout/dropout/mul_grad/Reshape_1Reshape1training/gradients/dropout/dropout/mul_grad/Sum_13training/gradients/dropout/dropout/mul_grad/Shape_1*
_output_shapes
: *
T0*
Tshape0*&
_class
loc:@dropout/dropout/mul
Ę
+training/gradients/dense/Relu_grad/ReluGradReluGrad3training/gradients/dropout/dropout/mul_grad/Reshape
dense/Relu*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*
_class
loc:@dense/Relu
Ě
1training/gradients/dense/BiasAdd_grad/BiasAddGradBiasAddGrad+training/gradients/dense/Relu_grad/ReluGrad*
T0* 
_class
loc:@dense/BiasAdd*
data_formatNHWC*
_output_shapes	
:
ů
+training/gradients/dense/MatMul_grad/MatMulMatMul+training/gradients/dense/Relu_grad/ReluGraddense/MatMul/ReadVariableOp*
transpose_b(*
T0*
_class
loc:@dense/MatMul*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Ŕ*
transpose_a( 
ç
-training/gradients/dense/MatMul_grad/MatMul_1MatMulflatten/Reshape+training/gradients/dense/Relu_grad/ReluGrad*
T0*
_class
loc:@dense/MatMul* 
_output_shapes
:
Ŕ*
transpose_a(*
transpose_b( 
¨
-training/gradients/flatten/Reshape_grad/ShapeShapemax_pooling2d_1/MaxPool*
T0*
out_type0*"
_class
loc:@flatten/Reshape*
_output_shapes
:

/training/gradients/flatten/Reshape_grad/ReshapeReshape+training/gradients/dense/MatMul_grad/MatMul-training/gradients/flatten/Reshape_grad/Shape*
T0*
Tshape0*"
_class
loc:@flatten/Reshape*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
Ü
;training/gradients/max_pooling2d_1/MaxPool_grad/MaxPoolGradMaxPoolGradconv2d_1/Relumax_pooling2d_1/MaxPool/training/gradients/flatten/Reshape_grad/Reshape*
T0**
_class 
loc:@max_pooling2d_1/MaxPool*
data_formatNHWC*
strides
*
ksize
*
paddingVALID*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
â
.training/gradients/conv2d_1/Relu_grad/ReluGradReluGrad;training/gradients/max_pooling2d_1/MaxPool_grad/MaxPoolGradconv2d_1/Relu*
T0* 
_class
loc:@conv2d_1/Relu*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
Ô
4training/gradients/conv2d_1/BiasAdd_grad/BiasAddGradBiasAddGrad.training/gradients/conv2d_1/Relu_grad/ReluGrad*
data_formatNHWC*
_output_shapes
:@*
T0*#
_class
loc:@conv2d_1/BiasAdd
×
.training/gradients/conv2d_1/Conv2D_grad/ShapeNShapeNmax_pooling2d/MaxPoolconv2d_1/Conv2D/ReadVariableOp*
T0*
out_type0*"
_class
loc:@conv2d_1/Conv2D*
N* 
_output_shapes
::
ˇ
;training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput.training/gradients/conv2d_1/Conv2D_grad/ShapeNconv2d_1/Conv2D/ReadVariableOp.training/gradients/conv2d_1/Relu_grad/ReluGrad*
	dilations
*
T0*"
_class
loc:@conv2d_1/Conv2D*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ 
Š
<training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFiltermax_pooling2d/MaxPool0training/gradients/conv2d_1/Conv2D_grad/ShapeN:1.training/gradients/conv2d_1/Relu_grad/ReluGrad*
paddingSAME*&
_output_shapes
: @*
	dilations
*
T0*"
_class
loc:@conv2d_1/Conv2D*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(
ŕ
9training/gradients/max_pooling2d/MaxPool_grad/MaxPoolGradMaxPoolGradconv2d/Relumax_pooling2d/MaxPool;training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropInput*
ksize
*
paddingVALID*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ *
T0*(
_class
loc:@max_pooling2d/MaxPool*
strides
*
data_formatNHWC
Ú
,training/gradients/conv2d/Relu_grad/ReluGradReluGrad9training/gradients/max_pooling2d/MaxPool_grad/MaxPoolGradconv2d/Relu*
T0*
_class
loc:@conv2d/Relu*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ 
Î
2training/gradients/conv2d/BiasAdd_grad/BiasAddGradBiasAddGrad,training/gradients/conv2d/Relu_grad/ReluGrad*
T0*!
_class
loc:@conv2d/BiasAdd*
data_formatNHWC*
_output_shapes
: 
Ŕ
,training/gradients/conv2d/Conv2D_grad/ShapeNShapeNCastconv2d/Conv2D/ReadVariableOp*
T0*
out_type0* 
_class
loc:@conv2d/Conv2D*
N* 
_output_shapes
::
­
9training/gradients/conv2d/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput,training/gradients/conv2d/Conv2D_grad/ShapeNconv2d/Conv2D/ReadVariableOp,training/gradients/conv2d/Relu_grad/ReluGrad*
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙*
	dilations
*
T0* 
_class
loc:@conv2d/Conv2D*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(

:training/gradients/conv2d/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilterCast.training/gradients/conv2d/Conv2D_grad/ShapeN:1,training/gradients/conv2d/Relu_grad/ReluGrad*
	dilations
*
T0* 
_class
loc:@conv2d/Conv2D*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingSAME*&
_output_shapes
: 
Z
training/AssignAdd/valueConst*
dtype0	*
_output_shapes
: *
value	B	 R

training/AssignAdd	AssignAddglobal_steptraining/AssignAdd/value*
use_locking( *
T0	*
_class
loc:@global_step*
_output_shapes
: 
|
training/CastCastglobal_step/read^training/AssignAdd*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
_
training/Pow/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
`
training/PowPowtraining/Pow/ReadVariableOptraining/Cast*
T0*
_output_shapes
: 
S
training/sub/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
R
training/subSubtraining/sub/xtraining/Pow*
_output_shapes
: *
T0
S
training/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
U
training/Const_1Const*
valueB
 *  *
dtype0*
_output_shapes
: 
j
training/clip_by_value/MinimumMinimumtraining/subtraining/Const_1*
_output_shapes
: *
T0
r
training/clip_by_valueMaximumtraining/clip_by_value/Minimumtraining/Const*
_output_shapes
: *
T0
N
training/SqrtSqrttraining/clip_by_value*
T0*
_output_shapes
: 
a
training/Pow_1/ReadVariableOpReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
d
training/Pow_1Powtraining/Pow_1/ReadVariableOptraining/Cast*
T0*
_output_shapes
: 
U
training/sub_1/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
X
training/sub_1Subtraining/sub_1/xtraining/Pow_1*
T0*
_output_shapes
: 
[
training/truedivRealDivtraining/Sqrttraining/sub_1*
T0*
_output_shapes
: 
W
training/ReadVariableOpReadVariableOpAdam/lr*
dtype0*
_output_shapes
: 
_
training/mulMultraining/ReadVariableOptraining/truediv*
T0*
_output_shapes
: 
s
training/zerosConst*
dtype0*&
_output_shapes
: *%
valueB *    
˝
training/VariableVarHandleOp*
dtype0*
_output_shapes
: *"
shared_nametraining/Variable*$
_class
loc:@training/Variable*
	container *
shape: 
s
2training/Variable/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable*
_output_shapes
: 

training/Variable/AssignAssignVariableOptraining/Variabletraining/zeros*$
_class
loc:@training/Variable*
dtype0
Ľ
%training/Variable/Read/ReadVariableOpReadVariableOptraining/Variable*
dtype0*&
_output_shapes
: *$
_class
loc:@training/Variable
]
training/zeros_1Const*
dtype0*
_output_shapes
: *
valueB *    
ˇ
training/Variable_1VarHandleOp*
	container *
shape: *
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_1*&
_class
loc:@training/Variable_1
w
4training/Variable_1/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_1*
_output_shapes
: 

training/Variable_1/AssignAssignVariableOptraining/Variable_1training/zeros_1*&
_class
loc:@training/Variable_1*
dtype0

'training/Variable_1/Read/ReadVariableOpReadVariableOptraining/Variable_1*
dtype0*
_output_shapes
: *&
_class
loc:@training/Variable_1
y
 training/zeros_2/shape_as_tensorConst*%
valueB"          @   *
dtype0*
_output_shapes
:
[
training/zeros_2/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_2Fill training/zeros_2/shape_as_tensortraining/zeros_2/Const*
T0*

index_type0*&
_output_shapes
: @
Ă
training/Variable_2VarHandleOp*
	container *
shape: @*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_2*&
_class
loc:@training/Variable_2
w
4training/Variable_2/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_2*
_output_shapes
: 

training/Variable_2/AssignAssignVariableOptraining/Variable_2training/zeros_2*&
_class
loc:@training/Variable_2*
dtype0
Ť
'training/Variable_2/Read/ReadVariableOpReadVariableOptraining/Variable_2*&
_class
loc:@training/Variable_2*
dtype0*&
_output_shapes
: @
]
training/zeros_3Const*
valueB@*    *
dtype0*
_output_shapes
:@
ˇ
training/Variable_3VarHandleOp*$
shared_nametraining/Variable_3*&
_class
loc:@training/Variable_3*
	container *
shape:@*
dtype0*
_output_shapes
: 
w
4training/Variable_3/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_3*
_output_shapes
: 

training/Variable_3/AssignAssignVariableOptraining/Variable_3training/zeros_3*&
_class
loc:@training/Variable_3*
dtype0

'training/Variable_3/Read/ReadVariableOpReadVariableOptraining/Variable_3*
dtype0*
_output_shapes
:@*&
_class
loc:@training/Variable_3
q
 training/zeros_4/shape_as_tensorConst*
valueB"@     *
dtype0*
_output_shapes
:
[
training/zeros_4/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_4Fill training/zeros_4/shape_as_tensortraining/zeros_4/Const*
T0*

index_type0* 
_output_shapes
:
Ŕ
˝
training/Variable_4VarHandleOp*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_4*&
_class
loc:@training/Variable_4*
	container *
shape:
Ŕ
w
4training/Variable_4/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_4*
_output_shapes
: 

training/Variable_4/AssignAssignVariableOptraining/Variable_4training/zeros_4*
dtype0*&
_class
loc:@training/Variable_4
Ľ
'training/Variable_4/Read/ReadVariableOpReadVariableOptraining/Variable_4*&
_class
loc:@training/Variable_4*
dtype0* 
_output_shapes
:
Ŕ
k
 training/zeros_5/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB:
[
training/zeros_5/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_5Fill training/zeros_5/shape_as_tensortraining/zeros_5/Const*
T0*

index_type0*
_output_shapes	
:
¸
training/Variable_5VarHandleOp*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_5*&
_class
loc:@training/Variable_5*
	container *
shape:
w
4training/Variable_5/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_5*
_output_shapes
: 

training/Variable_5/AssignAssignVariableOptraining/Variable_5training/zeros_5*&
_class
loc:@training/Variable_5*
dtype0
 
'training/Variable_5/Read/ReadVariableOpReadVariableOptraining/Variable_5*&
_class
loc:@training/Variable_5*
dtype0*
_output_shapes	
:
q
 training/zeros_6/shape_as_tensorConst*
valueB"   
   *
dtype0*
_output_shapes
:
[
training/zeros_6/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_6Fill training/zeros_6/shape_as_tensortraining/zeros_6/Const*
T0*

index_type0*
_output_shapes
:	

ź
training/Variable_6VarHandleOp*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_6*&
_class
loc:@training/Variable_6*
	container *
shape:	

w
4training/Variable_6/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_6*
_output_shapes
: 

training/Variable_6/AssignAssignVariableOptraining/Variable_6training/zeros_6*&
_class
loc:@training/Variable_6*
dtype0
¤
'training/Variable_6/Read/ReadVariableOpReadVariableOptraining/Variable_6*&
_class
loc:@training/Variable_6*
dtype0*
_output_shapes
:	

]
training/zeros_7Const*
valueB
*    *
dtype0*
_output_shapes
:

ˇ
training/Variable_7VarHandleOp*$
shared_nametraining/Variable_7*&
_class
loc:@training/Variable_7*
	container *
shape:
*
dtype0*
_output_shapes
: 
w
4training/Variable_7/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_7*
_output_shapes
: 

training/Variable_7/AssignAssignVariableOptraining/Variable_7training/zeros_7*&
_class
loc:@training/Variable_7*
dtype0

'training/Variable_7/Read/ReadVariableOpReadVariableOptraining/Variable_7*&
_class
loc:@training/Variable_7*
dtype0*
_output_shapes
:

u
training/zeros_8Const*%
valueB *    *
dtype0*&
_output_shapes
: 
Ă
training/Variable_8VarHandleOp*$
shared_nametraining/Variable_8*&
_class
loc:@training/Variable_8*
	container *
shape: *
dtype0*
_output_shapes
: 
w
4training/Variable_8/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_8*
_output_shapes
: 

training/Variable_8/AssignAssignVariableOptraining/Variable_8training/zeros_8*&
_class
loc:@training/Variable_8*
dtype0
Ť
'training/Variable_8/Read/ReadVariableOpReadVariableOptraining/Variable_8*
dtype0*&
_output_shapes
: *&
_class
loc:@training/Variable_8
]
training/zeros_9Const*
valueB *    *
dtype0*
_output_shapes
: 
ˇ
training/Variable_9VarHandleOp*$
shared_nametraining/Variable_9*&
_class
loc:@training/Variable_9*
	container *
shape: *
dtype0*
_output_shapes
: 
w
4training/Variable_9/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_9*
_output_shapes
: 

training/Variable_9/AssignAssignVariableOptraining/Variable_9training/zeros_9*
dtype0*&
_class
loc:@training/Variable_9

'training/Variable_9/Read/ReadVariableOpReadVariableOptraining/Variable_9*&
_class
loc:@training/Variable_9*
dtype0*
_output_shapes
: 
z
!training/zeros_10/shape_as_tensorConst*%
valueB"          @   *
dtype0*
_output_shapes
:
\
training/zeros_10/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_10Fill!training/zeros_10/shape_as_tensortraining/zeros_10/Const*
T0*

index_type0*&
_output_shapes
: @
Ć
training/Variable_10VarHandleOp*'
_class
loc:@training/Variable_10*
	container *
shape: @*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_10
y
5training/Variable_10/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_10*
_output_shapes
: 

training/Variable_10/AssignAssignVariableOptraining/Variable_10training/zeros_10*'
_class
loc:@training/Variable_10*
dtype0
Ž
(training/Variable_10/Read/ReadVariableOpReadVariableOptraining/Variable_10*'
_class
loc:@training/Variable_10*
dtype0*&
_output_shapes
: @
^
training/zeros_11Const*
valueB@*    *
dtype0*
_output_shapes
:@
ş
training/Variable_11VarHandleOp*
shape:@*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_11*'
_class
loc:@training/Variable_11*
	container 
y
5training/Variable_11/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_11*
_output_shapes
: 

training/Variable_11/AssignAssignVariableOptraining/Variable_11training/zeros_11*
dtype0*'
_class
loc:@training/Variable_11
˘
(training/Variable_11/Read/ReadVariableOpReadVariableOptraining/Variable_11*'
_class
loc:@training/Variable_11*
dtype0*
_output_shapes
:@
r
!training/zeros_12/shape_as_tensorConst*
valueB"@     *
dtype0*
_output_shapes
:
\
training/zeros_12/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_12Fill!training/zeros_12/shape_as_tensortraining/zeros_12/Const* 
_output_shapes
:
Ŕ*
T0*

index_type0
Ŕ
training/Variable_12VarHandleOp*%
shared_nametraining/Variable_12*'
_class
loc:@training/Variable_12*
	container *
shape:
Ŕ*
dtype0*
_output_shapes
: 
y
5training/Variable_12/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_12*
_output_shapes
: 

training/Variable_12/AssignAssignVariableOptraining/Variable_12training/zeros_12*
dtype0*'
_class
loc:@training/Variable_12
¨
(training/Variable_12/Read/ReadVariableOpReadVariableOptraining/Variable_12*'
_class
loc:@training/Variable_12*
dtype0* 
_output_shapes
:
Ŕ
l
!training/zeros_13/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB:
\
training/zeros_13/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_13Fill!training/zeros_13/shape_as_tensortraining/zeros_13/Const*
T0*

index_type0*
_output_shapes	
:
ť
training/Variable_13VarHandleOp*%
shared_nametraining/Variable_13*'
_class
loc:@training/Variable_13*
	container *
shape:*
dtype0*
_output_shapes
: 
y
5training/Variable_13/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_13*
_output_shapes
: 

training/Variable_13/AssignAssignVariableOptraining/Variable_13training/zeros_13*'
_class
loc:@training/Variable_13*
dtype0
Ł
(training/Variable_13/Read/ReadVariableOpReadVariableOptraining/Variable_13*'
_class
loc:@training/Variable_13*
dtype0*
_output_shapes	
:
r
!training/zeros_14/shape_as_tensorConst*
valueB"   
   *
dtype0*
_output_shapes
:
\
training/zeros_14/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_14Fill!training/zeros_14/shape_as_tensortraining/zeros_14/Const*
T0*

index_type0*
_output_shapes
:	

ż
training/Variable_14VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_14*'
_class
loc:@training/Variable_14*
	container *
shape:	

y
5training/Variable_14/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_14*
_output_shapes
: 

training/Variable_14/AssignAssignVariableOptraining/Variable_14training/zeros_14*'
_class
loc:@training/Variable_14*
dtype0
§
(training/Variable_14/Read/ReadVariableOpReadVariableOptraining/Variable_14*'
_class
loc:@training/Variable_14*
dtype0*
_output_shapes
:	

^
training/zeros_15Const*
valueB
*    *
dtype0*
_output_shapes
:

ş
training/Variable_15VarHandleOp*%
shared_nametraining/Variable_15*'
_class
loc:@training/Variable_15*
	container *
shape:
*
dtype0*
_output_shapes
: 
y
5training/Variable_15/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_15*
_output_shapes
: 

training/Variable_15/AssignAssignVariableOptraining/Variable_15training/zeros_15*'
_class
loc:@training/Variable_15*
dtype0
˘
(training/Variable_15/Read/ReadVariableOpReadVariableOptraining/Variable_15*'
_class
loc:@training/Variable_15*
dtype0*
_output_shapes
:

k
!training/zeros_16/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_16/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_16Fill!training/zeros_16/shape_as_tensortraining/zeros_16/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_16VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_16*'
_class
loc:@training/Variable_16*
	container *
shape:
y
5training/Variable_16/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_16*
_output_shapes
: 

training/Variable_16/AssignAssignVariableOptraining/Variable_16training/zeros_16*'
_class
loc:@training/Variable_16*
dtype0
˘
(training/Variable_16/Read/ReadVariableOpReadVariableOptraining/Variable_16*'
_class
loc:@training/Variable_16*
dtype0*
_output_shapes
:
k
!training/zeros_17/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_17/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_17Fill!training/zeros_17/shape_as_tensortraining/zeros_17/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_17VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_17*'
_class
loc:@training/Variable_17*
	container *
shape:
y
5training/Variable_17/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_17*
_output_shapes
: 

training/Variable_17/AssignAssignVariableOptraining/Variable_17training/zeros_17*'
_class
loc:@training/Variable_17*
dtype0
˘
(training/Variable_17/Read/ReadVariableOpReadVariableOptraining/Variable_17*
dtype0*
_output_shapes
:*'
_class
loc:@training/Variable_17
k
!training/zeros_18/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB:
\
training/zeros_18/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_18Fill!training/zeros_18/shape_as_tensortraining/zeros_18/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_18VarHandleOp*%
shared_nametraining/Variable_18*'
_class
loc:@training/Variable_18*
	container *
shape:*
dtype0*
_output_shapes
: 
y
5training/Variable_18/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_18*
_output_shapes
: 

training/Variable_18/AssignAssignVariableOptraining/Variable_18training/zeros_18*
dtype0*'
_class
loc:@training/Variable_18
˘
(training/Variable_18/Read/ReadVariableOpReadVariableOptraining/Variable_18*'
_class
loc:@training/Variable_18*
dtype0*
_output_shapes
:
k
!training/zeros_19/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_19/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_19Fill!training/zeros_19/shape_as_tensortraining/zeros_19/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_19VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_19*'
_class
loc:@training/Variable_19*
	container *
shape:
y
5training/Variable_19/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_19*
_output_shapes
: 

training/Variable_19/AssignAssignVariableOptraining/Variable_19training/zeros_19*'
_class
loc:@training/Variable_19*
dtype0
˘
(training/Variable_19/Read/ReadVariableOpReadVariableOptraining/Variable_19*
dtype0*
_output_shapes
:*'
_class
loc:@training/Variable_19
k
!training/zeros_20/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_20/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_20Fill!training/zeros_20/shape_as_tensortraining/zeros_20/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_20VarHandleOp*%
shared_nametraining/Variable_20*'
_class
loc:@training/Variable_20*
	container *
shape:*
dtype0*
_output_shapes
: 
y
5training/Variable_20/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_20*
_output_shapes
: 

training/Variable_20/AssignAssignVariableOptraining/Variable_20training/zeros_20*
dtype0*'
_class
loc:@training/Variable_20
˘
(training/Variable_20/Read/ReadVariableOpReadVariableOptraining/Variable_20*'
_class
loc:@training/Variable_20*
dtype0*
_output_shapes
:
k
!training/zeros_21/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_21/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_21Fill!training/zeros_21/shape_as_tensortraining/zeros_21/Const*
_output_shapes
:*
T0*

index_type0
ş
training/Variable_21VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_21*'
_class
loc:@training/Variable_21*
	container *
shape:
y
5training/Variable_21/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_21*
_output_shapes
: 

training/Variable_21/AssignAssignVariableOptraining/Variable_21training/zeros_21*'
_class
loc:@training/Variable_21*
dtype0
˘
(training/Variable_21/Read/ReadVariableOpReadVariableOptraining/Variable_21*'
_class
loc:@training/Variable_21*
dtype0*
_output_shapes
:
k
!training/zeros_22/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_22/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_22Fill!training/zeros_22/shape_as_tensortraining/zeros_22/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_22VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_22*'
_class
loc:@training/Variable_22*
	container *
shape:
y
5training/Variable_22/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_22*
_output_shapes
: 

training/Variable_22/AssignAssignVariableOptraining/Variable_22training/zeros_22*'
_class
loc:@training/Variable_22*
dtype0
˘
(training/Variable_22/Read/ReadVariableOpReadVariableOptraining/Variable_22*'
_class
loc:@training/Variable_22*
dtype0*
_output_shapes
:
k
!training/zeros_23/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_23/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_23Fill!training/zeros_23/shape_as_tensortraining/zeros_23/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_23VarHandleOp*%
shared_nametraining/Variable_23*'
_class
loc:@training/Variable_23*
	container *
shape:*
dtype0*
_output_shapes
: 
y
5training/Variable_23/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_23*
_output_shapes
: 

training/Variable_23/AssignAssignVariableOptraining/Variable_23training/zeros_23*'
_class
loc:@training/Variable_23*
dtype0
˘
(training/Variable_23/Read/ReadVariableOpReadVariableOptraining/Variable_23*'
_class
loc:@training/Variable_23*
dtype0*
_output_shapes
:
]
training/ReadVariableOp_1ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
w
training/mul_1/ReadVariableOpReadVariableOptraining/Variable*
dtype0*&
_output_shapes
: 

training/mul_1Multraining/ReadVariableOp_1training/mul_1/ReadVariableOp*
T0*&
_output_shapes
: 
]
training/ReadVariableOp_2ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
U
training/sub_2/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
c
training/sub_2Subtraining/sub_2/xtraining/ReadVariableOp_2*
_output_shapes
: *
T0

training/mul_2Multraining/sub_2:training/gradients/conv2d/Conv2D_grad/Conv2DBackpropFilter*
T0*&
_output_shapes
: 
d
training/addAddtraining/mul_1training/mul_2*&
_output_shapes
: *
T0
]
training/ReadVariableOp_3ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
y
training/mul_3/ReadVariableOpReadVariableOptraining/Variable_8*
dtype0*&
_output_shapes
: 

training/mul_3Multraining/ReadVariableOp_3training/mul_3/ReadVariableOp*
T0*&
_output_shapes
: 
]
training/ReadVariableOp_4ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
U
training/sub_3/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
c
training/sub_3Subtraining/sub_3/xtraining/ReadVariableOp_4*
T0*
_output_shapes
: 

training/SquareSquare:training/gradients/conv2d/Conv2D_grad/Conv2DBackpropFilter*&
_output_shapes
: *
T0
g
training/mul_4Multraining/sub_3training/Square*&
_output_shapes
: *
T0
f
training/add_1Addtraining/mul_3training/mul_4*&
_output_shapes
: *
T0
b
training/mul_5Multraining/multraining/add*
T0*&
_output_shapes
: 
U
training/Const_2Const*
dtype0*
_output_shapes
: *
valueB
 *    
U
training/Const_3Const*
valueB
 *  *
dtype0*
_output_shapes
: 
~
 training/clip_by_value_1/MinimumMinimumtraining/add_1training/Const_3*
T0*&
_output_shapes
: 

training/clip_by_value_1Maximum training/clip_by_value_1/Minimumtraining/Const_2*&
_output_shapes
: *
T0
b
training/Sqrt_1Sqrttraining/clip_by_value_1*&
_output_shapes
: *
T0
U
training/add_2/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
i
training/add_2Addtraining/Sqrt_1training/add_2/y*
T0*&
_output_shapes
: 
n
training/truediv_1RealDivtraining/mul_5training/add_2*
T0*&
_output_shapes
: 
o
training/ReadVariableOp_5ReadVariableOpconv2d/kernel*
dtype0*&
_output_shapes
: 
u
training/sub_4Subtraining/ReadVariableOp_5training/truediv_1*
T0*&
_output_shapes
: 
[
training/AssignVariableOpAssignVariableOptraining/Variabletraining/add*
dtype0

training/ReadVariableOp_6ReadVariableOptraining/Variable^training/AssignVariableOp*
dtype0*&
_output_shapes
: 
a
training/AssignVariableOp_1AssignVariableOptraining/Variable_8training/add_1*
dtype0

training/ReadVariableOp_7ReadVariableOptraining/Variable_8^training/AssignVariableOp_1*
dtype0*&
_output_shapes
: 
[
training/AssignVariableOp_2AssignVariableOpconv2d/kerneltraining/sub_4*
dtype0

training/ReadVariableOp_8ReadVariableOpconv2d/kernel^training/AssignVariableOp_2*
dtype0*&
_output_shapes
: 
]
training/ReadVariableOp_9ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
m
training/mul_6/ReadVariableOpReadVariableOptraining/Variable_1*
dtype0*
_output_shapes
: 
t
training/mul_6Multraining/ReadVariableOp_9training/mul_6/ReadVariableOp*
T0*
_output_shapes
: 
^
training/ReadVariableOp_10ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
U
training/sub_5/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
d
training/sub_5Subtraining/sub_5/xtraining/ReadVariableOp_10*
T0*
_output_shapes
: 
~
training/mul_7Multraining/sub_52training/gradients/conv2d/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
: 
Z
training/add_3Addtraining/mul_6training/mul_7*
T0*
_output_shapes
: 
^
training/ReadVariableOp_11ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
m
training/mul_8/ReadVariableOpReadVariableOptraining/Variable_9*
dtype0*
_output_shapes
: 
u
training/mul_8Multraining/ReadVariableOp_11training/mul_8/ReadVariableOp*
T0*
_output_shapes
: 
^
training/ReadVariableOp_12ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
U
training/sub_6/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
d
training/sub_6Subtraining/sub_6/xtraining/ReadVariableOp_12*
T0*
_output_shapes
: 
t
training/Square_1Square2training/gradients/conv2d/BiasAdd_grad/BiasAddGrad*
_output_shapes
: *
T0
]
training/mul_9Multraining/sub_6training/Square_1*
_output_shapes
: *
T0
Z
training/add_4Addtraining/mul_8training/mul_9*
T0*
_output_shapes
: 
Y
training/mul_10Multraining/multraining/add_3*
T0*
_output_shapes
: 
U
training/Const_4Const*
valueB
 *    *
dtype0*
_output_shapes
: 
U
training/Const_5Const*
valueB
 *  *
dtype0*
_output_shapes
: 
r
 training/clip_by_value_2/MinimumMinimumtraining/add_4training/Const_5*
_output_shapes
: *
T0
|
training/clip_by_value_2Maximum training/clip_by_value_2/Minimumtraining/Const_4*
T0*
_output_shapes
: 
V
training/Sqrt_2Sqrttraining/clip_by_value_2*
T0*
_output_shapes
: 
U
training/add_5/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
]
training/add_5Addtraining/Sqrt_2training/add_5/y*
T0*
_output_shapes
: 
c
training/truediv_2RealDivtraining/mul_10training/add_5*
_output_shapes
: *
T0
b
training/ReadVariableOp_13ReadVariableOpconv2d/bias*
dtype0*
_output_shapes
: 
j
training/sub_7Subtraining/ReadVariableOp_13training/truediv_2*
T0*
_output_shapes
: 
a
training/AssignVariableOp_3AssignVariableOptraining/Variable_1training/add_3*
dtype0

training/ReadVariableOp_14ReadVariableOptraining/Variable_1^training/AssignVariableOp_3*
dtype0*
_output_shapes
: 
a
training/AssignVariableOp_4AssignVariableOptraining/Variable_9training/add_4*
dtype0

training/ReadVariableOp_15ReadVariableOptraining/Variable_9^training/AssignVariableOp_4*
dtype0*
_output_shapes
: 
Y
training/AssignVariableOp_5AssignVariableOpconv2d/biastraining/sub_7*
dtype0

training/ReadVariableOp_16ReadVariableOpconv2d/bias^training/AssignVariableOp_5*
dtype0*
_output_shapes
: 
^
training/ReadVariableOp_17ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
z
training/mul_11/ReadVariableOpReadVariableOptraining/Variable_2*
dtype0*&
_output_shapes
: @

training/mul_11Multraining/ReadVariableOp_17training/mul_11/ReadVariableOp*&
_output_shapes
: @*
T0
^
training/ReadVariableOp_18ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
U
training/sub_8/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
d
training/sub_8Subtraining/sub_8/xtraining/ReadVariableOp_18*
T0*
_output_shapes
: 

training/mul_12Multraining/sub_8<training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropFilter*
T0*&
_output_shapes
: @
h
training/add_6Addtraining/mul_11training/mul_12*
T0*&
_output_shapes
: @
^
training/ReadVariableOp_19ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
{
training/mul_13/ReadVariableOpReadVariableOptraining/Variable_10*
dtype0*&
_output_shapes
: @

training/mul_13Multraining/ReadVariableOp_19training/mul_13/ReadVariableOp*&
_output_shapes
: @*
T0
^
training/ReadVariableOp_20ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
U
training/sub_9/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
d
training/sub_9Subtraining/sub_9/xtraining/ReadVariableOp_20*
T0*
_output_shapes
: 

training/Square_2Square<training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropFilter*
T0*&
_output_shapes
: @
j
training/mul_14Multraining/sub_9training/Square_2*
T0*&
_output_shapes
: @
h
training/add_7Addtraining/mul_13training/mul_14*
T0*&
_output_shapes
: @
e
training/mul_15Multraining/multraining/add_6*
T0*&
_output_shapes
: @
U
training/Const_6Const*
dtype0*
_output_shapes
: *
valueB
 *    
U
training/Const_7Const*
valueB
 *  *
dtype0*
_output_shapes
: 
~
 training/clip_by_value_3/MinimumMinimumtraining/add_7training/Const_7*
T0*&
_output_shapes
: @

training/clip_by_value_3Maximum training/clip_by_value_3/Minimumtraining/Const_6*
T0*&
_output_shapes
: @
b
training/Sqrt_3Sqrttraining/clip_by_value_3*&
_output_shapes
: @*
T0
U
training/add_8/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
i
training/add_8Addtraining/Sqrt_3training/add_8/y*&
_output_shapes
: @*
T0
o
training/truediv_3RealDivtraining/mul_15training/add_8*
T0*&
_output_shapes
: @
r
training/ReadVariableOp_21ReadVariableOpconv2d_1/kernel*
dtype0*&
_output_shapes
: @
w
training/sub_10Subtraining/ReadVariableOp_21training/truediv_3*
T0*&
_output_shapes
: @
a
training/AssignVariableOp_6AssignVariableOptraining/Variable_2training/add_6*
dtype0

training/ReadVariableOp_22ReadVariableOptraining/Variable_2^training/AssignVariableOp_6*
dtype0*&
_output_shapes
: @
b
training/AssignVariableOp_7AssignVariableOptraining/Variable_10training/add_7*
dtype0

training/ReadVariableOp_23ReadVariableOptraining/Variable_10^training/AssignVariableOp_7*
dtype0*&
_output_shapes
: @
^
training/AssignVariableOp_8AssignVariableOpconv2d_1/kerneltraining/sub_10*
dtype0

training/ReadVariableOp_24ReadVariableOpconv2d_1/kernel^training/AssignVariableOp_8*
dtype0*&
_output_shapes
: @
^
training/ReadVariableOp_25ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
n
training/mul_16/ReadVariableOpReadVariableOptraining/Variable_3*
dtype0*
_output_shapes
:@
w
training/mul_16Multraining/ReadVariableOp_25training/mul_16/ReadVariableOp*
T0*
_output_shapes
:@
^
training/ReadVariableOp_26ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_11/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
f
training/sub_11Subtraining/sub_11/xtraining/ReadVariableOp_26*
T0*
_output_shapes
: 

training/mul_17Multraining/sub_114training/gradients/conv2d_1/BiasAdd_grad/BiasAddGrad*
_output_shapes
:@*
T0
\
training/add_9Addtraining/mul_16training/mul_17*
T0*
_output_shapes
:@
^
training/ReadVariableOp_27ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
o
training/mul_18/ReadVariableOpReadVariableOptraining/Variable_11*
dtype0*
_output_shapes
:@
w
training/mul_18Multraining/ReadVariableOp_27training/mul_18/ReadVariableOp*
T0*
_output_shapes
:@
^
training/ReadVariableOp_28ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_12/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_12Subtraining/sub_12/xtraining/ReadVariableOp_28*
T0*
_output_shapes
: 
v
training/Square_3Square4training/gradients/conv2d_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:@
_
training/mul_19Multraining/sub_12training/Square_3*
T0*
_output_shapes
:@
]
training/add_10Addtraining/mul_18training/mul_19*
T0*
_output_shapes
:@
Y
training/mul_20Multraining/multraining/add_9*
T0*
_output_shapes
:@
U
training/Const_8Const*
valueB
 *    *
dtype0*
_output_shapes
: 
U
training/Const_9Const*
valueB
 *  *
dtype0*
_output_shapes
: 
s
 training/clip_by_value_4/MinimumMinimumtraining/add_10training/Const_9*
T0*
_output_shapes
:@
|
training/clip_by_value_4Maximum training/clip_by_value_4/Minimumtraining/Const_8*
T0*
_output_shapes
:@
V
training/Sqrt_4Sqrttraining/clip_by_value_4*
T0*
_output_shapes
:@
V
training/add_11/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
_
training/add_11Addtraining/Sqrt_4training/add_11/y*
T0*
_output_shapes
:@
d
training/truediv_4RealDivtraining/mul_20training/add_11*
T0*
_output_shapes
:@
d
training/ReadVariableOp_29ReadVariableOpconv2d_1/bias*
dtype0*
_output_shapes
:@
k
training/sub_13Subtraining/ReadVariableOp_29training/truediv_4*
T0*
_output_shapes
:@
a
training/AssignVariableOp_9AssignVariableOptraining/Variable_3training/add_9*
dtype0

training/ReadVariableOp_30ReadVariableOptraining/Variable_3^training/AssignVariableOp_9*
dtype0*
_output_shapes
:@
d
training/AssignVariableOp_10AssignVariableOptraining/Variable_11training/add_10*
dtype0

training/ReadVariableOp_31ReadVariableOptraining/Variable_11^training/AssignVariableOp_10*
dtype0*
_output_shapes
:@
]
training/AssignVariableOp_11AssignVariableOpconv2d_1/biastraining/sub_13*
dtype0

training/ReadVariableOp_32ReadVariableOpconv2d_1/bias^training/AssignVariableOp_11*
dtype0*
_output_shapes
:@
^
training/ReadVariableOp_33ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
t
training/mul_21/ReadVariableOpReadVariableOptraining/Variable_4*
dtype0* 
_output_shapes
:
Ŕ
}
training/mul_21Multraining/ReadVariableOp_33training/mul_21/ReadVariableOp*
T0* 
_output_shapes
:
Ŕ
^
training/ReadVariableOp_34ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_14/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_14Subtraining/sub_14/xtraining/ReadVariableOp_34*
T0*
_output_shapes
: 

training/mul_22Multraining/sub_14-training/gradients/dense/MatMul_grad/MatMul_1* 
_output_shapes
:
Ŕ*
T0
c
training/add_12Addtraining/mul_21training/mul_22* 
_output_shapes
:
Ŕ*
T0
^
training/ReadVariableOp_35ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
u
training/mul_23/ReadVariableOpReadVariableOptraining/Variable_12*
dtype0* 
_output_shapes
:
Ŕ
}
training/mul_23Multraining/ReadVariableOp_35training/mul_23/ReadVariableOp*
T0* 
_output_shapes
:
Ŕ
^
training/ReadVariableOp_36ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_15/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_15Subtraining/sub_15/xtraining/ReadVariableOp_36*
T0*
_output_shapes
: 
u
training/Square_4Square-training/gradients/dense/MatMul_grad/MatMul_1* 
_output_shapes
:
Ŕ*
T0
e
training/mul_24Multraining/sub_15training/Square_4* 
_output_shapes
:
Ŕ*
T0
c
training/add_13Addtraining/mul_23training/mul_24* 
_output_shapes
:
Ŕ*
T0
`
training/mul_25Multraining/multraining/add_12*
T0* 
_output_shapes
:
Ŕ
V
training/Const_10Const*
dtype0*
_output_shapes
: *
valueB
 *    
V
training/Const_11Const*
dtype0*
_output_shapes
: *
valueB
 *  
z
 training/clip_by_value_5/MinimumMinimumtraining/add_13training/Const_11*
T0* 
_output_shapes
:
Ŕ

training/clip_by_value_5Maximum training/clip_by_value_5/Minimumtraining/Const_10*
T0* 
_output_shapes
:
Ŕ
\
training/Sqrt_5Sqrttraining/clip_by_value_5*
T0* 
_output_shapes
:
Ŕ
V
training/add_14/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
e
training/add_14Addtraining/Sqrt_5training/add_14/y*
T0* 
_output_shapes
:
Ŕ
j
training/truediv_5RealDivtraining/mul_25training/add_14*
T0* 
_output_shapes
:
Ŕ
i
training/ReadVariableOp_37ReadVariableOpdense/kernel*
dtype0* 
_output_shapes
:
Ŕ
q
training/sub_16Subtraining/ReadVariableOp_37training/truediv_5*
T0* 
_output_shapes
:
Ŕ
c
training/AssignVariableOp_12AssignVariableOptraining/Variable_4training/add_12*
dtype0

training/ReadVariableOp_38ReadVariableOptraining/Variable_4^training/AssignVariableOp_12*
dtype0* 
_output_shapes
:
Ŕ
d
training/AssignVariableOp_13AssignVariableOptraining/Variable_12training/add_13*
dtype0

training/ReadVariableOp_39ReadVariableOptraining/Variable_12^training/AssignVariableOp_13*
dtype0* 
_output_shapes
:
Ŕ
\
training/AssignVariableOp_14AssignVariableOpdense/kerneltraining/sub_16*
dtype0

training/ReadVariableOp_40ReadVariableOpdense/kernel^training/AssignVariableOp_14*
dtype0* 
_output_shapes
:
Ŕ
^
training/ReadVariableOp_41ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
o
training/mul_26/ReadVariableOpReadVariableOptraining/Variable_5*
dtype0*
_output_shapes	
:
x
training/mul_26Multraining/ReadVariableOp_41training/mul_26/ReadVariableOp*
T0*
_output_shapes	
:
^
training/ReadVariableOp_42ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_17/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
f
training/sub_17Subtraining/sub_17/xtraining/ReadVariableOp_42*
_output_shapes
: *
T0

training/mul_27Multraining/sub_171training/gradients/dense/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:
^
training/add_15Addtraining/mul_26training/mul_27*
T0*
_output_shapes	
:
^
training/ReadVariableOp_43ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
p
training/mul_28/ReadVariableOpReadVariableOptraining/Variable_13*
dtype0*
_output_shapes	
:
x
training/mul_28Multraining/ReadVariableOp_43training/mul_28/ReadVariableOp*
_output_shapes	
:*
T0
^
training/ReadVariableOp_44ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_18/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
f
training/sub_18Subtraining/sub_18/xtraining/ReadVariableOp_44*
T0*
_output_shapes
: 
t
training/Square_5Square1training/gradients/dense/BiasAdd_grad/BiasAddGrad*
_output_shapes	
:*
T0
`
training/mul_29Multraining/sub_18training/Square_5*
T0*
_output_shapes	
:
^
training/add_16Addtraining/mul_28training/mul_29*
T0*
_output_shapes	
:
[
training/mul_30Multraining/multraining/add_15*
T0*
_output_shapes	
:
V
training/Const_12Const*
valueB
 *    *
dtype0*
_output_shapes
: 
V
training/Const_13Const*
valueB
 *  *
dtype0*
_output_shapes
: 
u
 training/clip_by_value_6/MinimumMinimumtraining/add_16training/Const_13*
T0*
_output_shapes	
:
~
training/clip_by_value_6Maximum training/clip_by_value_6/Minimumtraining/Const_12*
T0*
_output_shapes	
:
W
training/Sqrt_6Sqrttraining/clip_by_value_6*
T0*
_output_shapes	
:
V
training/add_17/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
`
training/add_17Addtraining/Sqrt_6training/add_17/y*
T0*
_output_shapes	
:
e
training/truediv_6RealDivtraining/mul_30training/add_17*
T0*
_output_shapes	
:
b
training/ReadVariableOp_45ReadVariableOp
dense/bias*
dtype0*
_output_shapes	
:
l
training/sub_19Subtraining/ReadVariableOp_45training/truediv_6*
_output_shapes	
:*
T0
c
training/AssignVariableOp_15AssignVariableOptraining/Variable_5training/add_15*
dtype0

training/ReadVariableOp_46ReadVariableOptraining/Variable_5^training/AssignVariableOp_15*
dtype0*
_output_shapes	
:
d
training/AssignVariableOp_16AssignVariableOptraining/Variable_13training/add_16*
dtype0

training/ReadVariableOp_47ReadVariableOptraining/Variable_13^training/AssignVariableOp_16*
dtype0*
_output_shapes	
:
Z
training/AssignVariableOp_17AssignVariableOp
dense/biastraining/sub_19*
dtype0

training/ReadVariableOp_48ReadVariableOp
dense/bias^training/AssignVariableOp_17*
dtype0*
_output_shapes	
:
^
training/ReadVariableOp_49ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
s
training/mul_31/ReadVariableOpReadVariableOptraining/Variable_6*
dtype0*
_output_shapes
:	

|
training/mul_31Multraining/ReadVariableOp_49training/mul_31/ReadVariableOp*
T0*
_output_shapes
:	

^
training/ReadVariableOp_50ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_20/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_20Subtraining/sub_20/xtraining/ReadVariableOp_50*
_output_shapes
: *
T0

training/mul_32Multraining/sub_20/training/gradients/dense_1/MatMul_grad/MatMul_1*
T0*
_output_shapes
:	

b
training/add_18Addtraining/mul_31training/mul_32*
T0*
_output_shapes
:	

^
training/ReadVariableOp_51ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
t
training/mul_33/ReadVariableOpReadVariableOptraining/Variable_14*
dtype0*
_output_shapes
:	

|
training/mul_33Multraining/ReadVariableOp_51training/mul_33/ReadVariableOp*
T0*
_output_shapes
:	

^
training/ReadVariableOp_52ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_21/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_21Subtraining/sub_21/xtraining/ReadVariableOp_52*
T0*
_output_shapes
: 
v
training/Square_6Square/training/gradients/dense_1/MatMul_grad/MatMul_1*
T0*
_output_shapes
:	

d
training/mul_34Multraining/sub_21training/Square_6*
T0*
_output_shapes
:	

b
training/add_19Addtraining/mul_33training/mul_34*
T0*
_output_shapes
:	

_
training/mul_35Multraining/multraining/add_18*
T0*
_output_shapes
:	

V
training/Const_14Const*
dtype0*
_output_shapes
: *
valueB
 *    
V
training/Const_15Const*
valueB
 *  *
dtype0*
_output_shapes
: 
y
 training/clip_by_value_7/MinimumMinimumtraining/add_19training/Const_15*
T0*
_output_shapes
:	


training/clip_by_value_7Maximum training/clip_by_value_7/Minimumtraining/Const_14*
T0*
_output_shapes
:	

[
training/Sqrt_7Sqrttraining/clip_by_value_7*
T0*
_output_shapes
:	

V
training/add_20/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
d
training/add_20Addtraining/Sqrt_7training/add_20/y*
T0*
_output_shapes
:	

i
training/truediv_7RealDivtraining/mul_35training/add_20*
T0*
_output_shapes
:	

j
training/ReadVariableOp_53ReadVariableOpdense_1/kernel*
dtype0*
_output_shapes
:	

p
training/sub_22Subtraining/ReadVariableOp_53training/truediv_7*
T0*
_output_shapes
:	

c
training/AssignVariableOp_18AssignVariableOptraining/Variable_6training/add_18*
dtype0

training/ReadVariableOp_54ReadVariableOptraining/Variable_6^training/AssignVariableOp_18*
dtype0*
_output_shapes
:	

d
training/AssignVariableOp_19AssignVariableOptraining/Variable_14training/add_19*
dtype0

training/ReadVariableOp_55ReadVariableOptraining/Variable_14^training/AssignVariableOp_19*
dtype0*
_output_shapes
:	

^
training/AssignVariableOp_20AssignVariableOpdense_1/kerneltraining/sub_22*
dtype0

training/ReadVariableOp_56ReadVariableOpdense_1/kernel^training/AssignVariableOp_20*
dtype0*
_output_shapes
:	

^
training/ReadVariableOp_57ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
n
training/mul_36/ReadVariableOpReadVariableOptraining/Variable_7*
dtype0*
_output_shapes
:

w
training/mul_36Multraining/ReadVariableOp_57training/mul_36/ReadVariableOp*
_output_shapes
:
*
T0
^
training/ReadVariableOp_58ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_23/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_23Subtraining/sub_23/xtraining/ReadVariableOp_58*
T0*
_output_shapes
: 

training/mul_37Multraining/sub_233training/gradients/dense_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:

]
training/add_21Addtraining/mul_36training/mul_37*
T0*
_output_shapes
:

^
training/ReadVariableOp_59ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
o
training/mul_38/ReadVariableOpReadVariableOptraining/Variable_15*
dtype0*
_output_shapes
:

w
training/mul_38Multraining/ReadVariableOp_59training/mul_38/ReadVariableOp*
_output_shapes
:
*
T0
^
training/ReadVariableOp_60ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_24/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_24Subtraining/sub_24/xtraining/ReadVariableOp_60*
T0*
_output_shapes
: 
u
training/Square_7Square3training/gradients/dense_1/BiasAdd_grad/BiasAddGrad*
_output_shapes
:
*
T0
_
training/mul_39Multraining/sub_24training/Square_7*
T0*
_output_shapes
:

]
training/add_22Addtraining/mul_38training/mul_39*
T0*
_output_shapes
:

Z
training/mul_40Multraining/multraining/add_21*
T0*
_output_shapes
:

V
training/Const_16Const*
valueB
 *    *
dtype0*
_output_shapes
: 
V
training/Const_17Const*
dtype0*
_output_shapes
: *
valueB
 *  
t
 training/clip_by_value_8/MinimumMinimumtraining/add_22training/Const_17*
_output_shapes
:
*
T0
}
training/clip_by_value_8Maximum training/clip_by_value_8/Minimumtraining/Const_16*
T0*
_output_shapes
:

V
training/Sqrt_8Sqrttraining/clip_by_value_8*
T0*
_output_shapes
:

V
training/add_23/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
_
training/add_23Addtraining/Sqrt_8training/add_23/y*
T0*
_output_shapes
:

d
training/truediv_8RealDivtraining/mul_40training/add_23*
T0*
_output_shapes
:

c
training/ReadVariableOp_61ReadVariableOpdense_1/bias*
dtype0*
_output_shapes
:

k
training/sub_25Subtraining/ReadVariableOp_61training/truediv_8*
T0*
_output_shapes
:

c
training/AssignVariableOp_21AssignVariableOptraining/Variable_7training/add_21*
dtype0

training/ReadVariableOp_62ReadVariableOptraining/Variable_7^training/AssignVariableOp_21*
dtype0*
_output_shapes
:

d
training/AssignVariableOp_22AssignVariableOptraining/Variable_15training/add_22*
dtype0

training/ReadVariableOp_63ReadVariableOptraining/Variable_15^training/AssignVariableOp_22*
dtype0*
_output_shapes
:

\
training/AssignVariableOp_23AssignVariableOpdense_1/biastraining/sub_25*
dtype0

training/ReadVariableOp_64ReadVariableOpdense_1/bias^training/AssignVariableOp_23*
dtype0*
_output_shapes
:


training_1/group_depsNoOp	^loss/mul^training/AssignVariableOp^training/AssignVariableOp_1^training/AssignVariableOp_10^training/AssignVariableOp_11^training/AssignVariableOp_12^training/AssignVariableOp_13^training/AssignVariableOp_14^training/AssignVariableOp_15^training/AssignVariableOp_16^training/AssignVariableOp_17^training/AssignVariableOp_18^training/AssignVariableOp_19^training/AssignVariableOp_2^training/AssignVariableOp_20^training/AssignVariableOp_21^training/AssignVariableOp_22^training/AssignVariableOp_23^training/AssignVariableOp_3^training/AssignVariableOp_4^training/AssignVariableOp_5^training/AssignVariableOp_6^training/AssignVariableOp_7^training/AssignVariableOp_8^training/AssignVariableOp_9
W
div_no_nan/ReadVariableOpReadVariableOptotal*
dtype0*
_output_shapes
: 
[
div_no_nan/ReadVariableOp_1ReadVariableOpcount_1*
dtype0*
_output_shapes
: 
o

div_no_nanDivNoNandiv_no_nan/ReadVariableOpdiv_no_nan/ReadVariableOp_1*
T0*
_output_shapes
: 
A
IdentityIdentity
div_no_nan*
T0*
_output_shapes
: 
Y
div_no_nan_1/ReadVariableOpReadVariableOptotal*
dtype0*
_output_shapes
: 
]
div_no_nan_1/ReadVariableOp_1ReadVariableOpcount_1*
dtype0*
_output_shapes
: 
u
div_no_nan_1DivNoNandiv_no_nan_1/ReadVariableOpdiv_no_nan_1/ReadVariableOp_1*
T0*
_output_shapes
: 
E

Identity_1Identitydiv_no_nan_1*
T0*
_output_shapes
: 

checkpoint_initializer/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

#checkpoint_initializer/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:* 
valueBBAdam/beta_1

'checkpoint_initializer/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Č
checkpoint_initializer	RestoreV2checkpoint_initializer/prefix#checkpoint_initializer/tensor_names'checkpoint_initializer/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
: 
Q

Identity_2Identitycheckpoint_initializer*
T0*
_output_shapes
:
J
AssignVariableOpAssignVariableOpAdam/beta_1
Identity_2*
dtype0

checkpoint_initializer_1/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_1/tensor_namesConst"/device:CPU:0* 
valueBBAdam/beta_2*
dtype0*
_output_shapes
:

)checkpoint_initializer_1/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Đ
checkpoint_initializer_1	RestoreV2checkpoint_initializer_1/prefix%checkpoint_initializer_1/tensor_names)checkpoint_initializer_1/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
: 
S

Identity_3Identitycheckpoint_initializer_1*
T0*
_output_shapes
:
L
AssignVariableOp_1AssignVariableOpAdam/beta_2
Identity_3*
dtype0

checkpoint_initializer_2/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_2/tensor_namesConst"/device:CPU:0*
valueBB
Adam/decay*
dtype0*
_output_shapes
:

)checkpoint_initializer_2/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Đ
checkpoint_initializer_2	RestoreV2checkpoint_initializer_2/prefix%checkpoint_initializer_2/tensor_names)checkpoint_initializer_2/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
: 
S

Identity_4Identitycheckpoint_initializer_2*
T0*
_output_shapes
:
K
AssignVariableOp_2AssignVariableOp
Adam/decay
Identity_4*
dtype0

checkpoint_initializer_3/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

%checkpoint_initializer_3/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*$
valueBBAdam/iterations

)checkpoint_initializer_3/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Đ
checkpoint_initializer_3	RestoreV2checkpoint_initializer_3/prefix%checkpoint_initializer_3/tensor_names)checkpoint_initializer_3/shape_and_slices"/device:CPU:0*
dtypes
2	*
_output_shapes
: 
S

Identity_5Identitycheckpoint_initializer_3*
T0	*
_output_shapes
:
P
AssignVariableOp_3AssignVariableOpAdam/iterations
Identity_5*
dtype0	

checkpoint_initializer_4/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

%checkpoint_initializer_4/tensor_namesConst"/device:CPU:0*
valueBBAdam/lr*
dtype0*
_output_shapes
:

)checkpoint_initializer_4/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Đ
checkpoint_initializer_4	RestoreV2checkpoint_initializer_4/prefix%checkpoint_initializer_4/tensor_names)checkpoint_initializer_4/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
S

Identity_6Identitycheckpoint_initializer_4*
T0*
_output_shapes
:
H
AssignVariableOp_4AssignVariableOpAdam/lr
Identity_6*
dtype0

checkpoint_initializer_5/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

%checkpoint_initializer_5/tensor_namesConst"/device:CPU:0* 
valueBBconv2d/bias*
dtype0*
_output_shapes
:

)checkpoint_initializer_5/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ô
checkpoint_initializer_5	RestoreV2checkpoint_initializer_5/prefix%checkpoint_initializer_5/tensor_names)checkpoint_initializer_5/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
S

Identity_7Identitycheckpoint_initializer_5*
_output_shapes
:*
T0
L
AssignVariableOp_5AssignVariableOpconv2d/bias
Identity_7*
dtype0

checkpoint_initializer_6/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_6/tensor_namesConst"/device:CPU:0*"
valueBBconv2d/kernel*
dtype0*
_output_shapes
:

)checkpoint_initializer_6/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
ŕ
checkpoint_initializer_6	RestoreV2checkpoint_initializer_6/prefix%checkpoint_initializer_6/tensor_names)checkpoint_initializer_6/shape_and_slices"/device:CPU:0*&
_output_shapes
: *
dtypes
2
S

Identity_8Identitycheckpoint_initializer_6*
T0*
_output_shapes
:
N
AssignVariableOp_6AssignVariableOpconv2d/kernel
Identity_8*
dtype0

checkpoint_initializer_7/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_7/tensor_namesConst"/device:CPU:0*"
valueBBconv2d_1/bias*
dtype0*
_output_shapes
:

)checkpoint_initializer_7/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ô
checkpoint_initializer_7	RestoreV2checkpoint_initializer_7/prefix%checkpoint_initializer_7/tensor_names)checkpoint_initializer_7/shape_and_slices"/device:CPU:0*
_output_shapes
:@*
dtypes
2
S

Identity_9Identitycheckpoint_initializer_7*
_output_shapes
:*
T0
N
AssignVariableOp_7AssignVariableOpconv2d_1/bias
Identity_9*
dtype0

checkpoint_initializer_8/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_8/tensor_namesConst"/device:CPU:0*$
valueBBconv2d_1/kernel*
dtype0*
_output_shapes
:

)checkpoint_initializer_8/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ŕ
checkpoint_initializer_8	RestoreV2checkpoint_initializer_8/prefix%checkpoint_initializer_8/tensor_names)checkpoint_initializer_8/shape_and_slices"/device:CPU:0*&
_output_shapes
: @*
dtypes
2
T
Identity_10Identitycheckpoint_initializer_8*
T0*
_output_shapes
:
Q
AssignVariableOp_8AssignVariableOpconv2d_1/kernelIdentity_10*
dtype0

checkpoint_initializer_9/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_9/tensor_namesConst"/device:CPU:0*
valueBB
dense/bias*
dtype0*
_output_shapes
:

)checkpoint_initializer_9/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ő
checkpoint_initializer_9	RestoreV2checkpoint_initializer_9/prefix%checkpoint_initializer_9/tensor_names)checkpoint_initializer_9/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes	
:
T
Identity_11Identitycheckpoint_initializer_9*
_output_shapes
:*
T0
L
AssignVariableOp_9AssignVariableOp
dense/biasIdentity_11*
dtype0

 checkpoint_initializer_10/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_10/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*!
valueBBdense/kernel

*checkpoint_initializer_10/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ţ
checkpoint_initializer_10	RestoreV2 checkpoint_initializer_10/prefix&checkpoint_initializer_10/tensor_names*checkpoint_initializer_10/shape_and_slices"/device:CPU:0* 
_output_shapes
:
Ŕ*
dtypes
2
U
Identity_12Identitycheckpoint_initializer_10*
T0*
_output_shapes
:
O
AssignVariableOp_10AssignVariableOpdense/kernelIdentity_12*
dtype0

 checkpoint_initializer_11/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_11/tensor_namesConst"/device:CPU:0*!
valueBBdense_1/bias*
dtype0*
_output_shapes
:

*checkpoint_initializer_11/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_11	RestoreV2 checkpoint_initializer_11/prefix&checkpoint_initializer_11/tensor_names*checkpoint_initializer_11/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
:

U
Identity_13Identitycheckpoint_initializer_11*
T0*
_output_shapes
:
O
AssignVariableOp_11AssignVariableOpdense_1/biasIdentity_13*
dtype0

 checkpoint_initializer_12/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_12/tensor_namesConst"/device:CPU:0*#
valueBBdense_1/kernel*
dtype0*
_output_shapes
:

*checkpoint_initializer_12/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ý
checkpoint_initializer_12	RestoreV2 checkpoint_initializer_12/prefix&checkpoint_initializer_12/tensor_names*checkpoint_initializer_12/shape_and_slices"/device:CPU:0*
_output_shapes
:	
*
dtypes
2
U
Identity_14Identitycheckpoint_initializer_12*
T0*
_output_shapes
:
Q
AssignVariableOp_12AssignVariableOpdense_1/kernelIdentity_14*
dtype0

 checkpoint_initializer_13/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_13/tensor_namesConst"/device:CPU:0*&
valueBBtraining/Variable*
dtype0*
_output_shapes
:

*checkpoint_initializer_13/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
ä
checkpoint_initializer_13	RestoreV2 checkpoint_initializer_13/prefix&checkpoint_initializer_13/tensor_names*checkpoint_initializer_13/shape_and_slices"/device:CPU:0*&
_output_shapes
: *
dtypes
2
U
Identity_15Identitycheckpoint_initializer_13*
T0*
_output_shapes
:
T
AssignVariableOp_13AssignVariableOptraining/VariableIdentity_15*
dtype0

 checkpoint_initializer_14/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_14/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_1*
dtype0*
_output_shapes
:

*checkpoint_initializer_14/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ř
checkpoint_initializer_14	RestoreV2 checkpoint_initializer_14/prefix&checkpoint_initializer_14/tensor_names*checkpoint_initializer_14/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
U
Identity_16Identitycheckpoint_initializer_14*
T0*
_output_shapes
:
V
AssignVariableOp_14AssignVariableOptraining/Variable_1Identity_16*
dtype0

 checkpoint_initializer_15/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_15/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_10*
dtype0*
_output_shapes
:

*checkpoint_initializer_15/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
ä
checkpoint_initializer_15	RestoreV2 checkpoint_initializer_15/prefix&checkpoint_initializer_15/tensor_names*checkpoint_initializer_15/shape_and_slices"/device:CPU:0*&
_output_shapes
: @*
dtypes
2
U
Identity_17Identitycheckpoint_initializer_15*
T0*
_output_shapes
:
W
AssignVariableOp_15AssignVariableOptraining/Variable_10Identity_17*
dtype0

 checkpoint_initializer_16/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_16/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_11*
dtype0*
_output_shapes
:

*checkpoint_initializer_16/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_16	RestoreV2 checkpoint_initializer_16/prefix&checkpoint_initializer_16/tensor_names*checkpoint_initializer_16/shape_and_slices"/device:CPU:0*
_output_shapes
:@*
dtypes
2
U
Identity_18Identitycheckpoint_initializer_16*
_output_shapes
:*
T0
W
AssignVariableOp_16AssignVariableOptraining/Variable_11Identity_18*
dtype0

 checkpoint_initializer_17/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_17/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_12*
dtype0*
_output_shapes
:

*checkpoint_initializer_17/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ţ
checkpoint_initializer_17	RestoreV2 checkpoint_initializer_17/prefix&checkpoint_initializer_17/tensor_names*checkpoint_initializer_17/shape_and_slices"/device:CPU:0* 
_output_shapes
:
Ŕ*
dtypes
2
U
Identity_19Identitycheckpoint_initializer_17*
T0*
_output_shapes
:
W
AssignVariableOp_17AssignVariableOptraining/Variable_12Identity_19*
dtype0

 checkpoint_initializer_18/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_18/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_13*
dtype0*
_output_shapes
:

*checkpoint_initializer_18/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ů
checkpoint_initializer_18	RestoreV2 checkpoint_initializer_18/prefix&checkpoint_initializer_18/tensor_names*checkpoint_initializer_18/shape_and_slices"/device:CPU:0*
_output_shapes	
:*
dtypes
2
U
Identity_20Identitycheckpoint_initializer_18*
_output_shapes
:*
T0
W
AssignVariableOp_18AssignVariableOptraining/Variable_13Identity_20*
dtype0

 checkpoint_initializer_19/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_19/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_14*
dtype0*
_output_shapes
:

*checkpoint_initializer_19/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ý
checkpoint_initializer_19	RestoreV2 checkpoint_initializer_19/prefix&checkpoint_initializer_19/tensor_names*checkpoint_initializer_19/shape_and_slices"/device:CPU:0*
_output_shapes
:	
*
dtypes
2
U
Identity_21Identitycheckpoint_initializer_19*
T0*
_output_shapes
:
W
AssignVariableOp_19AssignVariableOptraining/Variable_14Identity_21*
dtype0

 checkpoint_initializer_20/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_20/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_15*
dtype0*
_output_shapes
:

*checkpoint_initializer_20/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ř
checkpoint_initializer_20	RestoreV2 checkpoint_initializer_20/prefix&checkpoint_initializer_20/tensor_names*checkpoint_initializer_20/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
:

U
Identity_22Identitycheckpoint_initializer_20*
T0*
_output_shapes
:
W
AssignVariableOp_20AssignVariableOptraining/Variable_15Identity_22*
dtype0

 checkpoint_initializer_21/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_21/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_16*
dtype0*
_output_shapes
:

*checkpoint_initializer_21/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_21	RestoreV2 checkpoint_initializer_21/prefix&checkpoint_initializer_21/tensor_names*checkpoint_initializer_21/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_23Identitycheckpoint_initializer_21*
T0*
_output_shapes
:
W
AssignVariableOp_21AssignVariableOptraining/Variable_16Identity_23*
dtype0

 checkpoint_initializer_22/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_22/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_17*
dtype0*
_output_shapes
:

*checkpoint_initializer_22/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_22	RestoreV2 checkpoint_initializer_22/prefix&checkpoint_initializer_22/tensor_names*checkpoint_initializer_22/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_24Identitycheckpoint_initializer_22*
_output_shapes
:*
T0
W
AssignVariableOp_22AssignVariableOptraining/Variable_17Identity_24*
dtype0

 checkpoint_initializer_23/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_23/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_18*
dtype0*
_output_shapes
:

*checkpoint_initializer_23/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_23	RestoreV2 checkpoint_initializer_23/prefix&checkpoint_initializer_23/tensor_names*checkpoint_initializer_23/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_25Identitycheckpoint_initializer_23*
T0*
_output_shapes
:
W
AssignVariableOp_23AssignVariableOptraining/Variable_18Identity_25*
dtype0

 checkpoint_initializer_24/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_24/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_19*
dtype0*
_output_shapes
:

*checkpoint_initializer_24/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_24	RestoreV2 checkpoint_initializer_24/prefix&checkpoint_initializer_24/tensor_names*checkpoint_initializer_24/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
:
U
Identity_26Identitycheckpoint_initializer_24*
T0*
_output_shapes
:
W
AssignVariableOp_24AssignVariableOptraining/Variable_19Identity_26*
dtype0

 checkpoint_initializer_25/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_25/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_2*
dtype0*
_output_shapes
:

*checkpoint_initializer_25/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ä
checkpoint_initializer_25	RestoreV2 checkpoint_initializer_25/prefix&checkpoint_initializer_25/tensor_names*checkpoint_initializer_25/shape_and_slices"/device:CPU:0*&
_output_shapes
: @*
dtypes
2
U
Identity_27Identitycheckpoint_initializer_25*
T0*
_output_shapes
:
V
AssignVariableOp_25AssignVariableOptraining/Variable_2Identity_27*
dtype0

 checkpoint_initializer_26/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_26/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_20*
dtype0*
_output_shapes
:

*checkpoint_initializer_26/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_26	RestoreV2 checkpoint_initializer_26/prefix&checkpoint_initializer_26/tensor_names*checkpoint_initializer_26/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_28Identitycheckpoint_initializer_26*
_output_shapes
:*
T0
W
AssignVariableOp_26AssignVariableOptraining/Variable_20Identity_28*
dtype0

 checkpoint_initializer_27/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_27/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_21*
dtype0*
_output_shapes
:

*checkpoint_initializer_27/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ř
checkpoint_initializer_27	RestoreV2 checkpoint_initializer_27/prefix&checkpoint_initializer_27/tensor_names*checkpoint_initializer_27/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_29Identitycheckpoint_initializer_27*
T0*
_output_shapes
:
W
AssignVariableOp_27AssignVariableOptraining/Variable_21Identity_29*
dtype0

 checkpoint_initializer_28/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_28/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*)
value BBtraining/Variable_22

*checkpoint_initializer_28/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_28	RestoreV2 checkpoint_initializer_28/prefix&checkpoint_initializer_28/tensor_names*checkpoint_initializer_28/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_30Identitycheckpoint_initializer_28*
T0*
_output_shapes
:
W
AssignVariableOp_28AssignVariableOptraining/Variable_22Identity_30*
dtype0

 checkpoint_initializer_29/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_29/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*)
value BBtraining/Variable_23

*checkpoint_initializer_29/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_29	RestoreV2 checkpoint_initializer_29/prefix&checkpoint_initializer_29/tensor_names*checkpoint_initializer_29/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
:
U
Identity_31Identitycheckpoint_initializer_29*
T0*
_output_shapes
:
W
AssignVariableOp_29AssignVariableOptraining/Variable_23Identity_31*
dtype0

 checkpoint_initializer_30/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_30/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_3*
dtype0*
_output_shapes
:

*checkpoint_initializer_30/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ř
checkpoint_initializer_30	RestoreV2 checkpoint_initializer_30/prefix&checkpoint_initializer_30/tensor_names*checkpoint_initializer_30/shape_and_slices"/device:CPU:0*
_output_shapes
:@*
dtypes
2
U
Identity_32Identitycheckpoint_initializer_30*
T0*
_output_shapes
:
V
AssignVariableOp_30AssignVariableOptraining/Variable_3Identity_32*
dtype0

 checkpoint_initializer_31/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_31/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_4*
dtype0*
_output_shapes
:

*checkpoint_initializer_31/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ţ
checkpoint_initializer_31	RestoreV2 checkpoint_initializer_31/prefix&checkpoint_initializer_31/tensor_names*checkpoint_initializer_31/shape_and_slices"/device:CPU:0* 
_output_shapes
:
Ŕ*
dtypes
2
U
Identity_33Identitycheckpoint_initializer_31*
T0*
_output_shapes
:
V
AssignVariableOp_31AssignVariableOptraining/Variable_4Identity_33*
dtype0

 checkpoint_initializer_32/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_32/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_5*
dtype0*
_output_shapes
:

*checkpoint_initializer_32/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ů
checkpoint_initializer_32	RestoreV2 checkpoint_initializer_32/prefix&checkpoint_initializer_32/tensor_names*checkpoint_initializer_32/shape_and_slices"/device:CPU:0*
_output_shapes	
:*
dtypes
2
U
Identity_34Identitycheckpoint_initializer_32*
T0*
_output_shapes
:
V
AssignVariableOp_32AssignVariableOptraining/Variable_5Identity_34*
dtype0

 checkpoint_initializer_33/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_33/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_6*
dtype0*
_output_shapes
:

*checkpoint_initializer_33/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ý
checkpoint_initializer_33	RestoreV2 checkpoint_initializer_33/prefix&checkpoint_initializer_33/tensor_names*checkpoint_initializer_33/shape_and_slices"/device:CPU:0*
_output_shapes
:	
*
dtypes
2
U
Identity_35Identitycheckpoint_initializer_33*
T0*
_output_shapes
:
V
AssignVariableOp_33AssignVariableOptraining/Variable_6Identity_35*
dtype0

 checkpoint_initializer_34/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_34/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*(
valueBBtraining/Variable_7

*checkpoint_initializer_34/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_34	RestoreV2 checkpoint_initializer_34/prefix&checkpoint_initializer_34/tensor_names*checkpoint_initializer_34/shape_and_slices"/device:CPU:0*
_output_shapes
:
*
dtypes
2
U
Identity_36Identitycheckpoint_initializer_34*
T0*
_output_shapes
:
V
AssignVariableOp_34AssignVariableOptraining/Variable_7Identity_36*
dtype0

 checkpoint_initializer_35/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_35/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_8*
dtype0*
_output_shapes
:

*checkpoint_initializer_35/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ä
checkpoint_initializer_35	RestoreV2 checkpoint_initializer_35/prefix&checkpoint_initializer_35/tensor_names*checkpoint_initializer_35/shape_and_slices"/device:CPU:0*&
_output_shapes
: *
dtypes
2
U
Identity_37Identitycheckpoint_initializer_35*
T0*
_output_shapes
:
V
AssignVariableOp_35AssignVariableOptraining/Variable_8Identity_37*
dtype0

 checkpoint_initializer_36/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_36/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_9*
dtype0*
_output_shapes
:

*checkpoint_initializer_36/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_36	RestoreV2 checkpoint_initializer_36/prefix&checkpoint_initializer_36/tensor_names*checkpoint_initializer_36/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
: 
U
Identity_38Identitycheckpoint_initializer_36*
T0*
_output_shapes
:
V
AssignVariableOp_36AssignVariableOptraining/Variable_9Identity_38*
dtype0
R
loss_1/tagsConst*
valueB Bloss_1*
dtype0*
_output_shapes
: 
O
loss_1ScalarSummaryloss_1/tagsloss/mul*
T0*
_output_shapes
: ˇ!
ŕ
`
/__inference_Dataset_flat_map_read_one_file_1028

args_0
identity˘TFRecordDatasetQ
compression_typeConst*
dtype0*
_output_shapes
: *
valueB B O
buffer_sizeConst*
valueB		 R*
dtype0	*
_output_shapes
: s
TFRecordDatasetTFRecordDatasetargs_0compression_type:output:0buffer_size:output:0*
_output_shapes
: a
IdentityIdentityTFRecordDataset:handle:0^TFRecordDataset*
T0*
_output_shapes
: "
identityIdentity:output:0*
_input_shapes
: 2"
TFRecordDatasetTFRecordDataset:& "
 
_user_specified_nameargs_0
Ń
R
&__inference_Dataset_map__parse_fn_1061

args_0
identity

identity_1^
ParseSingleExample/key_depthConst*
value	B	 R *
dtype0	*
_output_shapes
: c
 ParseSingleExample/Reshape/shapeConst*
dtype0*
_output_shapes
: *
valueB Ś
ParseSingleExample/ReshapeReshape%ParseSingleExample/key_depth:output:0)ParseSingleExample/Reshape/shape:output:0*
_output_shapes
: *
T0	*
Tshape0_
ParseSingleExample/key_heightConst*
value	B	 R *
dtype0	*
_output_shapes
: e
"ParseSingleExample/Reshape_1/shapeConst*
valueB *
dtype0*
_output_shapes
: Ť
ParseSingleExample/Reshape_1Reshape&ParseSingleExample/key_height:output:0+ParseSingleExample/Reshape_1/shape:output:0*
T0	*
Tshape0*
_output_shapes
: a
 ParseSingleExample/key_image_rawConst*
valueB B *
dtype0*
_output_shapes
: e
"ParseSingleExample/Reshape_2/shapeConst*
valueB *
dtype0*
_output_shapes
: Ž
ParseSingleExample/Reshape_2Reshape)ParseSingleExample/key_image_raw:output:0+ParseSingleExample/Reshape_2/shape:output:0*
_output_shapes
: *
T0*
Tshape0^
ParseSingleExample/key_labelConst*
dtype0	*
_output_shapes
: *
value	B	 R e
"ParseSingleExample/Reshape_3/shapeConst*
dtype0*
_output_shapes
: *
valueB Ş
ParseSingleExample/Reshape_3Reshape%ParseSingleExample/key_label:output:0+ParseSingleExample/Reshape_3/shape:output:0*
T0	*
Tshape0*
_output_shapes
: ^
ParseSingleExample/key_widthConst*
value	B	 R *
dtype0	*
_output_shapes
: e
"ParseSingleExample/Reshape_4/shapeConst*
valueB *
dtype0*
_output_shapes
: Ş
ParseSingleExample/Reshape_4Reshape%ParseSingleExample/key_width:output:0+ParseSingleExample/Reshape_4/shape:output:0*
_output_shapes
: *
T0	*
Tshape0Ę
%ParseSingleExample/ParseSingleExampleParseSingleExampleargs_0#ParseSingleExample/Reshape:output:0%ParseSingleExample/Reshape_1:output:0%ParseSingleExample/Reshape_2:output:0%ParseSingleExample/Reshape_3:output:0%ParseSingleExample/Reshape_4:output:0*
dense_shapes

: : : : : *
sparse_types
 *
sparse_keys
 *
Tdense	
2				*

num_sparse *8

dense_keys*
(depthheight	image_rawlabelwidth*
_output_shapes

: : : : : 
	DecodeRaw	DecodeRaw4ParseSingleExample/ParseSingleExample:dense_values:2*
little_endian(*
out_type0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Reshape/CastCast4ParseSingleExample/ParseSingleExample:dense_values:1*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
Reshape/Cast_1Cast4ParseSingleExample/ParseSingleExample:dense_values:4*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
Reshape/Cast_2Cast4ParseSingleExample/ParseSingleExample:dense_values:0*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
Reshape/shapePackReshape/Cast:y:0Reshape/Cast_1:y:0Reshape/Cast_2:y:0*
T0*

axis *
N*
_output_shapes
:y
ReshapeReshapeDecodeRaw:output:0Reshape/shape:output:0*
T0*
Tshape0*"
_output_shapes
:
CastCast4ParseSingleExample/ParseSingleExample:dense_values:3*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0S
IdentityIdentityReshape:output:0*
T0*"
_output_shapes
:A

Identity_1IdentityCast:y:0*
T0*
_output_shapes
: "!

identity_1Identity_1:output:0"
identityIdentity:output:0*
_input_shapes
: :& "
 
_user_specified_nameargs_0"&|lÁyw     ćý§	Ý=¨íH×AJěî	
Ë<¤<
:
Add
x"T
y"T
z"T"
Ttype:
2	

ArgMax

input"T
	dimension"Tidx
output"output_type" 
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
s
	AssignAdd
ref"T

value"T

output_ref"T" 
Ttype:
2	"
use_lockingbool( 
E
AssignAddVariableOp
resource
value"dtype"
dtypetype
B
AssignVariableOp
resource
value"dtype"
dtypetype
°
BatchDatasetV2
input_dataset

batch_size	
drop_remainder


handle"
parallel_copybool( "
output_types
list(type)(0" 
output_shapeslist(shape)(0
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
~
BiasAddGrad
out_backprop"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype

Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

Ŕ
Conv2DBackpropFilter

input"T
filter_sizes
out_backprop"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

ż
Conv2DBackpropInput
input_sizes
filter"T
out_backprop"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

8
DivNoNan
x"T
y"T
z"T"
Ttype:	
2
B
Equal
x"T
y"T
z
"
Ttype:
2	

W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
ˇ
FlatMapDataset
input_dataset
other_arguments2
Targuments

handle"	
ffunc"

Targuments
list(type)("
output_types
list(type)(0" 
output_shapeslist(shape)(0
B
GreaterEqual
x"T
y"T
z
"
Ttype:
2	
.
Identity

input"T
output"T"	
Ttype
N
IsVariableInitialized
ref"dtype
is_initialized
"
dtypetype

IteratorGetNext
iterator

components2output_types"
output_types
list(type)(0" 
output_shapeslist(shape)(0
C
IteratorToStringHandle
resource_handle
string_handle


IteratorV2

handle"
shared_namestring"
	containerstring"
output_types
list(type)(0" 
output_shapeslist(shape)(0
,
MakeIterator
dataset
iterator
ű

MapDataset
input_dataset
other_arguments2
Targuments

handle"	
ffunc"

Targuments
list(type)("
output_types
list(type)(0" 
output_shapeslist(shape)(0"$
use_inter_op_parallelismbool(" 
preserve_cardinalitybool( 
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
Ô
MaxPool

input"T
output"T"
Ttype0:
2	"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID":
data_formatstringNHWC:
NHWCNCHWNCHW_VECT_C
î
MaxPoolGrad

orig_input"T
orig_output"T	
grad"T
output"T"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW"
Ttype0:
2	
8
Maximum
x"T
y"T
z"T"
Ttype:

2	
N
Merge
inputs"T*N
output"T
value_index"	
Ttype"
Nint(0
8
Minimum
x"T
y"T
z"T"
Ttype:

2	

ModelDataset
input_dataset

handle"

cpu_budgetint "
output_types
list(type)(0" 
output_shapeslist(shape)(0
=
Mul
x"T
y"T
z"T"
Ttype:
2	
.
Neg
x"T
y"T"
Ttype:

2	

NoOp
Ż
OptimizeDataset
input_dataset
optimizations

handle"
output_types
list(type)(0" 
output_shapeslist(shape)(0"(
optimization_configslist(string)
 
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
6
Pow
x"T
y"T
z"T"
Ttype:

2	
L
PreventGradient

input"T
output"T"	
Ttype"
messagestring 
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
@
ReadVariableOp
resource
value"dtype"
dtypetype
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
\
	RefSwitch
data"T
pred

output_false"T
output_true"T"	
Ttype
E
Relu
features"T
activations"T"
Ttype:
2	
V
ReluGrad
	gradients"T
features"T
	backprops"T"
Ttype:
2	
{
RepeatDataset
input_dataset	
count	

handle"
output_types
list(type)(0" 
output_shapeslist(shape)(0
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
P
ScalarSummary
tags
values"T
summary"
Ttype:
2	
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
e
ShapeN
input"T*N
output"out_type*N"
Nint(0"	
Ttype"
out_typetype0:
2	
˝
ShuffleDataset
input_dataset
buffer_size	
seed		
seed2	

handle"$
reshuffle_each_iterationbool("
output_types
list(type)(0" 
output_shapeslist(shape)(0
O
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
9
Softmax
logits"T
softmax"T"
Ttype:
2

#SparseSoftmaxCrossEntropyWithLogits
features"T
labels"Tlabels	
loss"T
backprop"T"
Ttype:
2"
Tlabelstype0	:
2	
-
Sqrt
x"T
y"T"
Ttype:

2
1
Square
x"T
y"T"
Ttype:

2	
ö
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
:
Sub
x"T
y"T
z"T"
Ttype:
2	

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
M
Switch	
data"T
pred

output_false"T
output_true"T"	
Ttype

TensorSliceDataset

components2Toutput_types

handle"
Toutput_types
list(type)(0" 
output_shapeslist(shape)(0
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
q
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape
9
VarIsInitializedOp
resource
is_initialized

s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring 
&
	ZerosLike
x"T
y"T"	
Ttype*1.14.02v1.14.0-rc1-22-gaf24dc91b5Íâ

global_step/Initializer/zerosConst*
_class
loc:@global_step*
value	B	 R *
dtype0	*
_output_shapes
: 

global_step
VariableV2*
shared_name *
_class
loc:@global_step*
	container *
shape: *
dtype0	*
_output_shapes
: 
˛
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
_output_shapes
: *
T0	*
_class
loc:@global_step

!global_step/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 

global_step/cond/SwitchSwitch!global_step/IsVariableInitialized!global_step/IsVariableInitialized*
T0
*
_output_shapes
: : 
a
global_step/cond/switch_tIdentityglobal_step/cond/Switch:1*
T0
*
_output_shapes
: 
_
global_step/cond/switch_fIdentityglobal_step/cond/Switch*
T0
*
_output_shapes
: 
h
global_step/cond/pred_idIdentity!global_step/IsVariableInitialized*
T0
*
_output_shapes
: 
b
global_step/cond/readIdentityglobal_step/cond/read/Switch:1*
T0	*
_output_shapes
: 

global_step/cond/read/Switch	RefSwitchglobal_stepglobal_step/cond/pred_id*
T0	*
_class
loc:@global_step*
_output_shapes
: : 

global_step/cond/Switch_1Switchglobal_step/Initializer/zerosglobal_step/cond/pred_id*
T0	*
_class
loc:@global_step*
_output_shapes
: : 
}
global_step/cond/MergeMergeglobal_step/cond/Switch_1global_step/cond/read*
T0	*
N*
_output_shapes
: : 
S
global_step/add/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
b
global_step/addAddglobal_step/cond/Mergeglobal_step/add/y*
_output_shapes
: *
T0	
q
ConstConst"/device:CPU:0*-
value$B" B./data/mnist_train.tfrecords*
dtype0*
_output_shapes
: 
v
flat_filenames/shapeConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
˙˙˙˙˙˙˙˙˙
x
flat_filenamesReshapeConstflat_filenames/shape"/device:CPU:0*
_output_shapes
:*
T0*
Tshape0

TensorSliceDatasetTensorSliceDatasetflat_filenames"/device:CPU:0*
output_shapes
: *
Toutput_types
2*
_output_shapes
: 
Ő
FlatMapDatasetFlatMapDatasetTensorSliceDataset"/device:CPU:0*
output_shapes
: *8
f3R1
/__inference_Dataset_flat_map_read_one_file_1028*
_output_shapes
: *
output_types
2*

Targuments
 


MapDataset
MapDatasetFlatMapDataset"/device:CPU:0*#
output_shapes
:: */
f*R(
&__inference_Dataset_map__parse_fn_1061*
use_inter_op_parallelism(*
output_types
2*

Targuments
 *
preserve_cardinality( *
_output_shapes
: 
]
buffer_sizeConst"/device:CPU:0*
value
B	 Rč*
dtype0	*
_output_shapes
: 
U
seedConst"/device:CPU:0*
value	B	 R *
dtype0	*
_output_shapes
: 
V
seed2Const"/device:CPU:0*
value	B	 R *
dtype0	*
_output_shapes
: 
Ę
ShuffleDatasetShuffleDataset
MapDatasetbuffer_sizeseedseed2"/device:CPU:0*#
output_shapes
:: *
reshuffle_each_iteration(*
_output_shapes
: *
output_types
2
_
countConst"/device:CPU:0*
valueB	 R
˙˙˙˙˙˙˙˙˙*
dtype0	*
_output_shapes
: 

RepeatDatasetRepeatDatasetShuffleDatasetcount"/device:CPU:0*#
output_shapes
:: *
_output_shapes
: *
output_types
2
[

batch_sizeConst"/device:CPU:0*
dtype0	*
_output_shapes
: *
value	B	 Rd
_
drop_remainderConst"/device:CPU:0*
value	B
 Z *
dtype0
*
_output_shapes
: 
Ţ
BatchDatasetV2BatchDatasetV2RepeatDataset
batch_sizedrop_remainder"/device:CPU:0*
parallel_copy( *=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
_output_shapes
: *
output_types
2

optimizationsConst*V
valueMBKBmap_and_batch_fusionBnoop_eliminationBshuffle_and_repeat_fusion*
dtype0*
_output_shapes
:
ř
OptimizeDatasetOptimizeDatasetBatchDatasetV2optimizations*=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*F
optimization_configs.
,*map_vectorization:use_choose_fastest:false*
_output_shapes
: *
output_types
2
Ž
ModelDatasetModelDatasetOptimizeDataset*=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*

cpu_budget *
_output_shapes
: *
output_types
2
Ť

IteratorV2
IteratorV2*
	container *
_output_shapes
: *
output_types
2*
shared_name *=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
U
MakeIteratorMakeIteratorModelDataset
IteratorV2*
_class
loc:@IteratorV2
T
IteratorToStringHandleIteratorToStringHandle
IteratorV2*
_output_shapes
: 
Ĺ
IteratorGetNextIteratorGetNext
IteratorV2*
output_types
2*=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*>
_output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
v
CastCastIteratorGetNext*

SrcT0*
Truncate( *

DstT0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙
n
Cast_1CastIteratorGetNext:1*

SrcT0*
Truncate( *

DstT0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Š
.conv2d/kernel/Initializer/random_uniform/shapeConst* 
_class
loc:@conv2d/kernel*%
valueB"             *
dtype0*
_output_shapes
:

,conv2d/kernel/Initializer/random_uniform/minConst* 
_class
loc:@conv2d/kernel*
valueB
 *n§Ž˝*
dtype0*
_output_shapes
: 

,conv2d/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: * 
_class
loc:@conv2d/kernel*
valueB
 *n§Ž=
đ
6conv2d/kernel/Initializer/random_uniform/RandomUniformRandomUniform.conv2d/kernel/Initializer/random_uniform/shape*

seed *
T0* 
_class
loc:@conv2d/kernel*
seed2 *
dtype0*&
_output_shapes
: 
Ň
,conv2d/kernel/Initializer/random_uniform/subSub,conv2d/kernel/Initializer/random_uniform/max,conv2d/kernel/Initializer/random_uniform/min*
T0* 
_class
loc:@conv2d/kernel*
_output_shapes
: 
ě
,conv2d/kernel/Initializer/random_uniform/mulMul6conv2d/kernel/Initializer/random_uniform/RandomUniform,conv2d/kernel/Initializer/random_uniform/sub*&
_output_shapes
: *
T0* 
_class
loc:@conv2d/kernel
Ţ
(conv2d/kernel/Initializer/random_uniformAdd,conv2d/kernel/Initializer/random_uniform/mul,conv2d/kernel/Initializer/random_uniform/min*
T0* 
_class
loc:@conv2d/kernel*&
_output_shapes
: 
ą
conv2d/kernelVarHandleOp* 
_class
loc:@conv2d/kernel*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_nameconv2d/kernel
k
.conv2d/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d/kernel*
_output_shapes
: 

conv2d/kernel/AssignAssignVariableOpconv2d/kernel(conv2d/kernel/Initializer/random_uniform*
dtype0* 
_class
loc:@conv2d/kernel

!conv2d/kernel/Read/ReadVariableOpReadVariableOpconv2d/kernel* 
_class
loc:@conv2d/kernel*
dtype0*&
_output_shapes
: 

conv2d/bias/Initializer/zerosConst*
_class
loc:@conv2d/bias*
valueB *    *
dtype0*
_output_shapes
: 

conv2d/biasVarHandleOp*
shape: *
dtype0*
_output_shapes
: *
shared_nameconv2d/bias*
_class
loc:@conv2d/bias*
	container 
g
,conv2d/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d/bias*
_output_shapes
: 

conv2d/bias/AssignAssignVariableOpconv2d/biasconv2d/bias/Initializer/zeros*
dtype0*
_class
loc:@conv2d/bias

conv2d/bias/Read/ReadVariableOpReadVariableOpconv2d/bias*
_class
loc:@conv2d/bias*
dtype0*
_output_shapes
: 
e
conv2d/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
r
conv2d/Conv2D/ReadVariableOpReadVariableOpconv2d/kernel*
dtype0*&
_output_shapes
: 
ü
conv2d/Conv2DConv2DCastconv2d/Conv2D/ReadVariableOp*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ *
	dilations

e
conv2d/BiasAdd/ReadVariableOpReadVariableOpconv2d/bias*
dtype0*
_output_shapes
: 

conv2d/BiasAddBiasAddconv2d/Conv2Dconv2d/BiasAdd/ReadVariableOp*
T0*
data_formatNHWC*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ 
]
conv2d/ReluReluconv2d/BiasAdd*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ 
ş
max_pooling2d/MaxPoolMaxPoolconv2d/Relu*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ *
T0*
data_formatNHWC*
strides
*
ksize
*
paddingVALID
­
0conv2d_1/kernel/Initializer/random_uniform/shapeConst*"
_class
loc:@conv2d_1/kernel*%
valueB"          @   *
dtype0*
_output_shapes
:

.conv2d_1/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *"
_class
loc:@conv2d_1/kernel*
valueB
 *ÍĚL˝

.conv2d_1/kernel/Initializer/random_uniform/maxConst*"
_class
loc:@conv2d_1/kernel*
valueB
 *ÍĚL=*
dtype0*
_output_shapes
: 
ö
8conv2d_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform0conv2d_1/kernel/Initializer/random_uniform/shape*
dtype0*&
_output_shapes
: @*

seed *
T0*"
_class
loc:@conv2d_1/kernel*
seed2 
Ú
.conv2d_1/kernel/Initializer/random_uniform/subSub.conv2d_1/kernel/Initializer/random_uniform/max.conv2d_1/kernel/Initializer/random_uniform/min*
T0*"
_class
loc:@conv2d_1/kernel*
_output_shapes
: 
ô
.conv2d_1/kernel/Initializer/random_uniform/mulMul8conv2d_1/kernel/Initializer/random_uniform/RandomUniform.conv2d_1/kernel/Initializer/random_uniform/sub*
T0*"
_class
loc:@conv2d_1/kernel*&
_output_shapes
: @
ć
*conv2d_1/kernel/Initializer/random_uniformAdd.conv2d_1/kernel/Initializer/random_uniform/mul.conv2d_1/kernel/Initializer/random_uniform/min*
T0*"
_class
loc:@conv2d_1/kernel*&
_output_shapes
: @
ˇ
conv2d_1/kernelVarHandleOp*
dtype0*
_output_shapes
: * 
shared_nameconv2d_1/kernel*"
_class
loc:@conv2d_1/kernel*
	container *
shape: @
o
0conv2d_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d_1/kernel*
_output_shapes
: 

conv2d_1/kernel/AssignAssignVariableOpconv2d_1/kernel*conv2d_1/kernel/Initializer/random_uniform*"
_class
loc:@conv2d_1/kernel*
dtype0

#conv2d_1/kernel/Read/ReadVariableOpReadVariableOpconv2d_1/kernel*
dtype0*&
_output_shapes
: @*"
_class
loc:@conv2d_1/kernel

conv2d_1/bias/Initializer/zerosConst*
dtype0*
_output_shapes
:@* 
_class
loc:@conv2d_1/bias*
valueB@*    
Ľ
conv2d_1/biasVarHandleOp*
shared_nameconv2d_1/bias* 
_class
loc:@conv2d_1/bias*
	container *
shape:@*
dtype0*
_output_shapes
: 
k
.conv2d_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d_1/bias*
_output_shapes
: 

conv2d_1/bias/AssignAssignVariableOpconv2d_1/biasconv2d_1/bias/Initializer/zeros* 
_class
loc:@conv2d_1/bias*
dtype0

!conv2d_1/bias/Read/ReadVariableOpReadVariableOpconv2d_1/bias*
dtype0*
_output_shapes
:@* 
_class
loc:@conv2d_1/bias
g
conv2d_1/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
v
conv2d_1/Conv2D/ReadVariableOpReadVariableOpconv2d_1/kernel*
dtype0*&
_output_shapes
: @

conv2d_1/Conv2DConv2Dmax_pooling2d/MaxPoolconv2d_1/Conv2D/ReadVariableOp*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
i
conv2d_1/BiasAdd/ReadVariableOpReadVariableOpconv2d_1/bias*
dtype0*
_output_shapes
:@

conv2d_1/BiasAddBiasAddconv2d_1/Conv2Dconv2d_1/BiasAdd/ReadVariableOp*
T0*
data_formatNHWC*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
a
conv2d_1/ReluReluconv2d_1/BiasAdd*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@*
T0
ž
max_pooling2d_1/MaxPoolMaxPoolconv2d_1/Relu*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@*
T0*
data_formatNHWC*
strides
*
ksize
*
paddingVALID
d
flatten/ShapeShapemax_pooling2d_1/MaxPool*
_output_shapes
:*
T0*
out_type0
e
flatten/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
g
flatten/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
g
flatten/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Ą
flatten/strided_sliceStridedSliceflatten/Shapeflatten/strided_slice/stackflatten/strided_slice/stack_1flatten/strided_slice/stack_2*
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask 
b
flatten/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
valueB :
˙˙˙˙˙˙˙˙˙

flatten/Reshape/shapePackflatten/strided_sliceflatten/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 

flatten/ReshapeReshapemax_pooling2d_1/MaxPoolflatten/Reshape/shape*
T0*
Tshape0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Ŕ

-dense/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
_class
loc:@dense/kernel*
valueB"@     

+dense/kernel/Initializer/random_uniform/minConst*
_class
loc:@dense/kernel*
valueB
 *˝*
dtype0*
_output_shapes
: 

+dense/kernel/Initializer/random_uniform/maxConst*
_class
loc:@dense/kernel*
valueB
 *=*
dtype0*
_output_shapes
: 
ç
5dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform-dense/kernel/Initializer/random_uniform/shape*
T0*
_class
loc:@dense/kernel*
seed2 *
dtype0* 
_output_shapes
:
Ŕ*

seed 
Î
+dense/kernel/Initializer/random_uniform/subSub+dense/kernel/Initializer/random_uniform/max+dense/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*
_class
loc:@dense/kernel
â
+dense/kernel/Initializer/random_uniform/mulMul5dense/kernel/Initializer/random_uniform/RandomUniform+dense/kernel/Initializer/random_uniform/sub*
T0*
_class
loc:@dense/kernel* 
_output_shapes
:
Ŕ
Ô
'dense/kernel/Initializer/random_uniformAdd+dense/kernel/Initializer/random_uniform/mul+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel* 
_output_shapes
:
Ŕ
¨
dense/kernelVarHandleOp*
	container *
shape:
Ŕ*
dtype0*
_output_shapes
: *
shared_namedense/kernel*
_class
loc:@dense/kernel
i
-dense/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense/kernel*
_output_shapes
: 

dense/kernel/AssignAssignVariableOpdense/kernel'dense/kernel/Initializer/random_uniform*
_class
loc:@dense/kernel*
dtype0

 dense/kernel/Read/ReadVariableOpReadVariableOpdense/kernel*
_class
loc:@dense/kernel*
dtype0* 
_output_shapes
:
Ŕ

,dense/bias/Initializer/zeros/shape_as_tensorConst*
_class
loc:@dense/bias*
valueB:*
dtype0*
_output_shapes
:

"dense/bias/Initializer/zeros/ConstConst*
_class
loc:@dense/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
Í
dense/bias/Initializer/zerosFill,dense/bias/Initializer/zeros/shape_as_tensor"dense/bias/Initializer/zeros/Const*
_output_shapes	
:*
T0*
_class
loc:@dense/bias*

index_type0


dense/biasVarHandleOp*
shared_name
dense/bias*
_class
loc:@dense/bias*
	container *
shape:*
dtype0*
_output_shapes
: 
e
+dense/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOp
dense/bias*
_output_shapes
: 
{
dense/bias/AssignAssignVariableOp
dense/biasdense/bias/Initializer/zeros*
dtype0*
_class
loc:@dense/bias

dense/bias/Read/ReadVariableOpReadVariableOp
dense/bias*
_class
loc:@dense/bias*
dtype0*
_output_shapes	
:
j
dense/MatMul/ReadVariableOpReadVariableOpdense/kernel*
dtype0* 
_output_shapes
:
Ŕ

dense/MatMulMatMulflatten/Reshapedense/MatMul/ReadVariableOp*
T0*
transpose_a( *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_b( 
d
dense/BiasAdd/ReadVariableOpReadVariableOp
dense/bias*
dtype0*
_output_shapes	
:

dense/BiasAddBiasAdddense/MatMuldense/BiasAdd/ReadVariableOp*
data_formatNHWC*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
T

dense/ReluReludense/BiasAdd*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
Y
dropout/dropout/rateConst*
dtype0*
_output_shapes
: *
valueB
 *ÍĚĚ>
_
dropout/dropout/ShapeShape
dense/Relu*
T0*
out_type0*
_output_shapes
:
g
"dropout/dropout/random_uniform/minConst*
valueB
 *    *
dtype0*
_output_shapes
: 
g
"dropout/dropout/random_uniform/maxConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
­
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape*
dtype0*
seed2 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*

seed *
T0

"dropout/dropout/random_uniform/subSub"dropout/dropout/random_uniform/max"dropout/dropout/random_uniform/min*
T0*
_output_shapes
: 
Ž
"dropout/dropout/random_uniform/mulMul,dropout/dropout/random_uniform/RandomUniform"dropout/dropout/random_uniform/sub*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
 
dropout/dropout/random_uniformAdd"dropout/dropout/random_uniform/mul"dropout/dropout/random_uniform/min*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Z
dropout/dropout/sub/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
h
dropout/dropout/subSubdropout/dropout/sub/xdropout/dropout/rate*
T0*
_output_shapes
: 
^
dropout/dropout/truediv/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
s
dropout/dropout/truedivRealDivdropout/dropout/truediv/xdropout/dropout/sub*
_output_shapes
: *
T0

dropout/dropout/GreaterEqualGreaterEqualdropout/dropout/random_uniformdropout/dropout/rate*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
r
dropout/dropout/mulMul
dense/Reludropout/dropout/truediv*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

dropout/dropout/CastCastdropout/dropout/GreaterEqual*
Truncate( *

DstT0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*

SrcT0

z
dropout/dropout/mul_1Muldropout/dropout/muldropout/dropout/Cast*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ł
/dense_1/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_1/kernel*
valueB"   
   *
dtype0*
_output_shapes
:

-dense_1/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_1/kernel*
valueB
 *č˝*
dtype0*
_output_shapes
: 

-dense_1/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *!
_class
loc:@dense_1/kernel*
valueB
 *č=
ě
7dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_1/kernel/Initializer/random_uniform/shape*
dtype0*
_output_shapes
:	
*

seed *
T0*!
_class
loc:@dense_1/kernel*
seed2 
Ö
-dense_1/kernel/Initializer/random_uniform/subSub-dense_1/kernel/Initializer/random_uniform/max-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
: 
é
-dense_1/kernel/Initializer/random_uniform/mulMul7dense_1/kernel/Initializer/random_uniform/RandomUniform-dense_1/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
:	

Ű
)dense_1/kernel/Initializer/random_uniformAdd-dense_1/kernel/Initializer/random_uniform/mul-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
:	

­
dense_1/kernelVarHandleOp*!
_class
loc:@dense_1/kernel*
	container *
shape:	
*
dtype0*
_output_shapes
: *
shared_namedense_1/kernel
m
/dense_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_1/kernel*
_output_shapes
: 

dense_1/kernel/AssignAssignVariableOpdense_1/kernel)dense_1/kernel/Initializer/random_uniform*!
_class
loc:@dense_1/kernel*
dtype0

"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel*
dtype0*
_output_shapes
:	
*!
_class
loc:@dense_1/kernel

dense_1/bias/Initializer/zerosConst*
_class
loc:@dense_1/bias*
valueB
*    *
dtype0*
_output_shapes
:

˘
dense_1/biasVarHandleOp*
dtype0*
_output_shapes
: *
shared_namedense_1/bias*
_class
loc:@dense_1/bias*
	container *
shape:

i
-dense_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_1/bias*
_output_shapes
: 

dense_1/bias/AssignAssignVariableOpdense_1/biasdense_1/bias/Initializer/zeros*
_class
loc:@dense_1/bias*
dtype0

 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_class
loc:@dense_1/bias*
dtype0*
_output_shapes
:

m
dense_1/MatMul/ReadVariableOpReadVariableOpdense_1/kernel*
dtype0*
_output_shapes
:	

Ś
dense_1/MatMulMatMuldropout/dropout/mul_1dense_1/MatMul/ReadVariableOp*
transpose_a( *'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
transpose_b( *
T0
g
dense_1/BiasAdd/ReadVariableOpReadVariableOpdense_1/bias*
dtype0*
_output_shapes
:


dense_1/BiasAddBiasAdddense_1/MatMuldense_1/BiasAdd/ReadVariableOp*
data_formatNHWC*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
]
dense_1/SoftmaxSoftmaxdense_1/BiasAdd*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙


)Adam/iterations/Initializer/initial_valueConst*"
_class
loc:@Adam/iterations*
value	B	 R *
dtype0	*
_output_shapes
: 
§
Adam/iterationsVarHandleOp* 
shared_nameAdam/iterations*"
_class
loc:@Adam/iterations*
	container *
shape: *
dtype0	*
_output_shapes
: 
o
0Adam/iterations/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/iterations*
_output_shapes
: 

Adam/iterations/AssignAssignVariableOpAdam/iterations)Adam/iterations/Initializer/initial_value*
dtype0	*"
_class
loc:@Adam/iterations

#Adam/iterations/Read/ReadVariableOpReadVariableOpAdam/iterations*"
_class
loc:@Adam/iterations*
dtype0	*
_output_shapes
: 

!Adam/lr/Initializer/initial_valueConst*
_class
loc:@Adam/lr*
valueB
 *ÍĚĚ=*
dtype0*
_output_shapes
: 

Adam/lrVarHandleOp*
_class
loc:@Adam/lr*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name	Adam/lr
_
(Adam/lr/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/lr*
_output_shapes
: 
w
Adam/lr/AssignAssignVariableOpAdam/lr!Adam/lr/Initializer/initial_value*
dtype0*
_class
loc:@Adam/lr
w
Adam/lr/Read/ReadVariableOpReadVariableOpAdam/lr*
dtype0*
_output_shapes
: *
_class
loc:@Adam/lr

%Adam/beta_1/Initializer/initial_valueConst*
_class
loc:@Adam/beta_1*
valueB
 *fff?*
dtype0*
_output_shapes
: 

Adam/beta_1VarHandleOp*
dtype0*
_output_shapes
: *
shared_nameAdam/beta_1*
_class
loc:@Adam/beta_1*
	container *
shape: 
g
,Adam/beta_1/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/beta_1*
_output_shapes
: 

Adam/beta_1/AssignAssignVariableOpAdam/beta_1%Adam/beta_1/Initializer/initial_value*
_class
loc:@Adam/beta_1*
dtype0

Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_class
loc:@Adam/beta_1*
dtype0*
_output_shapes
: 

%Adam/beta_2/Initializer/initial_valueConst*
_class
loc:@Adam/beta_2*
valueB
 *wž?*
dtype0*
_output_shapes
: 

Adam/beta_2VarHandleOp*
dtype0*
_output_shapes
: *
shared_nameAdam/beta_2*
_class
loc:@Adam/beta_2*
	container *
shape: 
g
,Adam/beta_2/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/beta_2*
_output_shapes
: 

Adam/beta_2/AssignAssignVariableOpAdam/beta_2%Adam/beta_2/Initializer/initial_value*
_class
loc:@Adam/beta_2*
dtype0

Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_class
loc:@Adam/beta_2*
dtype0*
_output_shapes
: 

$Adam/decay/Initializer/initial_valueConst*
_class
loc:@Adam/decay*
valueB
 *    *
dtype0*
_output_shapes
: 


Adam/decayVarHandleOp*
dtype0*
_output_shapes
: *
shared_name
Adam/decay*
_class
loc:@Adam/decay*
	container *
shape: 
e
+Adam/decay/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Adam/decay*
_output_shapes
: 

Adam/decay/AssignAssignVariableOp
Adam/decay$Adam/decay/Initializer/initial_value*
_class
loc:@Adam/decay*
dtype0

Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
dtype0*
_output_shapes
: *
_class
loc:@Adam/decay
v
total/Initializer/zerosConst*
dtype0*
_output_shapes
: *
_class

loc:@total*
valueB
 *    

totalVarHandleOp*
shape: *
dtype0*
_output_shapes
: *
shared_nametotal*
_class

loc:@total*
	container 
[
&total/IsInitialized/VarIsInitializedOpVarIsInitializedOptotal*
_output_shapes
: 
g
total/AssignAssignVariableOptotaltotal/Initializer/zeros*
_class

loc:@total*
dtype0
q
total/Read/ReadVariableOpReadVariableOptotal*
_class

loc:@total*
dtype0*
_output_shapes
: 
z
count_1/Initializer/zerosConst*
_class
loc:@count_1*
valueB
 *    *
dtype0*
_output_shapes
: 

count_1VarHandleOp*
shared_name	count_1*
_class
loc:@count_1*
	container *
shape: *
dtype0*
_output_shapes
: 
_
(count_1/IsInitialized/VarIsInitializedOpVarIsInitializedOpcount_1*
_output_shapes
: 
o
count_1/AssignAssignVariableOpcount_1count_1/Initializer/zeros*
_class
loc:@count_1*
dtype0
w
count_1/Read/ReadVariableOpReadVariableOpcount_1*
dtype0*
_output_shapes
: *
_class
loc:@count_1
g
metrics/acc/ArgMax/dimensionConst*
valueB :
˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes
: 

metrics/acc/ArgMaxArgMaxdense_1/Softmaxmetrics/acc/ArgMax/dimension*
T0*
output_type0	*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tidx0
y
metrics/acc/CastCastmetrics/acc/ArgMax*

SrcT0	*
Truncate( *

DstT0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
b
metrics/acc/EqualEqualCast_1metrics/acc/Cast*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
z
metrics/acc/Cast_1Castmetrics/acc/Equal*

SrcT0
*
Truncate( *

DstT0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
[
metrics/acc/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
{
metrics/acc/SumSummetrics/acc/Cast_1metrics/acc/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
[
metrics/acc/AssignAddVariableOpAssignAddVariableOptotalmetrics/acc/Sum*
dtype0

metrics/acc/ReadVariableOpReadVariableOptotal ^metrics/acc/AssignAddVariableOp^metrics/acc/Sum*
dtype0*
_output_shapes
: 
]
metrics/acc/SizeSizemetrics/acc/Cast_1*
T0*
out_type0*
_output_shapes
: 
l
metrics/acc/Cast_2Castmetrics/acc/Size*

SrcT0*
Truncate( *

DstT0*
_output_shapes
: 

!metrics/acc/AssignAddVariableOp_1AssignAddVariableOpcount_1metrics/acc/Cast_2 ^metrics/acc/AssignAddVariableOp*
dtype0
˘
metrics/acc/ReadVariableOp_1ReadVariableOpcount_1 ^metrics/acc/AssignAddVariableOp"^metrics/acc/AssignAddVariableOp_1*
dtype0*
_output_shapes
: 

%metrics/acc/div_no_nan/ReadVariableOpReadVariableOptotal"^metrics/acc/AssignAddVariableOp_1*
dtype0*
_output_shapes
: 

'metrics/acc/div_no_nan/ReadVariableOp_1ReadVariableOpcount_1"^metrics/acc/AssignAddVariableOp_1*
dtype0*
_output_shapes
: 

metrics/acc/div_no_nanDivNoNan%metrics/acc/div_no_nan/ReadVariableOp'metrics/acc/div_no_nan/ReadVariableOp_1*
T0*
_output_shapes
: 
Y
metrics/acc/IdentityIdentitymetrics/acc/div_no_nan*
_output_shapes
: *
T0
r
loss/dense_1_loss/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
˙˙˙˙˙˙˙˙˙

loss/dense_1_loss/ReshapeReshapeCast_1loss/dense_1_loss/Reshape/shape*
T0*
Tshape0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙

loss/dense_1_loss/CastCastloss/dense_1_loss/Reshape*
Truncate( *

DstT0	*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

SrcT0
r
!loss/dense_1_loss/Reshape_1/shapeConst*
valueB"˙˙˙˙
   *
dtype0*
_output_shapes
:

loss/dense_1_loss/Reshape_1Reshapedense_1/BiasAdd!loss/dense_1_loss/Reshape_1/shape*
T0*
Tshape0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙


;loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/ShapeShapeloss/dense_1_loss/Cast*
T0	*
out_type0*
_output_shapes
:

Yloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits#SparseSoftmaxCrossEntropyWithLogitsloss/dense_1_loss/Reshape_1loss/dense_1_loss/Cast*
T0*
Tlabels0	*6
_output_shapes$
":˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

j
%loss/dense_1_loss/weighted_loss/ConstConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

Tloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/shapeConst*
dtype0*
_output_shapes
: *
valueB 

Sloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 
ě
Sloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/shapeShapeYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*
out_type0*
_output_shapes
:

Rloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
j
bloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
ż
Aloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/ShapeShapeYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogitsc^loss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success*
T0*
out_type0*
_output_shapes
:
ë
Aloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/ConstConstc^loss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *  ?

;loss/dense_1_loss/weighted_loss/broadcast_weights/ones_likeFillAloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/ShapeAloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/Const*
T0*

index_type0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ę
1loss/dense_1_loss/weighted_loss/broadcast_weightsMul%loss/dense_1_loss/weighted_loss/Const;loss/dense_1_loss/weighted_loss/broadcast_weights/ones_like*
T0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
ć
#loss/dense_1_loss/weighted_loss/MulMulYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits1loss/dense_1_loss/weighted_loss/broadcast_weights*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
a
loss/dense_1_loss/ConstConst*
valueB: *
dtype0*
_output_shapes
:

loss/dense_1_loss/SumSum#loss/dense_1_loss/weighted_loss/Mulloss/dense_1_loss/Const*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
|
loss/dense_1_loss/num_elementsSize#loss/dense_1_loss/weighted_loss/Mul*
T0*
out_type0*
_output_shapes
: 

#loss/dense_1_loss/num_elements/CastCastloss/dense_1_loss/num_elements*

SrcT0*
Truncate( *

DstT0*
_output_shapes
: 
\
loss/dense_1_loss/Const_1Const*
valueB *
dtype0*
_output_shapes
: 

loss/dense_1_loss/Sum_1Sumloss/dense_1_loss/Sumloss/dense_1_loss/Const_1*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0

loss/dense_1_loss/valueDivNoNanloss/dense_1_loss/Sum_1#loss/dense_1_loss/num_elements/Cast*
T0*
_output_shapes
: 
O

loss/mul/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
U
loss/mulMul
loss/mul/xloss/dense_1_loss/value*
T0*
_output_shapes
: 
x
training/gradients/ShapeConst*
_class
loc:@loss/mul*
valueB *
dtype0*
_output_shapes
: 
~
training/gradients/grad_ys_0Const*
dtype0*
_output_shapes
: *
_class
loc:@loss/mul*
valueB
 *  ?
§
training/gradients/FillFilltraining/gradients/Shapetraining/gradients/grad_ys_0*
T0*
_class
loc:@loss/mul*

index_type0*
_output_shapes
: 

$training/gradients/loss/mul_grad/MulMultraining/gradients/Fillloss/dense_1_loss/value*
T0*
_class
loc:@loss/mul*
_output_shapes
: 

&training/gradients/loss/mul_grad/Mul_1Multraining/gradients/Fill
loss/mul/x*
T0*
_class
loc:@loss/mul*
_output_shapes
: 
¤
5training/gradients/loss/dense_1_loss/value_grad/ShapeConst**
_class 
loc:@loss/dense_1_loss/value*
valueB *
dtype0*
_output_shapes
: 
Ś
7training/gradients/loss/dense_1_loss/value_grad/Shape_1Const*
dtype0*
_output_shapes
: **
_class 
loc:@loss/dense_1_loss/value*
valueB 
ˇ
Etraining/gradients/loss/dense_1_loss/value_grad/BroadcastGradientArgsBroadcastGradientArgs5training/gradients/loss/dense_1_loss/value_grad/Shape7training/gradients/loss/dense_1_loss/value_grad/Shape_1*
T0**
_class 
loc:@loss/dense_1_loss/value*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
ŕ
:training/gradients/loss/dense_1_loss/value_grad/div_no_nanDivNoNan&training/gradients/loss/mul_grad/Mul_1#loss/dense_1_loss/num_elements/Cast*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
§
3training/gradients/loss/dense_1_loss/value_grad/SumSum:training/gradients/loss/dense_1_loss/value_grad/div_no_nanEtraining/gradients/loss/dense_1_loss/value_grad/BroadcastGradientArgs*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: *
	keep_dims( *

Tidx0

7training/gradients/loss/dense_1_loss/value_grad/ReshapeReshape3training/gradients/loss/dense_1_loss/value_grad/Sum5training/gradients/loss/dense_1_loss/value_grad/Shape*
T0**
_class 
loc:@loss/dense_1_loss/value*
Tshape0*
_output_shapes
: 
 
3training/gradients/loss/dense_1_loss/value_grad/NegNegloss/dense_1_loss/Sum_1*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
ď
<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_1DivNoNan3training/gradients/loss/dense_1_loss/value_grad/Neg#loss/dense_1_loss/num_elements/Cast*
_output_shapes
: *
T0**
_class 
loc:@loss/dense_1_loss/value
ř
<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_2DivNoNan<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_1#loss/dense_1_loss/num_elements/Cast*
_output_shapes
: *
T0**
_class 
loc:@loss/dense_1_loss/value
í
3training/gradients/loss/dense_1_loss/value_grad/mulMul&training/gradients/loss/mul_grad/Mul_1<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_2*
_output_shapes
: *
T0**
_class 
loc:@loss/dense_1_loss/value
¤
5training/gradients/loss/dense_1_loss/value_grad/Sum_1Sum3training/gradients/loss/dense_1_loss/value_grad/mulGtraining/gradients/loss/dense_1_loss/value_grad/BroadcastGradientArgs:1*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: *
	keep_dims( *

Tidx0

9training/gradients/loss/dense_1_loss/value_grad/Reshape_1Reshape5training/gradients/loss/dense_1_loss/value_grad/Sum_17training/gradients/loss/dense_1_loss/value_grad/Shape_1*
T0**
_class 
loc:@loss/dense_1_loss/value*
Tshape0*
_output_shapes
: 
Ź
=training/gradients/loss/dense_1_loss/Sum_1_grad/Reshape/shapeConst**
_class 
loc:@loss/dense_1_loss/Sum_1*
valueB *
dtype0*
_output_shapes
: 

7training/gradients/loss/dense_1_loss/Sum_1_grad/ReshapeReshape7training/gradients/loss/dense_1_loss/value_grad/Reshape=training/gradients/loss/dense_1_loss/Sum_1_grad/Reshape/shape*
T0**
_class 
loc:@loss/dense_1_loss/Sum_1*
Tshape0*
_output_shapes
: 
¤
5training/gradients/loss/dense_1_loss/Sum_1_grad/ConstConst**
_class 
loc:@loss/dense_1_loss/Sum_1*
valueB *
dtype0*
_output_shapes
: 

4training/gradients/loss/dense_1_loss/Sum_1_grad/TileTile7training/gradients/loss/dense_1_loss/Sum_1_grad/Reshape5training/gradients/loss/dense_1_loss/Sum_1_grad/Const*

Tmultiples0*
T0**
_class 
loc:@loss/dense_1_loss/Sum_1*
_output_shapes
: 
Ż
;training/gradients/loss/dense_1_loss/Sum_grad/Reshape/shapeConst*(
_class
loc:@loss/dense_1_loss/Sum*
valueB:*
dtype0*
_output_shapes
:

5training/gradients/loss/dense_1_loss/Sum_grad/ReshapeReshape4training/gradients/loss/dense_1_loss/Sum_1_grad/Tile;training/gradients/loss/dense_1_loss/Sum_grad/Reshape/shape*
T0*(
_class
loc:@loss/dense_1_loss/Sum*
Tshape0*
_output_shapes
:
Ŕ
3training/gradients/loss/dense_1_loss/Sum_grad/ShapeShape#loss/dense_1_loss/weighted_loss/Mul*
T0*(
_class
loc:@loss/dense_1_loss/Sum*
out_type0*
_output_shapes
:

2training/gradients/loss/dense_1_loss/Sum_grad/TileTile5training/gradients/loss/dense_1_loss/Sum_grad/Reshape3training/gradients/loss/dense_1_loss/Sum_grad/Shape*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tmultiples0*
T0*(
_class
loc:@loss/dense_1_loss/Sum

Atraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/ShapeShapeYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
out_type0*
_output_shapes
:
ě
Ctraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape_1Shape1loss/dense_1_loss/weighted_loss/broadcast_weights*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
out_type0*
_output_shapes
:
ç
Qtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/ShapeCtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape_1*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/MulMul2training/gradients/loss/dense_1_loss/Sum_grad/Tile1loss/dense_1_loss/weighted_loss/broadcast_weights*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ň
?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/SumSum?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/MulQtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/BroadcastGradientArgs*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
_output_shapes
:*
	keep_dims( *

Tidx0
Ć
Ctraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/ReshapeReshape?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/SumAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
Tshape0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
˝
Atraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Mul_1MulYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits2training/gradients/loss/dense_1_loss/Sum_grad/Tile*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ř
Atraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Sum_1SumAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Mul_1Straining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
_output_shapes
:
Ě
Etraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Reshape_1ReshapeAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Sum_1Ctraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape_1*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
Tshape0
§
training/gradients/zeros_like	ZerosLike[loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits
É
training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradientPreventGradient[loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*´
message¨ĽCurrently there is no way to take the second derivative of sparse_softmax_cross_entropy_with_logits due to the fused implementation's interaction with tf.gradients()*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

ş
training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dimConst*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
valueB :
˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes
: 
ţ
|training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims
ExpandDimsCtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Reshapetraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim*

Tdim0*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

utraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mulMul|training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDimstraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradient*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits
¸
9training/gradients/loss/dense_1_loss/Reshape_1_grad/ShapeShapedense_1/BiasAdd*
T0*.
_class$
" loc:@loss/dense_1_loss/Reshape_1*
out_type0*
_output_shapes
:
č
;training/gradients/loss/dense_1_loss/Reshape_1_grad/ReshapeReshapeutraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul9training/gradients/loss/dense_1_loss/Reshape_1_grad/Shape*
T0*.
_class$
" loc:@loss/dense_1_loss/Reshape_1*
Tshape0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

ß
3training/gradients/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad;training/gradients/loss/dense_1_loss/Reshape_1_grad/Reshape*
T0*"
_class
loc:@dense_1/BiasAdd*
data_formatNHWC*
_output_shapes
:


-training/gradients/dense_1/MatMul_grad/MatMulMatMul;training/gradients/loss/dense_1_loss/Reshape_1_grad/Reshapedense_1/MatMul/ReadVariableOp*
T0*!
_class
loc:@dense_1/MatMul*
transpose_a( *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_b(

/training/gradients/dense_1/MatMul_grad/MatMul_1MatMuldropout/dropout/mul_1;training/gradients/loss/dense_1_loss/Reshape_1_grad/Reshape*
T0*!
_class
loc:@dense_1/MatMul*
transpose_a(*
_output_shapes
:	
*
transpose_b( 
°
3training/gradients/dropout/dropout/mul_1_grad/ShapeShapedropout/dropout/mul*
T0*(
_class
loc:@dropout/dropout/mul_1*
out_type0*
_output_shapes
:
ł
5training/gradients/dropout/dropout/mul_1_grad/Shape_1Shapedropout/dropout/Cast*
_output_shapes
:*
T0*(
_class
loc:@dropout/dropout/mul_1*
out_type0
Ż
Ctraining/gradients/dropout/dropout/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgs3training/gradients/dropout/dropout/mul_1_grad/Shape5training/gradients/dropout/dropout/mul_1_grad/Shape_1*
T0*(
_class
loc:@dropout/dropout/mul_1*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ú
1training/gradients/dropout/dropout/mul_1_grad/MulMul-training/gradients/dense_1/MatMul_grad/MatMuldropout/dropout/Cast*
T0*(
_class
loc:@dropout/dropout/mul_1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

1training/gradients/dropout/dropout/mul_1_grad/SumSum1training/gradients/dropout/dropout/mul_1_grad/MulCtraining/gradients/dropout/dropout/mul_1_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*(
_class
loc:@dropout/dropout/mul_1*
_output_shapes
:

5training/gradients/dropout/dropout/mul_1_grad/ReshapeReshape1training/gradients/dropout/dropout/mul_1_grad/Sum3training/gradients/dropout/dropout/mul_1_grad/Shape*
T0*(
_class
loc:@dropout/dropout/mul_1*
Tshape0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ű
3training/gradients/dropout/dropout/mul_1_grad/Mul_1Muldropout/dropout/mul-training/gradients/dense_1/MatMul_grad/MatMul*
T0*(
_class
loc:@dropout/dropout/mul_1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
3training/gradients/dropout/dropout/mul_1_grad/Sum_1Sum3training/gradients/dropout/dropout/mul_1_grad/Mul_1Etraining/gradients/dropout/dropout/mul_1_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0*(
_class
loc:@dropout/dropout/mul_1

7training/gradients/dropout/dropout/mul_1_grad/Reshape_1Reshape3training/gradients/dropout/dropout/mul_1_grad/Sum_15training/gradients/dropout/dropout/mul_1_grad/Shape_1*
T0*(
_class
loc:@dropout/dropout/mul_1*
Tshape0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ł
1training/gradients/dropout/dropout/mul_grad/ShapeShape
dense/Relu*
T0*&
_class
loc:@dropout/dropout/mul*
out_type0*
_output_shapes
:

3training/gradients/dropout/dropout/mul_grad/Shape_1Const*
dtype0*
_output_shapes
: *&
_class
loc:@dropout/dropout/mul*
valueB 
§
Atraining/gradients/dropout/dropout/mul_grad/BroadcastGradientArgsBroadcastGradientArgs1training/gradients/dropout/dropout/mul_grad/Shape3training/gradients/dropout/dropout/mul_grad/Shape_1*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
T0*&
_class
loc:@dropout/dropout/mul
á
/training/gradients/dropout/dropout/mul_grad/MulMul5training/gradients/dropout/dropout/mul_1_grad/Reshapedropout/dropout/truediv*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*&
_class
loc:@dropout/dropout/mul

/training/gradients/dropout/dropout/mul_grad/SumSum/training/gradients/dropout/dropout/mul_grad/MulAtraining/gradients/dropout/dropout/mul_grad/BroadcastGradientArgs*
T0*&
_class
loc:@dropout/dropout/mul*
_output_shapes
:*
	keep_dims( *

Tidx0

3training/gradients/dropout/dropout/mul_grad/ReshapeReshape/training/gradients/dropout/dropout/mul_grad/Sum1training/gradients/dropout/dropout/mul_grad/Shape*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*&
_class
loc:@dropout/dropout/mul*
Tshape0
Ö
1training/gradients/dropout/dropout/mul_grad/Mul_1Mul
dense/Relu5training/gradients/dropout/dropout/mul_1_grad/Reshape*
T0*&
_class
loc:@dropout/dropout/mul*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

1training/gradients/dropout/dropout/mul_grad/Sum_1Sum1training/gradients/dropout/dropout/mul_grad/Mul_1Ctraining/gradients/dropout/dropout/mul_grad/BroadcastGradientArgs:1*
T0*&
_class
loc:@dropout/dropout/mul*
_output_shapes
:*
	keep_dims( *

Tidx0
˙
5training/gradients/dropout/dropout/mul_grad/Reshape_1Reshape1training/gradients/dropout/dropout/mul_grad/Sum_13training/gradients/dropout/dropout/mul_grad/Shape_1*
_output_shapes
: *
T0*&
_class
loc:@dropout/dropout/mul*
Tshape0
Ę
+training/gradients/dense/Relu_grad/ReluGradReluGrad3training/gradients/dropout/dropout/mul_grad/Reshape
dense/Relu*
T0*
_class
loc:@dense/Relu*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ě
1training/gradients/dense/BiasAdd_grad/BiasAddGradBiasAddGrad+training/gradients/dense/Relu_grad/ReluGrad*
data_formatNHWC*
_output_shapes	
:*
T0* 
_class
loc:@dense/BiasAdd
ů
+training/gradients/dense/MatMul_grad/MatMulMatMul+training/gradients/dense/Relu_grad/ReluGraddense/MatMul/ReadVariableOp*
T0*
_class
loc:@dense/MatMul*
transpose_a( *(
_output_shapes
:˙˙˙˙˙˙˙˙˙Ŕ*
transpose_b(
ç
-training/gradients/dense/MatMul_grad/MatMul_1MatMulflatten/Reshape+training/gradients/dense/Relu_grad/ReluGrad*
T0*
_class
loc:@dense/MatMul*
transpose_a(* 
_output_shapes
:
Ŕ*
transpose_b( 
¨
-training/gradients/flatten/Reshape_grad/ShapeShapemax_pooling2d_1/MaxPool*
_output_shapes
:*
T0*"
_class
loc:@flatten/Reshape*
out_type0

/training/gradients/flatten/Reshape_grad/ReshapeReshape+training/gradients/dense/MatMul_grad/MatMul-training/gradients/flatten/Reshape_grad/Shape*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@*
T0*"
_class
loc:@flatten/Reshape*
Tshape0
Ü
;training/gradients/max_pooling2d_1/MaxPool_grad/MaxPoolGradMaxPoolGradconv2d_1/Relumax_pooling2d_1/MaxPool/training/gradients/flatten/Reshape_grad/Reshape*
T0**
_class 
loc:@max_pooling2d_1/MaxPool*
data_formatNHWC*
strides
*
ksize
*
paddingVALID*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
â
.training/gradients/conv2d_1/Relu_grad/ReluGradReluGrad;training/gradients/max_pooling2d_1/MaxPool_grad/MaxPoolGradconv2d_1/Relu*
T0* 
_class
loc:@conv2d_1/Relu*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
Ô
4training/gradients/conv2d_1/BiasAdd_grad/BiasAddGradBiasAddGrad.training/gradients/conv2d_1/Relu_grad/ReluGrad*
T0*#
_class
loc:@conv2d_1/BiasAdd*
data_formatNHWC*
_output_shapes
:@
×
.training/gradients/conv2d_1/Conv2D_grad/ShapeNShapeNmax_pooling2d/MaxPoolconv2d_1/Conv2D/ReadVariableOp*
T0*"
_class
loc:@conv2d_1/Conv2D*
out_type0*
N* 
_output_shapes
::
ˇ
;training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput.training/gradients/conv2d_1/Conv2D_grad/ShapeNconv2d_1/Conv2D/ReadVariableOp.training/gradients/conv2d_1/Relu_grad/ReluGrad*
	dilations
*
T0*"
_class
loc:@conv2d_1/Conv2D*
data_formatNHWC*
strides
*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ 
Š
<training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFiltermax_pooling2d/MaxPool0training/gradients/conv2d_1/Conv2D_grad/ShapeN:1.training/gradients/conv2d_1/Relu_grad/ReluGrad*
paddingSAME*&
_output_shapes
: @*
	dilations
*
T0*"
_class
loc:@conv2d_1/Conv2D*
data_formatNHWC*
strides
*
explicit_paddings
 *
use_cudnn_on_gpu(
ŕ
9training/gradients/max_pooling2d/MaxPool_grad/MaxPoolGradMaxPoolGradconv2d/Relumax_pooling2d/MaxPool;training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropInput*
ksize
*
paddingVALID*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ *
T0*(
_class
loc:@max_pooling2d/MaxPool*
data_formatNHWC*
strides

Ú
,training/gradients/conv2d/Relu_grad/ReluGradReluGrad9training/gradients/max_pooling2d/MaxPool_grad/MaxPoolGradconv2d/Relu*
T0*
_class
loc:@conv2d/Relu*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ 
Î
2training/gradients/conv2d/BiasAdd_grad/BiasAddGradBiasAddGrad,training/gradients/conv2d/Relu_grad/ReluGrad*
T0*!
_class
loc:@conv2d/BiasAdd*
data_formatNHWC*
_output_shapes
: 
Ŕ
,training/gradients/conv2d/Conv2D_grad/ShapeNShapeNCastconv2d/Conv2D/ReadVariableOp*
T0* 
_class
loc:@conv2d/Conv2D*
out_type0*
N* 
_output_shapes
::
­
9training/gradients/conv2d/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput,training/gradients/conv2d/Conv2D_grad/ShapeNconv2d/Conv2D/ReadVariableOp,training/gradients/conv2d/Relu_grad/ReluGrad*
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙*
	dilations
*
T0* 
_class
loc:@conv2d/Conv2D*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 

:training/gradients/conv2d/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilterCast.training/gradients/conv2d/Conv2D_grad/ShapeN:1,training/gradients/conv2d/Relu_grad/ReluGrad*
paddingSAME*&
_output_shapes
: *
	dilations
*
T0* 
_class
loc:@conv2d/Conv2D*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(
Z
training/AssignAdd/valueConst*
value	B	 R*
dtype0	*
_output_shapes
: 

training/AssignAdd	AssignAddglobal_steptraining/AssignAdd/value*
use_locking( *
T0	*
_class
loc:@global_step*
_output_shapes
: 
|
training/CastCastglobal_step/read^training/AssignAdd*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
: 
_
training/Pow/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
`
training/PowPowtraining/Pow/ReadVariableOptraining/Cast*
T0*
_output_shapes
: 
S
training/sub/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
R
training/subSubtraining/sub/xtraining/Pow*
_output_shapes
: *
T0
S
training/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
U
training/Const_1Const*
valueB
 *  *
dtype0*
_output_shapes
: 
j
training/clip_by_value/MinimumMinimumtraining/subtraining/Const_1*
_output_shapes
: *
T0
r
training/clip_by_valueMaximumtraining/clip_by_value/Minimumtraining/Const*
T0*
_output_shapes
: 
N
training/SqrtSqrttraining/clip_by_value*
T0*
_output_shapes
: 
a
training/Pow_1/ReadVariableOpReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
d
training/Pow_1Powtraining/Pow_1/ReadVariableOptraining/Cast*
T0*
_output_shapes
: 
U
training/sub_1/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
X
training/sub_1Subtraining/sub_1/xtraining/Pow_1*
T0*
_output_shapes
: 
[
training/truedivRealDivtraining/Sqrttraining/sub_1*
T0*
_output_shapes
: 
W
training/ReadVariableOpReadVariableOpAdam/lr*
dtype0*
_output_shapes
: 
_
training/mulMultraining/ReadVariableOptraining/truediv*
T0*
_output_shapes
: 
s
training/zerosConst*%
valueB *    *
dtype0*&
_output_shapes
: 
˝
training/VariableVarHandleOp*
	container *
shape: *
dtype0*
_output_shapes
: *"
shared_nametraining/Variable*$
_class
loc:@training/Variable
s
2training/Variable/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable*
_output_shapes
: 

training/Variable/AssignAssignVariableOptraining/Variabletraining/zeros*$
_class
loc:@training/Variable*
dtype0
Ľ
%training/Variable/Read/ReadVariableOpReadVariableOptraining/Variable*$
_class
loc:@training/Variable*
dtype0*&
_output_shapes
: 
]
training/zeros_1Const*
dtype0*
_output_shapes
: *
valueB *    
ˇ
training/Variable_1VarHandleOp*&
_class
loc:@training/Variable_1*
	container *
shape: *
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_1
w
4training/Variable_1/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_1*
_output_shapes
: 

training/Variable_1/AssignAssignVariableOptraining/Variable_1training/zeros_1*&
_class
loc:@training/Variable_1*
dtype0

'training/Variable_1/Read/ReadVariableOpReadVariableOptraining/Variable_1*&
_class
loc:@training/Variable_1*
dtype0*
_output_shapes
: 
y
 training/zeros_2/shape_as_tensorConst*%
valueB"          @   *
dtype0*
_output_shapes
:
[
training/zeros_2/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_2Fill training/zeros_2/shape_as_tensortraining/zeros_2/Const*
T0*

index_type0*&
_output_shapes
: @
Ă
training/Variable_2VarHandleOp*
	container *
shape: @*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_2*&
_class
loc:@training/Variable_2
w
4training/Variable_2/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_2*
_output_shapes
: 

training/Variable_2/AssignAssignVariableOptraining/Variable_2training/zeros_2*&
_class
loc:@training/Variable_2*
dtype0
Ť
'training/Variable_2/Read/ReadVariableOpReadVariableOptraining/Variable_2*&
_class
loc:@training/Variable_2*
dtype0*&
_output_shapes
: @
]
training/zeros_3Const*
valueB@*    *
dtype0*
_output_shapes
:@
ˇ
training/Variable_3VarHandleOp*$
shared_nametraining/Variable_3*&
_class
loc:@training/Variable_3*
	container *
shape:@*
dtype0*
_output_shapes
: 
w
4training/Variable_3/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_3*
_output_shapes
: 

training/Variable_3/AssignAssignVariableOptraining/Variable_3training/zeros_3*&
_class
loc:@training/Variable_3*
dtype0

'training/Variable_3/Read/ReadVariableOpReadVariableOptraining/Variable_3*&
_class
loc:@training/Variable_3*
dtype0*
_output_shapes
:@
q
 training/zeros_4/shape_as_tensorConst*
valueB"@     *
dtype0*
_output_shapes
:
[
training/zeros_4/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_4Fill training/zeros_4/shape_as_tensortraining/zeros_4/Const*
T0*

index_type0* 
_output_shapes
:
Ŕ
˝
training/Variable_4VarHandleOp*
	container *
shape:
Ŕ*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_4*&
_class
loc:@training/Variable_4
w
4training/Variable_4/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_4*
_output_shapes
: 

training/Variable_4/AssignAssignVariableOptraining/Variable_4training/zeros_4*
dtype0*&
_class
loc:@training/Variable_4
Ľ
'training/Variable_4/Read/ReadVariableOpReadVariableOptraining/Variable_4*&
_class
loc:@training/Variable_4*
dtype0* 
_output_shapes
:
Ŕ
k
 training/zeros_5/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
[
training/zeros_5/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_5Fill training/zeros_5/shape_as_tensortraining/zeros_5/Const*
T0*

index_type0*
_output_shapes	
:
¸
training/Variable_5VarHandleOp*
	container *
shape:*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_5*&
_class
loc:@training/Variable_5
w
4training/Variable_5/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_5*
_output_shapes
: 

training/Variable_5/AssignAssignVariableOptraining/Variable_5training/zeros_5*&
_class
loc:@training/Variable_5*
dtype0
 
'training/Variable_5/Read/ReadVariableOpReadVariableOptraining/Variable_5*&
_class
loc:@training/Variable_5*
dtype0*
_output_shapes	
:
q
 training/zeros_6/shape_as_tensorConst*
valueB"   
   *
dtype0*
_output_shapes
:
[
training/zeros_6/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_6Fill training/zeros_6/shape_as_tensortraining/zeros_6/Const*
_output_shapes
:	
*
T0*

index_type0
ź
training/Variable_6VarHandleOp*$
shared_nametraining/Variable_6*&
_class
loc:@training/Variable_6*
	container *
shape:	
*
dtype0*
_output_shapes
: 
w
4training/Variable_6/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_6*
_output_shapes
: 

training/Variable_6/AssignAssignVariableOptraining/Variable_6training/zeros_6*&
_class
loc:@training/Variable_6*
dtype0
¤
'training/Variable_6/Read/ReadVariableOpReadVariableOptraining/Variable_6*&
_class
loc:@training/Variable_6*
dtype0*
_output_shapes
:	

]
training/zeros_7Const*
dtype0*
_output_shapes
:
*
valueB
*    
ˇ
training/Variable_7VarHandleOp*
shape:
*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_7*&
_class
loc:@training/Variable_7*
	container 
w
4training/Variable_7/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_7*
_output_shapes
: 

training/Variable_7/AssignAssignVariableOptraining/Variable_7training/zeros_7*&
_class
loc:@training/Variable_7*
dtype0

'training/Variable_7/Read/ReadVariableOpReadVariableOptraining/Variable_7*&
_class
loc:@training/Variable_7*
dtype0*
_output_shapes
:

u
training/zeros_8Const*%
valueB *    *
dtype0*&
_output_shapes
: 
Ă
training/Variable_8VarHandleOp*
shape: *
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_8*&
_class
loc:@training/Variable_8*
	container 
w
4training/Variable_8/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_8*
_output_shapes
: 

training/Variable_8/AssignAssignVariableOptraining/Variable_8training/zeros_8*&
_class
loc:@training/Variable_8*
dtype0
Ť
'training/Variable_8/Read/ReadVariableOpReadVariableOptraining/Variable_8*
dtype0*&
_output_shapes
: *&
_class
loc:@training/Variable_8
]
training/zeros_9Const*
valueB *    *
dtype0*
_output_shapes
: 
ˇ
training/Variable_9VarHandleOp*$
shared_nametraining/Variable_9*&
_class
loc:@training/Variable_9*
	container *
shape: *
dtype0*
_output_shapes
: 
w
4training/Variable_9/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_9*
_output_shapes
: 

training/Variable_9/AssignAssignVariableOptraining/Variable_9training/zeros_9*
dtype0*&
_class
loc:@training/Variable_9

'training/Variable_9/Read/ReadVariableOpReadVariableOptraining/Variable_9*&
_class
loc:@training/Variable_9*
dtype0*
_output_shapes
: 
z
!training/zeros_10/shape_as_tensorConst*
dtype0*
_output_shapes
:*%
valueB"          @   
\
training/zeros_10/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_10Fill!training/zeros_10/shape_as_tensortraining/zeros_10/Const*&
_output_shapes
: @*
T0*

index_type0
Ć
training/Variable_10VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_10*'
_class
loc:@training/Variable_10*
	container *
shape: @
y
5training/Variable_10/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_10*
_output_shapes
: 

training/Variable_10/AssignAssignVariableOptraining/Variable_10training/zeros_10*'
_class
loc:@training/Variable_10*
dtype0
Ž
(training/Variable_10/Read/ReadVariableOpReadVariableOptraining/Variable_10*'
_class
loc:@training/Variable_10*
dtype0*&
_output_shapes
: @
^
training/zeros_11Const*
valueB@*    *
dtype0*
_output_shapes
:@
ş
training/Variable_11VarHandleOp*
shape:@*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_11*'
_class
loc:@training/Variable_11*
	container 
y
5training/Variable_11/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_11*
_output_shapes
: 

training/Variable_11/AssignAssignVariableOptraining/Variable_11training/zeros_11*'
_class
loc:@training/Variable_11*
dtype0
˘
(training/Variable_11/Read/ReadVariableOpReadVariableOptraining/Variable_11*'
_class
loc:@training/Variable_11*
dtype0*
_output_shapes
:@
r
!training/zeros_12/shape_as_tensorConst*
valueB"@     *
dtype0*
_output_shapes
:
\
training/zeros_12/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_12Fill!training/zeros_12/shape_as_tensortraining/zeros_12/Const*
T0*

index_type0* 
_output_shapes
:
Ŕ
Ŕ
training/Variable_12VarHandleOp*
shape:
Ŕ*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_12*'
_class
loc:@training/Variable_12*
	container 
y
5training/Variable_12/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_12*
_output_shapes
: 

training/Variable_12/AssignAssignVariableOptraining/Variable_12training/zeros_12*'
_class
loc:@training/Variable_12*
dtype0
¨
(training/Variable_12/Read/ReadVariableOpReadVariableOptraining/Variable_12*'
_class
loc:@training/Variable_12*
dtype0* 
_output_shapes
:
Ŕ
l
!training/zeros_13/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_13/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_13Fill!training/zeros_13/shape_as_tensortraining/zeros_13/Const*
T0*

index_type0*
_output_shapes	
:
ť
training/Variable_13VarHandleOp*%
shared_nametraining/Variable_13*'
_class
loc:@training/Variable_13*
	container *
shape:*
dtype0*
_output_shapes
: 
y
5training/Variable_13/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_13*
_output_shapes
: 

training/Variable_13/AssignAssignVariableOptraining/Variable_13training/zeros_13*
dtype0*'
_class
loc:@training/Variable_13
Ł
(training/Variable_13/Read/ReadVariableOpReadVariableOptraining/Variable_13*'
_class
loc:@training/Variable_13*
dtype0*
_output_shapes	
:
r
!training/zeros_14/shape_as_tensorConst*
valueB"   
   *
dtype0*
_output_shapes
:
\
training/zeros_14/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_14Fill!training/zeros_14/shape_as_tensortraining/zeros_14/Const*
T0*

index_type0*
_output_shapes
:	

ż
training/Variable_14VarHandleOp*%
shared_nametraining/Variable_14*'
_class
loc:@training/Variable_14*
	container *
shape:	
*
dtype0*
_output_shapes
: 
y
5training/Variable_14/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_14*
_output_shapes
: 

training/Variable_14/AssignAssignVariableOptraining/Variable_14training/zeros_14*'
_class
loc:@training/Variable_14*
dtype0
§
(training/Variable_14/Read/ReadVariableOpReadVariableOptraining/Variable_14*'
_class
loc:@training/Variable_14*
dtype0*
_output_shapes
:	

^
training/zeros_15Const*
valueB
*    *
dtype0*
_output_shapes
:

ş
training/Variable_15VarHandleOp*'
_class
loc:@training/Variable_15*
	container *
shape:
*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_15
y
5training/Variable_15/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_15*
_output_shapes
: 

training/Variable_15/AssignAssignVariableOptraining/Variable_15training/zeros_15*'
_class
loc:@training/Variable_15*
dtype0
˘
(training/Variable_15/Read/ReadVariableOpReadVariableOptraining/Variable_15*
dtype0*
_output_shapes
:
*'
_class
loc:@training/Variable_15
k
!training/zeros_16/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_16/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_16Fill!training/zeros_16/shape_as_tensortraining/zeros_16/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_16VarHandleOp*%
shared_nametraining/Variable_16*'
_class
loc:@training/Variable_16*
	container *
shape:*
dtype0*
_output_shapes
: 
y
5training/Variable_16/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_16*
_output_shapes
: 

training/Variable_16/AssignAssignVariableOptraining/Variable_16training/zeros_16*'
_class
loc:@training/Variable_16*
dtype0
˘
(training/Variable_16/Read/ReadVariableOpReadVariableOptraining/Variable_16*'
_class
loc:@training/Variable_16*
dtype0*
_output_shapes
:
k
!training/zeros_17/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_17/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_17Fill!training/zeros_17/shape_as_tensortraining/zeros_17/Const*
_output_shapes
:*
T0*

index_type0
ş
training/Variable_17VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_17*'
_class
loc:@training/Variable_17*
	container *
shape:
y
5training/Variable_17/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_17*
_output_shapes
: 

training/Variable_17/AssignAssignVariableOptraining/Variable_17training/zeros_17*'
_class
loc:@training/Variable_17*
dtype0
˘
(training/Variable_17/Read/ReadVariableOpReadVariableOptraining/Variable_17*'
_class
loc:@training/Variable_17*
dtype0*
_output_shapes
:
k
!training/zeros_18/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB:
\
training/zeros_18/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_18Fill!training/zeros_18/shape_as_tensortraining/zeros_18/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_18VarHandleOp*%
shared_nametraining/Variable_18*'
_class
loc:@training/Variable_18*
	container *
shape:*
dtype0*
_output_shapes
: 
y
5training/Variable_18/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_18*
_output_shapes
: 

training/Variable_18/AssignAssignVariableOptraining/Variable_18training/zeros_18*'
_class
loc:@training/Variable_18*
dtype0
˘
(training/Variable_18/Read/ReadVariableOpReadVariableOptraining/Variable_18*'
_class
loc:@training/Variable_18*
dtype0*
_output_shapes
:
k
!training/zeros_19/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_19/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_19Fill!training/zeros_19/shape_as_tensortraining/zeros_19/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_19VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_19*'
_class
loc:@training/Variable_19*
	container *
shape:
y
5training/Variable_19/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_19*
_output_shapes
: 

training/Variable_19/AssignAssignVariableOptraining/Variable_19training/zeros_19*'
_class
loc:@training/Variable_19*
dtype0
˘
(training/Variable_19/Read/ReadVariableOpReadVariableOptraining/Variable_19*
dtype0*
_output_shapes
:*'
_class
loc:@training/Variable_19
k
!training/zeros_20/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_20/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_20Fill!training/zeros_20/shape_as_tensortraining/zeros_20/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_20VarHandleOp*%
shared_nametraining/Variable_20*'
_class
loc:@training/Variable_20*
	container *
shape:*
dtype0*
_output_shapes
: 
y
5training/Variable_20/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_20*
_output_shapes
: 

training/Variable_20/AssignAssignVariableOptraining/Variable_20training/zeros_20*
dtype0*'
_class
loc:@training/Variable_20
˘
(training/Variable_20/Read/ReadVariableOpReadVariableOptraining/Variable_20*'
_class
loc:@training/Variable_20*
dtype0*
_output_shapes
:
k
!training/zeros_21/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_21/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_21Fill!training/zeros_21/shape_as_tensortraining/zeros_21/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_21VarHandleOp*%
shared_nametraining/Variable_21*'
_class
loc:@training/Variable_21*
	container *
shape:*
dtype0*
_output_shapes
: 
y
5training/Variable_21/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_21*
_output_shapes
: 

training/Variable_21/AssignAssignVariableOptraining/Variable_21training/zeros_21*
dtype0*'
_class
loc:@training/Variable_21
˘
(training/Variable_21/Read/ReadVariableOpReadVariableOptraining/Variable_21*'
_class
loc:@training/Variable_21*
dtype0*
_output_shapes
:
k
!training/zeros_22/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_22/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_22Fill!training/zeros_22/shape_as_tensortraining/zeros_22/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_22VarHandleOp*
	container *
shape:*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_22*'
_class
loc:@training/Variable_22
y
5training/Variable_22/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_22*
_output_shapes
: 

training/Variable_22/AssignAssignVariableOptraining/Variable_22training/zeros_22*'
_class
loc:@training/Variable_22*
dtype0
˘
(training/Variable_22/Read/ReadVariableOpReadVariableOptraining/Variable_22*'
_class
loc:@training/Variable_22*
dtype0*
_output_shapes
:
k
!training/zeros_23/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_23/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_23Fill!training/zeros_23/shape_as_tensortraining/zeros_23/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_23VarHandleOp*
shape:*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_23*'
_class
loc:@training/Variable_23*
	container 
y
5training/Variable_23/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_23*
_output_shapes
: 

training/Variable_23/AssignAssignVariableOptraining/Variable_23training/zeros_23*'
_class
loc:@training/Variable_23*
dtype0
˘
(training/Variable_23/Read/ReadVariableOpReadVariableOptraining/Variable_23*
dtype0*
_output_shapes
:*'
_class
loc:@training/Variable_23
]
training/ReadVariableOp_1ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
w
training/mul_1/ReadVariableOpReadVariableOptraining/Variable*
dtype0*&
_output_shapes
: 

training/mul_1Multraining/ReadVariableOp_1training/mul_1/ReadVariableOp*
T0*&
_output_shapes
: 
]
training/ReadVariableOp_2ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
U
training/sub_2/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
c
training/sub_2Subtraining/sub_2/xtraining/ReadVariableOp_2*
T0*
_output_shapes
: 

training/mul_2Multraining/sub_2:training/gradients/conv2d/Conv2D_grad/Conv2DBackpropFilter*
T0*&
_output_shapes
: 
d
training/addAddtraining/mul_1training/mul_2*
T0*&
_output_shapes
: 
]
training/ReadVariableOp_3ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
y
training/mul_3/ReadVariableOpReadVariableOptraining/Variable_8*
dtype0*&
_output_shapes
: 

training/mul_3Multraining/ReadVariableOp_3training/mul_3/ReadVariableOp*&
_output_shapes
: *
T0
]
training/ReadVariableOp_4ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
U
training/sub_3/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
c
training/sub_3Subtraining/sub_3/xtraining/ReadVariableOp_4*
T0*
_output_shapes
: 

training/SquareSquare:training/gradients/conv2d/Conv2D_grad/Conv2DBackpropFilter*
T0*&
_output_shapes
: 
g
training/mul_4Multraining/sub_3training/Square*
T0*&
_output_shapes
: 
f
training/add_1Addtraining/mul_3training/mul_4*
T0*&
_output_shapes
: 
b
training/mul_5Multraining/multraining/add*&
_output_shapes
: *
T0
U
training/Const_2Const*
dtype0*
_output_shapes
: *
valueB
 *    
U
training/Const_3Const*
valueB
 *  *
dtype0*
_output_shapes
: 
~
 training/clip_by_value_1/MinimumMinimumtraining/add_1training/Const_3*&
_output_shapes
: *
T0

training/clip_by_value_1Maximum training/clip_by_value_1/Minimumtraining/Const_2*
T0*&
_output_shapes
: 
b
training/Sqrt_1Sqrttraining/clip_by_value_1*
T0*&
_output_shapes
: 
U
training/add_2/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
i
training/add_2Addtraining/Sqrt_1training/add_2/y*
T0*&
_output_shapes
: 
n
training/truediv_1RealDivtraining/mul_5training/add_2*&
_output_shapes
: *
T0
o
training/ReadVariableOp_5ReadVariableOpconv2d/kernel*
dtype0*&
_output_shapes
: 
u
training/sub_4Subtraining/ReadVariableOp_5training/truediv_1*
T0*&
_output_shapes
: 
[
training/AssignVariableOpAssignVariableOptraining/Variabletraining/add*
dtype0

training/ReadVariableOp_6ReadVariableOptraining/Variable^training/AssignVariableOp*
dtype0*&
_output_shapes
: 
a
training/AssignVariableOp_1AssignVariableOptraining/Variable_8training/add_1*
dtype0

training/ReadVariableOp_7ReadVariableOptraining/Variable_8^training/AssignVariableOp_1*
dtype0*&
_output_shapes
: 
[
training/AssignVariableOp_2AssignVariableOpconv2d/kerneltraining/sub_4*
dtype0

training/ReadVariableOp_8ReadVariableOpconv2d/kernel^training/AssignVariableOp_2*
dtype0*&
_output_shapes
: 
]
training/ReadVariableOp_9ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
m
training/mul_6/ReadVariableOpReadVariableOptraining/Variable_1*
dtype0*
_output_shapes
: 
t
training/mul_6Multraining/ReadVariableOp_9training/mul_6/ReadVariableOp*
T0*
_output_shapes
: 
^
training/ReadVariableOp_10ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
U
training/sub_5/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
d
training/sub_5Subtraining/sub_5/xtraining/ReadVariableOp_10*
T0*
_output_shapes
: 
~
training/mul_7Multraining/sub_52training/gradients/conv2d/BiasAdd_grad/BiasAddGrad*
_output_shapes
: *
T0
Z
training/add_3Addtraining/mul_6training/mul_7*
T0*
_output_shapes
: 
^
training/ReadVariableOp_11ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
m
training/mul_8/ReadVariableOpReadVariableOptraining/Variable_9*
dtype0*
_output_shapes
: 
u
training/mul_8Multraining/ReadVariableOp_11training/mul_8/ReadVariableOp*
T0*
_output_shapes
: 
^
training/ReadVariableOp_12ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
U
training/sub_6/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
d
training/sub_6Subtraining/sub_6/xtraining/ReadVariableOp_12*
T0*
_output_shapes
: 
t
training/Square_1Square2training/gradients/conv2d/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
: 
]
training/mul_9Multraining/sub_6training/Square_1*
T0*
_output_shapes
: 
Z
training/add_4Addtraining/mul_8training/mul_9*
T0*
_output_shapes
: 
Y
training/mul_10Multraining/multraining/add_3*
T0*
_output_shapes
: 
U
training/Const_4Const*
valueB
 *    *
dtype0*
_output_shapes
: 
U
training/Const_5Const*
valueB
 *  *
dtype0*
_output_shapes
: 
r
 training/clip_by_value_2/MinimumMinimumtraining/add_4training/Const_5*
_output_shapes
: *
T0
|
training/clip_by_value_2Maximum training/clip_by_value_2/Minimumtraining/Const_4*
T0*
_output_shapes
: 
V
training/Sqrt_2Sqrttraining/clip_by_value_2*
T0*
_output_shapes
: 
U
training/add_5/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
]
training/add_5Addtraining/Sqrt_2training/add_5/y*
T0*
_output_shapes
: 
c
training/truediv_2RealDivtraining/mul_10training/add_5*
T0*
_output_shapes
: 
b
training/ReadVariableOp_13ReadVariableOpconv2d/bias*
dtype0*
_output_shapes
: 
j
training/sub_7Subtraining/ReadVariableOp_13training/truediv_2*
T0*
_output_shapes
: 
a
training/AssignVariableOp_3AssignVariableOptraining/Variable_1training/add_3*
dtype0

training/ReadVariableOp_14ReadVariableOptraining/Variable_1^training/AssignVariableOp_3*
dtype0*
_output_shapes
: 
a
training/AssignVariableOp_4AssignVariableOptraining/Variable_9training/add_4*
dtype0

training/ReadVariableOp_15ReadVariableOptraining/Variable_9^training/AssignVariableOp_4*
dtype0*
_output_shapes
: 
Y
training/AssignVariableOp_5AssignVariableOpconv2d/biastraining/sub_7*
dtype0

training/ReadVariableOp_16ReadVariableOpconv2d/bias^training/AssignVariableOp_5*
dtype0*
_output_shapes
: 
^
training/ReadVariableOp_17ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
z
training/mul_11/ReadVariableOpReadVariableOptraining/Variable_2*
dtype0*&
_output_shapes
: @

training/mul_11Multraining/ReadVariableOp_17training/mul_11/ReadVariableOp*
T0*&
_output_shapes
: @
^
training/ReadVariableOp_18ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
U
training/sub_8/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
d
training/sub_8Subtraining/sub_8/xtraining/ReadVariableOp_18*
_output_shapes
: *
T0

training/mul_12Multraining/sub_8<training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropFilter*
T0*&
_output_shapes
: @
h
training/add_6Addtraining/mul_11training/mul_12*&
_output_shapes
: @*
T0
^
training/ReadVariableOp_19ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
{
training/mul_13/ReadVariableOpReadVariableOptraining/Variable_10*
dtype0*&
_output_shapes
: @

training/mul_13Multraining/ReadVariableOp_19training/mul_13/ReadVariableOp*
T0*&
_output_shapes
: @
^
training/ReadVariableOp_20ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
U
training/sub_9/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
d
training/sub_9Subtraining/sub_9/xtraining/ReadVariableOp_20*
T0*
_output_shapes
: 

training/Square_2Square<training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropFilter*
T0*&
_output_shapes
: @
j
training/mul_14Multraining/sub_9training/Square_2*
T0*&
_output_shapes
: @
h
training/add_7Addtraining/mul_13training/mul_14*
T0*&
_output_shapes
: @
e
training/mul_15Multraining/multraining/add_6*
T0*&
_output_shapes
: @
U
training/Const_6Const*
valueB
 *    *
dtype0*
_output_shapes
: 
U
training/Const_7Const*
valueB
 *  *
dtype0*
_output_shapes
: 
~
 training/clip_by_value_3/MinimumMinimumtraining/add_7training/Const_7*&
_output_shapes
: @*
T0

training/clip_by_value_3Maximum training/clip_by_value_3/Minimumtraining/Const_6*
T0*&
_output_shapes
: @
b
training/Sqrt_3Sqrttraining/clip_by_value_3*&
_output_shapes
: @*
T0
U
training/add_8/yConst*
dtype0*
_output_shapes
: *
valueB
 *żÖ3
i
training/add_8Addtraining/Sqrt_3training/add_8/y*
T0*&
_output_shapes
: @
o
training/truediv_3RealDivtraining/mul_15training/add_8*
T0*&
_output_shapes
: @
r
training/ReadVariableOp_21ReadVariableOpconv2d_1/kernel*
dtype0*&
_output_shapes
: @
w
training/sub_10Subtraining/ReadVariableOp_21training/truediv_3*
T0*&
_output_shapes
: @
a
training/AssignVariableOp_6AssignVariableOptraining/Variable_2training/add_6*
dtype0

training/ReadVariableOp_22ReadVariableOptraining/Variable_2^training/AssignVariableOp_6*
dtype0*&
_output_shapes
: @
b
training/AssignVariableOp_7AssignVariableOptraining/Variable_10training/add_7*
dtype0

training/ReadVariableOp_23ReadVariableOptraining/Variable_10^training/AssignVariableOp_7*
dtype0*&
_output_shapes
: @
^
training/AssignVariableOp_8AssignVariableOpconv2d_1/kerneltraining/sub_10*
dtype0

training/ReadVariableOp_24ReadVariableOpconv2d_1/kernel^training/AssignVariableOp_8*
dtype0*&
_output_shapes
: @
^
training/ReadVariableOp_25ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
n
training/mul_16/ReadVariableOpReadVariableOptraining/Variable_3*
dtype0*
_output_shapes
:@
w
training/mul_16Multraining/ReadVariableOp_25training/mul_16/ReadVariableOp*
T0*
_output_shapes
:@
^
training/ReadVariableOp_26ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_11/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_11Subtraining/sub_11/xtraining/ReadVariableOp_26*
T0*
_output_shapes
: 

training/mul_17Multraining/sub_114training/gradients/conv2d_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:@
\
training/add_9Addtraining/mul_16training/mul_17*
T0*
_output_shapes
:@
^
training/ReadVariableOp_27ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
o
training/mul_18/ReadVariableOpReadVariableOptraining/Variable_11*
dtype0*
_output_shapes
:@
w
training/mul_18Multraining/ReadVariableOp_27training/mul_18/ReadVariableOp*
_output_shapes
:@*
T0
^
training/ReadVariableOp_28ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_12/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_12Subtraining/sub_12/xtraining/ReadVariableOp_28*
T0*
_output_shapes
: 
v
training/Square_3Square4training/gradients/conv2d_1/BiasAdd_grad/BiasAddGrad*
_output_shapes
:@*
T0
_
training/mul_19Multraining/sub_12training/Square_3*
T0*
_output_shapes
:@
]
training/add_10Addtraining/mul_18training/mul_19*
T0*
_output_shapes
:@
Y
training/mul_20Multraining/multraining/add_9*
T0*
_output_shapes
:@
U
training/Const_8Const*
dtype0*
_output_shapes
: *
valueB
 *    
U
training/Const_9Const*
valueB
 *  *
dtype0*
_output_shapes
: 
s
 training/clip_by_value_4/MinimumMinimumtraining/add_10training/Const_9*
T0*
_output_shapes
:@
|
training/clip_by_value_4Maximum training/clip_by_value_4/Minimumtraining/Const_8*
_output_shapes
:@*
T0
V
training/Sqrt_4Sqrttraining/clip_by_value_4*
T0*
_output_shapes
:@
V
training/add_11/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
_
training/add_11Addtraining/Sqrt_4training/add_11/y*
T0*
_output_shapes
:@
d
training/truediv_4RealDivtraining/mul_20training/add_11*
_output_shapes
:@*
T0
d
training/ReadVariableOp_29ReadVariableOpconv2d_1/bias*
dtype0*
_output_shapes
:@
k
training/sub_13Subtraining/ReadVariableOp_29training/truediv_4*
T0*
_output_shapes
:@
a
training/AssignVariableOp_9AssignVariableOptraining/Variable_3training/add_9*
dtype0

training/ReadVariableOp_30ReadVariableOptraining/Variable_3^training/AssignVariableOp_9*
dtype0*
_output_shapes
:@
d
training/AssignVariableOp_10AssignVariableOptraining/Variable_11training/add_10*
dtype0

training/ReadVariableOp_31ReadVariableOptraining/Variable_11^training/AssignVariableOp_10*
dtype0*
_output_shapes
:@
]
training/AssignVariableOp_11AssignVariableOpconv2d_1/biastraining/sub_13*
dtype0

training/ReadVariableOp_32ReadVariableOpconv2d_1/bias^training/AssignVariableOp_11*
dtype0*
_output_shapes
:@
^
training/ReadVariableOp_33ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
t
training/mul_21/ReadVariableOpReadVariableOptraining/Variable_4*
dtype0* 
_output_shapes
:
Ŕ
}
training/mul_21Multraining/ReadVariableOp_33training/mul_21/ReadVariableOp*
T0* 
_output_shapes
:
Ŕ
^
training/ReadVariableOp_34ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_14/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
f
training/sub_14Subtraining/sub_14/xtraining/ReadVariableOp_34*
T0*
_output_shapes
: 

training/mul_22Multraining/sub_14-training/gradients/dense/MatMul_grad/MatMul_1*
T0* 
_output_shapes
:
Ŕ
c
training/add_12Addtraining/mul_21training/mul_22*
T0* 
_output_shapes
:
Ŕ
^
training/ReadVariableOp_35ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
u
training/mul_23/ReadVariableOpReadVariableOptraining/Variable_12*
dtype0* 
_output_shapes
:
Ŕ
}
training/mul_23Multraining/ReadVariableOp_35training/mul_23/ReadVariableOp*
T0* 
_output_shapes
:
Ŕ
^
training/ReadVariableOp_36ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_15/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_15Subtraining/sub_15/xtraining/ReadVariableOp_36*
T0*
_output_shapes
: 
u
training/Square_4Square-training/gradients/dense/MatMul_grad/MatMul_1*
T0* 
_output_shapes
:
Ŕ
e
training/mul_24Multraining/sub_15training/Square_4*
T0* 
_output_shapes
:
Ŕ
c
training/add_13Addtraining/mul_23training/mul_24*
T0* 
_output_shapes
:
Ŕ
`
training/mul_25Multraining/multraining/add_12* 
_output_shapes
:
Ŕ*
T0
V
training/Const_10Const*
valueB
 *    *
dtype0*
_output_shapes
: 
V
training/Const_11Const*
valueB
 *  *
dtype0*
_output_shapes
: 
z
 training/clip_by_value_5/MinimumMinimumtraining/add_13training/Const_11* 
_output_shapes
:
Ŕ*
T0

training/clip_by_value_5Maximum training/clip_by_value_5/Minimumtraining/Const_10*
T0* 
_output_shapes
:
Ŕ
\
training/Sqrt_5Sqrttraining/clip_by_value_5* 
_output_shapes
:
Ŕ*
T0
V
training/add_14/yConst*
dtype0*
_output_shapes
: *
valueB
 *żÖ3
e
training/add_14Addtraining/Sqrt_5training/add_14/y* 
_output_shapes
:
Ŕ*
T0
j
training/truediv_5RealDivtraining/mul_25training/add_14*
T0* 
_output_shapes
:
Ŕ
i
training/ReadVariableOp_37ReadVariableOpdense/kernel*
dtype0* 
_output_shapes
:
Ŕ
q
training/sub_16Subtraining/ReadVariableOp_37training/truediv_5*
T0* 
_output_shapes
:
Ŕ
c
training/AssignVariableOp_12AssignVariableOptraining/Variable_4training/add_12*
dtype0

training/ReadVariableOp_38ReadVariableOptraining/Variable_4^training/AssignVariableOp_12*
dtype0* 
_output_shapes
:
Ŕ
d
training/AssignVariableOp_13AssignVariableOptraining/Variable_12training/add_13*
dtype0

training/ReadVariableOp_39ReadVariableOptraining/Variable_12^training/AssignVariableOp_13*
dtype0* 
_output_shapes
:
Ŕ
\
training/AssignVariableOp_14AssignVariableOpdense/kerneltraining/sub_16*
dtype0

training/ReadVariableOp_40ReadVariableOpdense/kernel^training/AssignVariableOp_14*
dtype0* 
_output_shapes
:
Ŕ
^
training/ReadVariableOp_41ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
o
training/mul_26/ReadVariableOpReadVariableOptraining/Variable_5*
dtype0*
_output_shapes	
:
x
training/mul_26Multraining/ReadVariableOp_41training/mul_26/ReadVariableOp*
_output_shapes	
:*
T0
^
training/ReadVariableOp_42ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_17/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_17Subtraining/sub_17/xtraining/ReadVariableOp_42*
T0*
_output_shapes
: 

training/mul_27Multraining/sub_171training/gradients/dense/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:
^
training/add_15Addtraining/mul_26training/mul_27*
T0*
_output_shapes	
:
^
training/ReadVariableOp_43ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
p
training/mul_28/ReadVariableOpReadVariableOptraining/Variable_13*
dtype0*
_output_shapes	
:
x
training/mul_28Multraining/ReadVariableOp_43training/mul_28/ReadVariableOp*
_output_shapes	
:*
T0
^
training/ReadVariableOp_44ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_18/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_18Subtraining/sub_18/xtraining/ReadVariableOp_44*
T0*
_output_shapes
: 
t
training/Square_5Square1training/gradients/dense/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:
`
training/mul_29Multraining/sub_18training/Square_5*
T0*
_output_shapes	
:
^
training/add_16Addtraining/mul_28training/mul_29*
T0*
_output_shapes	
:
[
training/mul_30Multraining/multraining/add_15*
T0*
_output_shapes	
:
V
training/Const_12Const*
valueB
 *    *
dtype0*
_output_shapes
: 
V
training/Const_13Const*
valueB
 *  *
dtype0*
_output_shapes
: 
u
 training/clip_by_value_6/MinimumMinimumtraining/add_16training/Const_13*
T0*
_output_shapes	
:
~
training/clip_by_value_6Maximum training/clip_by_value_6/Minimumtraining/Const_12*
T0*
_output_shapes	
:
W
training/Sqrt_6Sqrttraining/clip_by_value_6*
T0*
_output_shapes	
:
V
training/add_17/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
`
training/add_17Addtraining/Sqrt_6training/add_17/y*
_output_shapes	
:*
T0
e
training/truediv_6RealDivtraining/mul_30training/add_17*
_output_shapes	
:*
T0
b
training/ReadVariableOp_45ReadVariableOp
dense/bias*
dtype0*
_output_shapes	
:
l
training/sub_19Subtraining/ReadVariableOp_45training/truediv_6*
T0*
_output_shapes	
:
c
training/AssignVariableOp_15AssignVariableOptraining/Variable_5training/add_15*
dtype0

training/ReadVariableOp_46ReadVariableOptraining/Variable_5^training/AssignVariableOp_15*
dtype0*
_output_shapes	
:
d
training/AssignVariableOp_16AssignVariableOptraining/Variable_13training/add_16*
dtype0

training/ReadVariableOp_47ReadVariableOptraining/Variable_13^training/AssignVariableOp_16*
dtype0*
_output_shapes	
:
Z
training/AssignVariableOp_17AssignVariableOp
dense/biastraining/sub_19*
dtype0

training/ReadVariableOp_48ReadVariableOp
dense/bias^training/AssignVariableOp_17*
dtype0*
_output_shapes	
:
^
training/ReadVariableOp_49ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
s
training/mul_31/ReadVariableOpReadVariableOptraining/Variable_6*
dtype0*
_output_shapes
:	

|
training/mul_31Multraining/ReadVariableOp_49training/mul_31/ReadVariableOp*
T0*
_output_shapes
:	

^
training/ReadVariableOp_50ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_20/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_20Subtraining/sub_20/xtraining/ReadVariableOp_50*
T0*
_output_shapes
: 

training/mul_32Multraining/sub_20/training/gradients/dense_1/MatMul_grad/MatMul_1*
T0*
_output_shapes
:	

b
training/add_18Addtraining/mul_31training/mul_32*
T0*
_output_shapes
:	

^
training/ReadVariableOp_51ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
t
training/mul_33/ReadVariableOpReadVariableOptraining/Variable_14*
dtype0*
_output_shapes
:	

|
training/mul_33Multraining/ReadVariableOp_51training/mul_33/ReadVariableOp*
T0*
_output_shapes
:	

^
training/ReadVariableOp_52ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_21/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_21Subtraining/sub_21/xtraining/ReadVariableOp_52*
T0*
_output_shapes
: 
v
training/Square_6Square/training/gradients/dense_1/MatMul_grad/MatMul_1*
T0*
_output_shapes
:	

d
training/mul_34Multraining/sub_21training/Square_6*
T0*
_output_shapes
:	

b
training/add_19Addtraining/mul_33training/mul_34*
T0*
_output_shapes
:	

_
training/mul_35Multraining/multraining/add_18*
_output_shapes
:	
*
T0
V
training/Const_14Const*
valueB
 *    *
dtype0*
_output_shapes
: 
V
training/Const_15Const*
valueB
 *  *
dtype0*
_output_shapes
: 
y
 training/clip_by_value_7/MinimumMinimumtraining/add_19training/Const_15*
T0*
_output_shapes
:	


training/clip_by_value_7Maximum training/clip_by_value_7/Minimumtraining/Const_14*
T0*
_output_shapes
:	

[
training/Sqrt_7Sqrttraining/clip_by_value_7*
T0*
_output_shapes
:	

V
training/add_20/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
d
training/add_20Addtraining/Sqrt_7training/add_20/y*
T0*
_output_shapes
:	

i
training/truediv_7RealDivtraining/mul_35training/add_20*
T0*
_output_shapes
:	

j
training/ReadVariableOp_53ReadVariableOpdense_1/kernel*
dtype0*
_output_shapes
:	

p
training/sub_22Subtraining/ReadVariableOp_53training/truediv_7*
T0*
_output_shapes
:	

c
training/AssignVariableOp_18AssignVariableOptraining/Variable_6training/add_18*
dtype0

training/ReadVariableOp_54ReadVariableOptraining/Variable_6^training/AssignVariableOp_18*
dtype0*
_output_shapes
:	

d
training/AssignVariableOp_19AssignVariableOptraining/Variable_14training/add_19*
dtype0

training/ReadVariableOp_55ReadVariableOptraining/Variable_14^training/AssignVariableOp_19*
dtype0*
_output_shapes
:	

^
training/AssignVariableOp_20AssignVariableOpdense_1/kerneltraining/sub_22*
dtype0

training/ReadVariableOp_56ReadVariableOpdense_1/kernel^training/AssignVariableOp_20*
dtype0*
_output_shapes
:	

^
training/ReadVariableOp_57ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
n
training/mul_36/ReadVariableOpReadVariableOptraining/Variable_7*
dtype0*
_output_shapes
:

w
training/mul_36Multraining/ReadVariableOp_57training/mul_36/ReadVariableOp*
T0*
_output_shapes
:

^
training/ReadVariableOp_58ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_23/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_23Subtraining/sub_23/xtraining/ReadVariableOp_58*
T0*
_output_shapes
: 

training/mul_37Multraining/sub_233training/gradients/dense_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:

]
training/add_21Addtraining/mul_36training/mul_37*
T0*
_output_shapes
:

^
training/ReadVariableOp_59ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
o
training/mul_38/ReadVariableOpReadVariableOptraining/Variable_15*
dtype0*
_output_shapes
:

w
training/mul_38Multraining/ReadVariableOp_59training/mul_38/ReadVariableOp*
_output_shapes
:
*
T0
^
training/ReadVariableOp_60ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_24/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_24Subtraining/sub_24/xtraining/ReadVariableOp_60*
_output_shapes
: *
T0
u
training/Square_7Square3training/gradients/dense_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:

_
training/mul_39Multraining/sub_24training/Square_7*
_output_shapes
:
*
T0
]
training/add_22Addtraining/mul_38training/mul_39*
T0*
_output_shapes
:

Z
training/mul_40Multraining/multraining/add_21*
T0*
_output_shapes
:

V
training/Const_16Const*
valueB
 *    *
dtype0*
_output_shapes
: 
V
training/Const_17Const*
valueB
 *  *
dtype0*
_output_shapes
: 
t
 training/clip_by_value_8/MinimumMinimumtraining/add_22training/Const_17*
T0*
_output_shapes
:

}
training/clip_by_value_8Maximum training/clip_by_value_8/Minimumtraining/Const_16*
T0*
_output_shapes
:

V
training/Sqrt_8Sqrttraining/clip_by_value_8*
_output_shapes
:
*
T0
V
training/add_23/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
_
training/add_23Addtraining/Sqrt_8training/add_23/y*
T0*
_output_shapes
:

d
training/truediv_8RealDivtraining/mul_40training/add_23*
_output_shapes
:
*
T0
c
training/ReadVariableOp_61ReadVariableOpdense_1/bias*
dtype0*
_output_shapes
:

k
training/sub_25Subtraining/ReadVariableOp_61training/truediv_8*
T0*
_output_shapes
:

c
training/AssignVariableOp_21AssignVariableOptraining/Variable_7training/add_21*
dtype0

training/ReadVariableOp_62ReadVariableOptraining/Variable_7^training/AssignVariableOp_21*
dtype0*
_output_shapes
:

d
training/AssignVariableOp_22AssignVariableOptraining/Variable_15training/add_22*
dtype0

training/ReadVariableOp_63ReadVariableOptraining/Variable_15^training/AssignVariableOp_22*
dtype0*
_output_shapes
:

\
training/AssignVariableOp_23AssignVariableOpdense_1/biastraining/sub_25*
dtype0

training/ReadVariableOp_64ReadVariableOpdense_1/bias^training/AssignVariableOp_23*
dtype0*
_output_shapes
:


training_1/group_depsNoOp	^loss/mul^training/AssignVariableOp^training/AssignVariableOp_1^training/AssignVariableOp_10^training/AssignVariableOp_11^training/AssignVariableOp_12^training/AssignVariableOp_13^training/AssignVariableOp_14^training/AssignVariableOp_15^training/AssignVariableOp_16^training/AssignVariableOp_17^training/AssignVariableOp_18^training/AssignVariableOp_19^training/AssignVariableOp_2^training/AssignVariableOp_20^training/AssignVariableOp_21^training/AssignVariableOp_22^training/AssignVariableOp_23^training/AssignVariableOp_3^training/AssignVariableOp_4^training/AssignVariableOp_5^training/AssignVariableOp_6^training/AssignVariableOp_7^training/AssignVariableOp_8^training/AssignVariableOp_9
W
div_no_nan/ReadVariableOpReadVariableOptotal*
dtype0*
_output_shapes
: 
[
div_no_nan/ReadVariableOp_1ReadVariableOpcount_1*
dtype0*
_output_shapes
: 
o

div_no_nanDivNoNandiv_no_nan/ReadVariableOpdiv_no_nan/ReadVariableOp_1*
_output_shapes
: *
T0
A
IdentityIdentity
div_no_nan*
T0*
_output_shapes
: 
Y
div_no_nan_1/ReadVariableOpReadVariableOptotal*
dtype0*
_output_shapes
: 
]
div_no_nan_1/ReadVariableOp_1ReadVariableOpcount_1*
dtype0*
_output_shapes
: 
u
div_no_nan_1DivNoNandiv_no_nan_1/ReadVariableOpdiv_no_nan_1/ReadVariableOp_1*
_output_shapes
: *
T0
E

Identity_1Identitydiv_no_nan_1*
T0*
_output_shapes
: 

checkpoint_initializer/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

#checkpoint_initializer/tensor_namesConst"/device:CPU:0* 
valueBBAdam/beta_1*
dtype0*
_output_shapes
:

'checkpoint_initializer/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Č
checkpoint_initializer	RestoreV2checkpoint_initializer/prefix#checkpoint_initializer/tensor_names'checkpoint_initializer/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
: 
Q

Identity_2Identitycheckpoint_initializer*
_output_shapes
:*
T0
J
AssignVariableOpAssignVariableOpAdam/beta_1
Identity_2*
dtype0

checkpoint_initializer_1/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_1/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:* 
valueBBAdam/beta_2

)checkpoint_initializer_1/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Đ
checkpoint_initializer_1	RestoreV2checkpoint_initializer_1/prefix%checkpoint_initializer_1/tensor_names)checkpoint_initializer_1/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
S

Identity_3Identitycheckpoint_initializer_1*
T0*
_output_shapes
:
L
AssignVariableOp_1AssignVariableOpAdam/beta_2
Identity_3*
dtype0

checkpoint_initializer_2/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

%checkpoint_initializer_2/tensor_namesConst"/device:CPU:0*
valueBB
Adam/decay*
dtype0*
_output_shapes
:

)checkpoint_initializer_2/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Đ
checkpoint_initializer_2	RestoreV2checkpoint_initializer_2/prefix%checkpoint_initializer_2/tensor_names)checkpoint_initializer_2/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
S

Identity_4Identitycheckpoint_initializer_2*
T0*
_output_shapes
:
K
AssignVariableOp_2AssignVariableOp
Adam/decay
Identity_4*
dtype0

checkpoint_initializer_3/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_3/tensor_namesConst"/device:CPU:0*$
valueBBAdam/iterations*
dtype0*
_output_shapes
:

)checkpoint_initializer_3/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Đ
checkpoint_initializer_3	RestoreV2checkpoint_initializer_3/prefix%checkpoint_initializer_3/tensor_names)checkpoint_initializer_3/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2	
S

Identity_5Identitycheckpoint_initializer_3*
T0	*
_output_shapes
:
P
AssignVariableOp_3AssignVariableOpAdam/iterations
Identity_5*
dtype0	

checkpoint_initializer_4/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_4/tensor_namesConst"/device:CPU:0*
valueBBAdam/lr*
dtype0*
_output_shapes
:

)checkpoint_initializer_4/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Đ
checkpoint_initializer_4	RestoreV2checkpoint_initializer_4/prefix%checkpoint_initializer_4/tensor_names)checkpoint_initializer_4/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
S

Identity_6Identitycheckpoint_initializer_4*
T0*
_output_shapes
:
H
AssignVariableOp_4AssignVariableOpAdam/lr
Identity_6*
dtype0

checkpoint_initializer_5/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

%checkpoint_initializer_5/tensor_namesConst"/device:CPU:0* 
valueBBconv2d/bias*
dtype0*
_output_shapes
:

)checkpoint_initializer_5/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ô
checkpoint_initializer_5	RestoreV2checkpoint_initializer_5/prefix%checkpoint_initializer_5/tensor_names)checkpoint_initializer_5/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
S

Identity_7Identitycheckpoint_initializer_5*
T0*
_output_shapes
:
L
AssignVariableOp_5AssignVariableOpconv2d/bias
Identity_7*
dtype0

checkpoint_initializer_6/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_6/tensor_namesConst"/device:CPU:0*"
valueBBconv2d/kernel*
dtype0*
_output_shapes
:

)checkpoint_initializer_6/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ŕ
checkpoint_initializer_6	RestoreV2checkpoint_initializer_6/prefix%checkpoint_initializer_6/tensor_names)checkpoint_initializer_6/shape_and_slices"/device:CPU:0*
dtypes
2*&
_output_shapes
: 
S

Identity_8Identitycheckpoint_initializer_6*
_output_shapes
:*
T0
N
AssignVariableOp_6AssignVariableOpconv2d/kernel
Identity_8*
dtype0

checkpoint_initializer_7/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_7/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*"
valueBBconv2d_1/bias

)checkpoint_initializer_7/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ô
checkpoint_initializer_7	RestoreV2checkpoint_initializer_7/prefix%checkpoint_initializer_7/tensor_names)checkpoint_initializer_7/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
:@
S

Identity_9Identitycheckpoint_initializer_7*
T0*
_output_shapes
:
N
AssignVariableOp_7AssignVariableOpconv2d_1/bias
Identity_9*
dtype0

checkpoint_initializer_8/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_8/tensor_namesConst"/device:CPU:0*$
valueBBconv2d_1/kernel*
dtype0*
_output_shapes
:

)checkpoint_initializer_8/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ŕ
checkpoint_initializer_8	RestoreV2checkpoint_initializer_8/prefix%checkpoint_initializer_8/tensor_names)checkpoint_initializer_8/shape_and_slices"/device:CPU:0*
dtypes
2*&
_output_shapes
: @
T
Identity_10Identitycheckpoint_initializer_8*
T0*
_output_shapes
:
Q
AssignVariableOp_8AssignVariableOpconv2d_1/kernelIdentity_10*
dtype0

checkpoint_initializer_9/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_9/tensor_namesConst"/device:CPU:0*
valueBB
dense/bias*
dtype0*
_output_shapes
:

)checkpoint_initializer_9/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ő
checkpoint_initializer_9	RestoreV2checkpoint_initializer_9/prefix%checkpoint_initializer_9/tensor_names)checkpoint_initializer_9/shape_and_slices"/device:CPU:0*
_output_shapes	
:*
dtypes
2
T
Identity_11Identitycheckpoint_initializer_9*
T0*
_output_shapes
:
L
AssignVariableOp_9AssignVariableOp
dense/biasIdentity_11*
dtype0

 checkpoint_initializer_10/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_10/tensor_namesConst"/device:CPU:0*!
valueBBdense/kernel*
dtype0*
_output_shapes
:

*checkpoint_initializer_10/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ţ
checkpoint_initializer_10	RestoreV2 checkpoint_initializer_10/prefix&checkpoint_initializer_10/tensor_names*checkpoint_initializer_10/shape_and_slices"/device:CPU:0* 
_output_shapes
:
Ŕ*
dtypes
2
U
Identity_12Identitycheckpoint_initializer_10*
T0*
_output_shapes
:
O
AssignVariableOp_10AssignVariableOpdense/kernelIdentity_12*
dtype0

 checkpoint_initializer_11/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_11/tensor_namesConst"/device:CPU:0*!
valueBBdense_1/bias*
dtype0*
_output_shapes
:

*checkpoint_initializer_11/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_11	RestoreV2 checkpoint_initializer_11/prefix&checkpoint_initializer_11/tensor_names*checkpoint_initializer_11/shape_and_slices"/device:CPU:0*
_output_shapes
:
*
dtypes
2
U
Identity_13Identitycheckpoint_initializer_11*
T0*
_output_shapes
:
O
AssignVariableOp_11AssignVariableOpdense_1/biasIdentity_13*
dtype0

 checkpoint_initializer_12/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_12/tensor_namesConst"/device:CPU:0*#
valueBBdense_1/kernel*
dtype0*
_output_shapes
:

*checkpoint_initializer_12/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ý
checkpoint_initializer_12	RestoreV2 checkpoint_initializer_12/prefix&checkpoint_initializer_12/tensor_names*checkpoint_initializer_12/shape_and_slices"/device:CPU:0*
_output_shapes
:	
*
dtypes
2
U
Identity_14Identitycheckpoint_initializer_12*
T0*
_output_shapes
:
Q
AssignVariableOp_12AssignVariableOpdense_1/kernelIdentity_14*
dtype0

 checkpoint_initializer_13/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_13/tensor_namesConst"/device:CPU:0*&
valueBBtraining/Variable*
dtype0*
_output_shapes
:

*checkpoint_initializer_13/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ä
checkpoint_initializer_13	RestoreV2 checkpoint_initializer_13/prefix&checkpoint_initializer_13/tensor_names*checkpoint_initializer_13/shape_and_slices"/device:CPU:0*&
_output_shapes
: *
dtypes
2
U
Identity_15Identitycheckpoint_initializer_13*
T0*
_output_shapes
:
T
AssignVariableOp_13AssignVariableOptraining/VariableIdentity_15*
dtype0

 checkpoint_initializer_14/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_14/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_1*
dtype0*
_output_shapes
:

*checkpoint_initializer_14/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_14	RestoreV2 checkpoint_initializer_14/prefix&checkpoint_initializer_14/tensor_names*checkpoint_initializer_14/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
U
Identity_16Identitycheckpoint_initializer_14*
T0*
_output_shapes
:
V
AssignVariableOp_14AssignVariableOptraining/Variable_1Identity_16*
dtype0

 checkpoint_initializer_15/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_15/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_10*
dtype0*
_output_shapes
:

*checkpoint_initializer_15/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
ä
checkpoint_initializer_15	RestoreV2 checkpoint_initializer_15/prefix&checkpoint_initializer_15/tensor_names*checkpoint_initializer_15/shape_and_slices"/device:CPU:0*&
_output_shapes
: @*
dtypes
2
U
Identity_17Identitycheckpoint_initializer_15*
_output_shapes
:*
T0
W
AssignVariableOp_15AssignVariableOptraining/Variable_10Identity_17*
dtype0

 checkpoint_initializer_16/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_16/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_11*
dtype0*
_output_shapes
:

*checkpoint_initializer_16/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_16	RestoreV2 checkpoint_initializer_16/prefix&checkpoint_initializer_16/tensor_names*checkpoint_initializer_16/shape_and_slices"/device:CPU:0*
_output_shapes
:@*
dtypes
2
U
Identity_18Identitycheckpoint_initializer_16*
T0*
_output_shapes
:
W
AssignVariableOp_16AssignVariableOptraining/Variable_11Identity_18*
dtype0

 checkpoint_initializer_17/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_17/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_12*
dtype0*
_output_shapes
:

*checkpoint_initializer_17/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ţ
checkpoint_initializer_17	RestoreV2 checkpoint_initializer_17/prefix&checkpoint_initializer_17/tensor_names*checkpoint_initializer_17/shape_and_slices"/device:CPU:0* 
_output_shapes
:
Ŕ*
dtypes
2
U
Identity_19Identitycheckpoint_initializer_17*
_output_shapes
:*
T0
W
AssignVariableOp_17AssignVariableOptraining/Variable_12Identity_19*
dtype0

 checkpoint_initializer_18/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_18/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_13*
dtype0*
_output_shapes
:

*checkpoint_initializer_18/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ů
checkpoint_initializer_18	RestoreV2 checkpoint_initializer_18/prefix&checkpoint_initializer_18/tensor_names*checkpoint_initializer_18/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes	
:
U
Identity_20Identitycheckpoint_initializer_18*
T0*
_output_shapes
:
W
AssignVariableOp_18AssignVariableOptraining/Variable_13Identity_20*
dtype0

 checkpoint_initializer_19/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_19/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*)
value BBtraining/Variable_14

*checkpoint_initializer_19/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ý
checkpoint_initializer_19	RestoreV2 checkpoint_initializer_19/prefix&checkpoint_initializer_19/tensor_names*checkpoint_initializer_19/shape_and_slices"/device:CPU:0*
_output_shapes
:	
*
dtypes
2
U
Identity_21Identitycheckpoint_initializer_19*
T0*
_output_shapes
:
W
AssignVariableOp_19AssignVariableOptraining/Variable_14Identity_21*
dtype0

 checkpoint_initializer_20/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_20/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_15*
dtype0*
_output_shapes
:

*checkpoint_initializer_20/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_20	RestoreV2 checkpoint_initializer_20/prefix&checkpoint_initializer_20/tensor_names*checkpoint_initializer_20/shape_and_slices"/device:CPU:0*
_output_shapes
:
*
dtypes
2
U
Identity_22Identitycheckpoint_initializer_20*
T0*
_output_shapes
:
W
AssignVariableOp_20AssignVariableOptraining/Variable_15Identity_22*
dtype0

 checkpoint_initializer_21/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_21/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_16*
dtype0*
_output_shapes
:

*checkpoint_initializer_21/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_21	RestoreV2 checkpoint_initializer_21/prefix&checkpoint_initializer_21/tensor_names*checkpoint_initializer_21/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_23Identitycheckpoint_initializer_21*
T0*
_output_shapes
:
W
AssignVariableOp_21AssignVariableOptraining/Variable_16Identity_23*
dtype0

 checkpoint_initializer_22/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_22/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_17*
dtype0*
_output_shapes
:

*checkpoint_initializer_22/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_22	RestoreV2 checkpoint_initializer_22/prefix&checkpoint_initializer_22/tensor_names*checkpoint_initializer_22/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
:
U
Identity_24Identitycheckpoint_initializer_22*
_output_shapes
:*
T0
W
AssignVariableOp_22AssignVariableOptraining/Variable_17Identity_24*
dtype0

 checkpoint_initializer_23/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_23/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_18*
dtype0*
_output_shapes
:

*checkpoint_initializer_23/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_23	RestoreV2 checkpoint_initializer_23/prefix&checkpoint_initializer_23/tensor_names*checkpoint_initializer_23/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_25Identitycheckpoint_initializer_23*
_output_shapes
:*
T0
W
AssignVariableOp_23AssignVariableOptraining/Variable_18Identity_25*
dtype0

 checkpoint_initializer_24/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_24/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*)
value BBtraining/Variable_19

*checkpoint_initializer_24/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_24	RestoreV2 checkpoint_initializer_24/prefix&checkpoint_initializer_24/tensor_names*checkpoint_initializer_24/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_26Identitycheckpoint_initializer_24*
T0*
_output_shapes
:
W
AssignVariableOp_24AssignVariableOptraining/Variable_19Identity_26*
dtype0

 checkpoint_initializer_25/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_25/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_2*
dtype0*
_output_shapes
:

*checkpoint_initializer_25/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
ä
checkpoint_initializer_25	RestoreV2 checkpoint_initializer_25/prefix&checkpoint_initializer_25/tensor_names*checkpoint_initializer_25/shape_and_slices"/device:CPU:0*&
_output_shapes
: @*
dtypes
2
U
Identity_27Identitycheckpoint_initializer_25*
T0*
_output_shapes
:
V
AssignVariableOp_25AssignVariableOptraining/Variable_2Identity_27*
dtype0

 checkpoint_initializer_26/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_26/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*)
value BBtraining/Variable_20

*checkpoint_initializer_26/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_26	RestoreV2 checkpoint_initializer_26/prefix&checkpoint_initializer_26/tensor_names*checkpoint_initializer_26/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_28Identitycheckpoint_initializer_26*
T0*
_output_shapes
:
W
AssignVariableOp_26AssignVariableOptraining/Variable_20Identity_28*
dtype0

 checkpoint_initializer_27/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_27/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_21*
dtype0*
_output_shapes
:

*checkpoint_initializer_27/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_27	RestoreV2 checkpoint_initializer_27/prefix&checkpoint_initializer_27/tensor_names*checkpoint_initializer_27/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_29Identitycheckpoint_initializer_27*
T0*
_output_shapes
:
W
AssignVariableOp_27AssignVariableOptraining/Variable_21Identity_29*
dtype0

 checkpoint_initializer_28/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_28/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_22*
dtype0*
_output_shapes
:

*checkpoint_initializer_28/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_28	RestoreV2 checkpoint_initializer_28/prefix&checkpoint_initializer_28/tensor_names*checkpoint_initializer_28/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_30Identitycheckpoint_initializer_28*
T0*
_output_shapes
:
W
AssignVariableOp_28AssignVariableOptraining/Variable_22Identity_30*
dtype0

 checkpoint_initializer_29/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_29/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*)
value BBtraining/Variable_23

*checkpoint_initializer_29/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ř
checkpoint_initializer_29	RestoreV2 checkpoint_initializer_29/prefix&checkpoint_initializer_29/tensor_names*checkpoint_initializer_29/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_31Identitycheckpoint_initializer_29*
_output_shapes
:*
T0
W
AssignVariableOp_29AssignVariableOptraining/Variable_23Identity_31*
dtype0

 checkpoint_initializer_30/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_30/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_3*
dtype0*
_output_shapes
:

*checkpoint_initializer_30/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_30	RestoreV2 checkpoint_initializer_30/prefix&checkpoint_initializer_30/tensor_names*checkpoint_initializer_30/shape_and_slices"/device:CPU:0*
_output_shapes
:@*
dtypes
2
U
Identity_32Identitycheckpoint_initializer_30*
T0*
_output_shapes
:
V
AssignVariableOp_30AssignVariableOptraining/Variable_3Identity_32*
dtype0

 checkpoint_initializer_31/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_31/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_4*
dtype0*
_output_shapes
:

*checkpoint_initializer_31/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ţ
checkpoint_initializer_31	RestoreV2 checkpoint_initializer_31/prefix&checkpoint_initializer_31/tensor_names*checkpoint_initializer_31/shape_and_slices"/device:CPU:0*
dtypes
2* 
_output_shapes
:
Ŕ
U
Identity_33Identitycheckpoint_initializer_31*
T0*
_output_shapes
:
V
AssignVariableOp_31AssignVariableOptraining/Variable_4Identity_33*
dtype0

 checkpoint_initializer_32/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_32/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*(
valueBBtraining/Variable_5

*checkpoint_initializer_32/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ů
checkpoint_initializer_32	RestoreV2 checkpoint_initializer_32/prefix&checkpoint_initializer_32/tensor_names*checkpoint_initializer_32/shape_and_slices"/device:CPU:0*
_output_shapes	
:*
dtypes
2
U
Identity_34Identitycheckpoint_initializer_32*
T0*
_output_shapes
:
V
AssignVariableOp_32AssignVariableOptraining/Variable_5Identity_34*
dtype0

 checkpoint_initializer_33/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_33/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_6*
dtype0*
_output_shapes
:

*checkpoint_initializer_33/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ý
checkpoint_initializer_33	RestoreV2 checkpoint_initializer_33/prefix&checkpoint_initializer_33/tensor_names*checkpoint_initializer_33/shape_and_slices"/device:CPU:0*
_output_shapes
:	
*
dtypes
2
U
Identity_35Identitycheckpoint_initializer_33*
T0*
_output_shapes
:
V
AssignVariableOp_33AssignVariableOptraining/Variable_6Identity_35*
dtype0

 checkpoint_initializer_34/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_34/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*(
valueBBtraining/Variable_7

*checkpoint_initializer_34/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_34	RestoreV2 checkpoint_initializer_34/prefix&checkpoint_initializer_34/tensor_names*checkpoint_initializer_34/shape_and_slices"/device:CPU:0*
_output_shapes
:
*
dtypes
2
U
Identity_36Identitycheckpoint_initializer_34*
_output_shapes
:*
T0
V
AssignVariableOp_34AssignVariableOptraining/Variable_7Identity_36*
dtype0

 checkpoint_initializer_35/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_35/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_8*
dtype0*
_output_shapes
:

*checkpoint_initializer_35/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ä
checkpoint_initializer_35	RestoreV2 checkpoint_initializer_35/prefix&checkpoint_initializer_35/tensor_names*checkpoint_initializer_35/shape_and_slices"/device:CPU:0*
dtypes
2*&
_output_shapes
: 
U
Identity_37Identitycheckpoint_initializer_35*
T0*
_output_shapes
:
V
AssignVariableOp_35AssignVariableOptraining/Variable_8Identity_37*
dtype0

 checkpoint_initializer_36/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_36/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_9*
dtype0*
_output_shapes
:

*checkpoint_initializer_36/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_36	RestoreV2 checkpoint_initializer_36/prefix&checkpoint_initializer_36/tensor_names*checkpoint_initializer_36/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
U
Identity_38Identitycheckpoint_initializer_36*
T0*
_output_shapes
:
V
AssignVariableOp_36AssignVariableOptraining/Variable_9Identity_38*
dtype0
R
loss_1/tagsConst*
valueB Bloss_1*
dtype0*
_output_shapes
: 
O
loss_1ScalarSummaryloss_1/tagsloss/mul*
_output_shapes
: *
T0ˇ!
ŕ
`
/__inference_Dataset_flat_map_read_one_file_1028

args_0
identity˘TFRecordDatasetQ
compression_typeConst*
valueB B *
dtype0*
_output_shapes
: O
buffer_sizeConst*
valueB		 R*
dtype0	*
_output_shapes
: s
TFRecordDatasetTFRecordDatasetargs_0compression_type:output:0buffer_size:output:0*
_output_shapes
: a
IdentityIdentityTFRecordDataset:handle:0^TFRecordDataset*
T0*
_output_shapes
: "
identityIdentity:output:0*
_input_shapes
: 2"
TFRecordDatasetTFRecordDataset:& "
 
_user_specified_nameargs_0
Ń
R
&__inference_Dataset_map__parse_fn_1061

args_0
identity

identity_1^
ParseSingleExample/key_depthConst*
value	B	 R *
dtype0	*
_output_shapes
: c
 ParseSingleExample/Reshape/shapeConst*
valueB *
dtype0*
_output_shapes
: Ś
ParseSingleExample/ReshapeReshape%ParseSingleExample/key_depth:output:0)ParseSingleExample/Reshape/shape:output:0*
T0	*
Tshape0*
_output_shapes
: _
ParseSingleExample/key_heightConst*
value	B	 R *
dtype0	*
_output_shapes
: e
"ParseSingleExample/Reshape_1/shapeConst*
valueB *
dtype0*
_output_shapes
: Ť
ParseSingleExample/Reshape_1Reshape&ParseSingleExample/key_height:output:0+ParseSingleExample/Reshape_1/shape:output:0*
T0	*
Tshape0*
_output_shapes
: a
 ParseSingleExample/key_image_rawConst*
valueB B *
dtype0*
_output_shapes
: e
"ParseSingleExample/Reshape_2/shapeConst*
valueB *
dtype0*
_output_shapes
: Ž
ParseSingleExample/Reshape_2Reshape)ParseSingleExample/key_image_raw:output:0+ParseSingleExample/Reshape_2/shape:output:0*
T0*
Tshape0*
_output_shapes
: ^
ParseSingleExample/key_labelConst*
value	B	 R *
dtype0	*
_output_shapes
: e
"ParseSingleExample/Reshape_3/shapeConst*
valueB *
dtype0*
_output_shapes
: Ş
ParseSingleExample/Reshape_3Reshape%ParseSingleExample/key_label:output:0+ParseSingleExample/Reshape_3/shape:output:0*
T0	*
Tshape0*
_output_shapes
: ^
ParseSingleExample/key_widthConst*
value	B	 R *
dtype0	*
_output_shapes
: e
"ParseSingleExample/Reshape_4/shapeConst*
valueB *
dtype0*
_output_shapes
: Ş
ParseSingleExample/Reshape_4Reshape%ParseSingleExample/key_width:output:0+ParseSingleExample/Reshape_4/shape:output:0*
T0	*
Tshape0*
_output_shapes
: Ę
%ParseSingleExample/ParseSingleExampleParseSingleExampleargs_0#ParseSingleExample/Reshape:output:0%ParseSingleExample/Reshape_1:output:0%ParseSingleExample/Reshape_2:output:0%ParseSingleExample/Reshape_3:output:0%ParseSingleExample/Reshape_4:output:0*
dense_shapes

: : : : : *
sparse_types
 *
sparse_keys
 *
Tdense	
2				*

num_sparse *8

dense_keys*
(depthheight	image_rawlabelwidth*
_output_shapes

: : : : : 
	DecodeRaw	DecodeRaw4ParseSingleExample/ParseSingleExample:dense_values:2*
little_endian(*
out_type0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Reshape/CastCast4ParseSingleExample/ParseSingleExample:dense_values:1*
Truncate( *

DstT0*
_output_shapes
: *

SrcT0	
Reshape/Cast_1Cast4ParseSingleExample/ParseSingleExample:dense_values:4*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
: 
Reshape/Cast_2Cast4ParseSingleExample/ParseSingleExample:dense_values:0*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
: 
Reshape/shapePackReshape/Cast:y:0Reshape/Cast_1:y:0Reshape/Cast_2:y:0*
N*
_output_shapes
:*
T0*

axis y
ReshapeReshapeDecodeRaw:output:0Reshape/shape:output:0*"
_output_shapes
:*
T0*
Tshape0
CastCast4ParseSingleExample/ParseSingleExample:dense_values:3*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
: S
IdentityIdentityReshape:output:0*
T0*"
_output_shapes
:A

Identity_1IdentityCast:y:0*
T0*
_output_shapes
: "!

identity_1Identity_1:output:0"
identityIdentity:output:0*
_input_shapes
: :& "
 
_user_specified_nameargs_0"&"Î
metric_variablesšś
]
	count_1:0count_1/Assigncount_1/Read/ReadVariableOp:0(2count_1/Initializer/zeros:0@H
U
total:0total/Assigntotal/Read/ReadVariableOp:0(2total/Initializer/zeros:0@H"m
global_step^\
Z
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0H"Č
cond_contextˇ´
Ć
global_step/cond/cond_textglobal_step/cond/pred_id:0global_step/cond/switch_t:0 *ě
global_step/cond/pred_id:0
global_step/cond/read/Switch:1
global_step/cond/read:0
global_step/cond/switch_t:0
global_step:0/
global_step:0global_step/cond/read/Switch:18
global_step/cond/pred_id:0global_step/cond/pred_id:0
č
global_step/cond/cond_text_1global_step/cond/pred_id:0global_step/cond/switch_f:0*
global_step/Initializer/zeros:0
global_step/cond/Switch_1:0
global_step/cond/Switch_1:1
global_step/cond/pred_id:0
global_step/cond/switch_f:0>
global_step/Initializer/zeros:0global_step/cond/Switch_1:08
global_step/cond/pred_id:0global_step/cond/pred_id:0"2
global_step_read_op_cache

global_step/add:0"
	iterators

IteratorV2:0"
	summaries


loss_1:0""
trainable_variablesë!č!
j
conv2d/kernel:0AssignVariableOp_6#conv2d/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_6:08
f
conv2d/bias:0AssignVariableOp_5!conv2d/bias/Read/ReadVariableOp:0(2checkpoint_initializer_5:08
n
conv2d_1/kernel:0AssignVariableOp_8%conv2d_1/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_8:08
j
conv2d_1/bias:0AssignVariableOp_7#conv2d_1/bias/Read/ReadVariableOp:0(2checkpoint_initializer_7:08
j
dense/kernel:0AssignVariableOp_10"dense/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_10:08
d
dense/bias:0AssignVariableOp_9 dense/bias/Read/ReadVariableOp:0(2checkpoint_initializer_9:08
n
dense_1/kernel:0AssignVariableOp_12$dense_1/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_12:08
j
dense_1/bias:0AssignVariableOp_11"dense_1/bias/Read/ReadVariableOp:0(2checkpoint_initializer_11:08
n
Adam/iterations:0AssignVariableOp_3%Adam/iterations/Read/ReadVariableOp:0(2checkpoint_initializer_3:08
^
	Adam/lr:0AssignVariableOp_4Adam/lr/Read/ReadVariableOp:0(2checkpoint_initializer_4:08
b
Adam/beta_1:0AssignVariableOp!Adam/beta_1/Read/ReadVariableOp:0(2checkpoint_initializer:08
f
Adam/beta_2:0AssignVariableOp_1!Adam/beta_2/Read/ReadVariableOp:0(2checkpoint_initializer_1:08
d
Adam/decay:0AssignVariableOp_2 Adam/decay/Read/ReadVariableOp:0(2checkpoint_initializer_2:08
t
training/Variable:0AssignVariableOp_13'training/Variable/Read/ReadVariableOp:0(2checkpoint_initializer_13:08
x
training/Variable_1:0AssignVariableOp_14)training/Variable_1/Read/ReadVariableOp:0(2checkpoint_initializer_14:08
x
training/Variable_2:0AssignVariableOp_25)training/Variable_2/Read/ReadVariableOp:0(2checkpoint_initializer_25:08
x
training/Variable_3:0AssignVariableOp_30)training/Variable_3/Read/ReadVariableOp:0(2checkpoint_initializer_30:08
x
training/Variable_4:0AssignVariableOp_31)training/Variable_4/Read/ReadVariableOp:0(2checkpoint_initializer_31:08
x
training/Variable_5:0AssignVariableOp_32)training/Variable_5/Read/ReadVariableOp:0(2checkpoint_initializer_32:08
x
training/Variable_6:0AssignVariableOp_33)training/Variable_6/Read/ReadVariableOp:0(2checkpoint_initializer_33:08
x
training/Variable_7:0AssignVariableOp_34)training/Variable_7/Read/ReadVariableOp:0(2checkpoint_initializer_34:08
x
training/Variable_8:0AssignVariableOp_35)training/Variable_8/Read/ReadVariableOp:0(2checkpoint_initializer_35:08
x
training/Variable_9:0AssignVariableOp_36)training/Variable_9/Read/ReadVariableOp:0(2checkpoint_initializer_36:08
z
training/Variable_10:0AssignVariableOp_15*training/Variable_10/Read/ReadVariableOp:0(2checkpoint_initializer_15:08
z
training/Variable_11:0AssignVariableOp_16*training/Variable_11/Read/ReadVariableOp:0(2checkpoint_initializer_16:08
z
training/Variable_12:0AssignVariableOp_17*training/Variable_12/Read/ReadVariableOp:0(2checkpoint_initializer_17:08
z
training/Variable_13:0AssignVariableOp_18*training/Variable_13/Read/ReadVariableOp:0(2checkpoint_initializer_18:08
z
training/Variable_14:0AssignVariableOp_19*training/Variable_14/Read/ReadVariableOp:0(2checkpoint_initializer_19:08
z
training/Variable_15:0AssignVariableOp_20*training/Variable_15/Read/ReadVariableOp:0(2checkpoint_initializer_20:08
z
training/Variable_16:0AssignVariableOp_21*training/Variable_16/Read/ReadVariableOp:0(2checkpoint_initializer_21:08
z
training/Variable_17:0AssignVariableOp_22*training/Variable_17/Read/ReadVariableOp:0(2checkpoint_initializer_22:08
z
training/Variable_18:0AssignVariableOp_23*training/Variable_18/Read/ReadVariableOp:0(2checkpoint_initializer_23:08
z
training/Variable_19:0AssignVariableOp_24*training/Variable_19/Read/ReadVariableOp:0(2checkpoint_initializer_24:08
z
training/Variable_20:0AssignVariableOp_26*training/Variable_20/Read/ReadVariableOp:0(2checkpoint_initializer_26:08
z
training/Variable_21:0AssignVariableOp_27*training/Variable_21/Read/ReadVariableOp:0(2checkpoint_initializer_27:08
z
training/Variable_22:0AssignVariableOp_28*training/Variable_22/Read/ReadVariableOp:0(2checkpoint_initializer_28:08
z
training/Variable_23:0AssignVariableOp_29*training/Variable_23/Read/ReadVariableOp:0(2checkpoint_initializer_29:08"Í
local_variablesšś
]
	count_1:0count_1/Assigncount_1/Read/ReadVariableOp:0(2count_1/Initializer/zeros:0@H
U
total:0total/Assigntotal/Read/ReadVariableOp:0(2total/Initializer/zeros:0@H"Ő"
	variablesÇ"Ä"
Z
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0H
j
conv2d/kernel:0AssignVariableOp_6#conv2d/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_6:08
f
conv2d/bias:0AssignVariableOp_5!conv2d/bias/Read/ReadVariableOp:0(2checkpoint_initializer_5:08
n
conv2d_1/kernel:0AssignVariableOp_8%conv2d_1/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_8:08
j
conv2d_1/bias:0AssignVariableOp_7#conv2d_1/bias/Read/ReadVariableOp:0(2checkpoint_initializer_7:08
j
dense/kernel:0AssignVariableOp_10"dense/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_10:08
d
dense/bias:0AssignVariableOp_9 dense/bias/Read/ReadVariableOp:0(2checkpoint_initializer_9:08
n
dense_1/kernel:0AssignVariableOp_12$dense_1/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_12:08
j
dense_1/bias:0AssignVariableOp_11"dense_1/bias/Read/ReadVariableOp:0(2checkpoint_initializer_11:08
n
Adam/iterations:0AssignVariableOp_3%Adam/iterations/Read/ReadVariableOp:0(2checkpoint_initializer_3:08
^
	Adam/lr:0AssignVariableOp_4Adam/lr/Read/ReadVariableOp:0(2checkpoint_initializer_4:08
b
Adam/beta_1:0AssignVariableOp!Adam/beta_1/Read/ReadVariableOp:0(2checkpoint_initializer:08
f
Adam/beta_2:0AssignVariableOp_1!Adam/beta_2/Read/ReadVariableOp:0(2checkpoint_initializer_1:08
d
Adam/decay:0AssignVariableOp_2 Adam/decay/Read/ReadVariableOp:0(2checkpoint_initializer_2:08
t
training/Variable:0AssignVariableOp_13'training/Variable/Read/ReadVariableOp:0(2checkpoint_initializer_13:08
x
training/Variable_1:0AssignVariableOp_14)training/Variable_1/Read/ReadVariableOp:0(2checkpoint_initializer_14:08
x
training/Variable_2:0AssignVariableOp_25)training/Variable_2/Read/ReadVariableOp:0(2checkpoint_initializer_25:08
x
training/Variable_3:0AssignVariableOp_30)training/Variable_3/Read/ReadVariableOp:0(2checkpoint_initializer_30:08
x
training/Variable_4:0AssignVariableOp_31)training/Variable_4/Read/ReadVariableOp:0(2checkpoint_initializer_31:08
x
training/Variable_5:0AssignVariableOp_32)training/Variable_5/Read/ReadVariableOp:0(2checkpoint_initializer_32:08
x
training/Variable_6:0AssignVariableOp_33)training/Variable_6/Read/ReadVariableOp:0(2checkpoint_initializer_33:08
x
training/Variable_7:0AssignVariableOp_34)training/Variable_7/Read/ReadVariableOp:0(2checkpoint_initializer_34:08
x
training/Variable_8:0AssignVariableOp_35)training/Variable_8/Read/ReadVariableOp:0(2checkpoint_initializer_35:08
x
training/Variable_9:0AssignVariableOp_36)training/Variable_9/Read/ReadVariableOp:0(2checkpoint_initializer_36:08
z
training/Variable_10:0AssignVariableOp_15*training/Variable_10/Read/ReadVariableOp:0(2checkpoint_initializer_15:08
z
training/Variable_11:0AssignVariableOp_16*training/Variable_11/Read/ReadVariableOp:0(2checkpoint_initializer_16:08
z
training/Variable_12:0AssignVariableOp_17*training/Variable_12/Read/ReadVariableOp:0(2checkpoint_initializer_17:08
z
training/Variable_13:0AssignVariableOp_18*training/Variable_13/Read/ReadVariableOp:0(2checkpoint_initializer_18:08
z
training/Variable_14:0AssignVariableOp_19*training/Variable_14/Read/ReadVariableOp:0(2checkpoint_initializer_19:08
z
training/Variable_15:0AssignVariableOp_20*training/Variable_15/Read/ReadVariableOp:0(2checkpoint_initializer_20:08
z
training/Variable_16:0AssignVariableOp_21*training/Variable_16/Read/ReadVariableOp:0(2checkpoint_initializer_21:08
z
training/Variable_17:0AssignVariableOp_22*training/Variable_17/Read/ReadVariableOp:0(2checkpoint_initializer_22:08
z
training/Variable_18:0AssignVariableOp_23*training/Variable_18/Read/ReadVariableOp:0(2checkpoint_initializer_23:08
z
training/Variable_19:0AssignVariableOp_24*training/Variable_19/Read/ReadVariableOp:0(2checkpoint_initializer_24:08
z
training/Variable_20:0AssignVariableOp_26*training/Variable_20/Read/ReadVariableOp:0(2checkpoint_initializer_26:08
z
training/Variable_21:0AssignVariableOp_27*training/Variable_21/Read/ReadVariableOp:0(2checkpoint_initializer_27:08
z
training/Variable_22:0AssignVariableOp_28*training/Variable_22/Read/ReadVariableOp:0(2checkpoint_initializer_28:08
z
training/Variable_23:0AssignVariableOp_29*training/Variable_23/Read/ReadVariableOp:0(2checkpoint_initializer_29:08"

savers "
losses


loss/mul:0&fŘřŮ     `ů9­	Gçf¨íH×A"ëł

global_step/Initializer/zerosConst*
value	B	 R *
_class
loc:@global_step*
dtype0	*
_output_shapes
: 

global_step
VariableV2*
_class
loc:@global_step*
	container *
shape: *
dtype0	*
_output_shapes
: *
shared_name 
˛
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: *
use_locking(
j
global_step/readIdentityglobal_step*
T0	*
_class
loc:@global_step*
_output_shapes
: 

!global_step/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 

global_step/cond/SwitchSwitch!global_step/IsVariableInitialized!global_step/IsVariableInitialized*
T0
*
_output_shapes
: : 
a
global_step/cond/switch_tIdentityglobal_step/cond/Switch:1*
T0
*
_output_shapes
: 
_
global_step/cond/switch_fIdentityglobal_step/cond/Switch*
T0
*
_output_shapes
: 
h
global_step/cond/pred_idIdentity!global_step/IsVariableInitialized*
T0
*
_output_shapes
: 
b
global_step/cond/readIdentityglobal_step/cond/read/Switch:1*
T0	*
_output_shapes
: 

global_step/cond/read/Switch	RefSwitchglobal_stepglobal_step/cond/pred_id*
T0	*
_class
loc:@global_step*
_output_shapes
: : 

global_step/cond/Switch_1Switchglobal_step/Initializer/zerosglobal_step/cond/pred_id*
T0	*
_class
loc:@global_step*
_output_shapes
: : 
}
global_step/cond/MergeMergeglobal_step/cond/Switch_1global_step/cond/read*
N*
_output_shapes
: : *
T0	
S
global_step/add/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
b
global_step/addAddglobal_step/cond/Mergeglobal_step/add/y*
T0	*
_output_shapes
: 
q
ConstConst"/device:CPU:0*-
value$B" B./data/mnist_train.tfrecords*
dtype0*
_output_shapes
: 
v
flat_filenames/shapeConst"/device:CPU:0*
valueB:
˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes
:
x
flat_filenamesReshapeConstflat_filenames/shape"/device:CPU:0*
T0*
Tshape0*
_output_shapes
:

TensorSliceDatasetTensorSliceDatasetflat_filenames"/device:CPU:0*
output_shapes
: *
Toutput_types
2*
_output_shapes
: 
Ő
FlatMapDatasetFlatMapDatasetTensorSliceDataset"/device:CPU:0*
output_types
2*

Targuments
 *
output_shapes
: *8
f3R1
/__inference_Dataset_flat_map_read_one_file_1028*
_output_shapes
: 


MapDataset
MapDatasetFlatMapDataset"/device:CPU:0*#
output_shapes
:: */
f*R(
&__inference_Dataset_map__parse_fn_1061*
use_inter_op_parallelism(*
output_types
2*

Targuments
 *
_output_shapes
: *
preserve_cardinality( 
]
buffer_sizeConst"/device:CPU:0*
value
B	 Rč*
dtype0	*
_output_shapes
: 
U
seedConst"/device:CPU:0*
value	B	 R *
dtype0	*
_output_shapes
: 
V
seed2Const"/device:CPU:0*
dtype0	*
_output_shapes
: *
value	B	 R 
Ę
ShuffleDatasetShuffleDataset
MapDatasetbuffer_sizeseedseed2"/device:CPU:0*#
output_shapes
:: *
reshuffle_each_iteration(*
_output_shapes
: *
output_types
2
_
countConst"/device:CPU:0*
dtype0	*
_output_shapes
: *
valueB	 R
˙˙˙˙˙˙˙˙˙

RepeatDatasetRepeatDatasetShuffleDatasetcount"/device:CPU:0*#
output_shapes
:: *
_output_shapes
: *
output_types
2
[

batch_sizeConst"/device:CPU:0*
value	B	 Rd*
dtype0	*
_output_shapes
: 
_
drop_remainderConst"/device:CPU:0*
value	B
 Z *
dtype0
*
_output_shapes
: 
Ţ
BatchDatasetV2BatchDatasetV2RepeatDataset
batch_sizedrop_remainder"/device:CPU:0*
_output_shapes
: *
output_types
2*
parallel_copy( *=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

optimizationsConst*V
valueMBKBmap_and_batch_fusionBnoop_eliminationBshuffle_and_repeat_fusion*
dtype0*
_output_shapes
:
ř
OptimizeDatasetOptimizeDatasetBatchDatasetV2optimizations*=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
_output_shapes
: *F
optimization_configs.
,*map_vectorization:use_choose_fastest:false*
output_types
2
Ž
ModelDatasetModelDatasetOptimizeDataset*
output_types
2*=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*

cpu_budget *
_output_shapes
: 
Ť

IteratorV2
IteratorV2*
output_types
2*
shared_name *=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
_output_shapes
: *
	container 
U
MakeIteratorMakeIteratorModelDataset
IteratorV2*
_class
loc:@IteratorV2
T
IteratorToStringHandleIteratorToStringHandle
IteratorV2*
_output_shapes
: 
Ĺ
IteratorGetNextIteratorGetNext
IteratorV2*=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*>
_output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
output_types
2
v
CastCastIteratorGetNext*
Truncate( */
_output_shapes
:˙˙˙˙˙˙˙˙˙*

DstT0*

SrcT0
n
Cast_1CastIteratorGetNext:1*

SrcT0*
Truncate( *#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

DstT0
Š
.conv2d/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"             * 
_class
loc:@conv2d/kernel

,conv2d/kernel/Initializer/random_uniform/minConst*
valueB
 *n§Ž˝* 
_class
loc:@conv2d/kernel*
dtype0*
_output_shapes
: 

,conv2d/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *n§Ž=* 
_class
loc:@conv2d/kernel
đ
6conv2d/kernel/Initializer/random_uniform/RandomUniformRandomUniform.conv2d/kernel/Initializer/random_uniform/shape*
seed2 *
dtype0*&
_output_shapes
: *

seed *
T0* 
_class
loc:@conv2d/kernel
Ň
,conv2d/kernel/Initializer/random_uniform/subSub,conv2d/kernel/Initializer/random_uniform/max,conv2d/kernel/Initializer/random_uniform/min*
T0* 
_class
loc:@conv2d/kernel*
_output_shapes
: 
ě
,conv2d/kernel/Initializer/random_uniform/mulMul6conv2d/kernel/Initializer/random_uniform/RandomUniform,conv2d/kernel/Initializer/random_uniform/sub*
T0* 
_class
loc:@conv2d/kernel*&
_output_shapes
: 
Ţ
(conv2d/kernel/Initializer/random_uniformAdd,conv2d/kernel/Initializer/random_uniform/mul,conv2d/kernel/Initializer/random_uniform/min*
T0* 
_class
loc:@conv2d/kernel*&
_output_shapes
: 
ą
conv2d/kernelVarHandleOp*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_nameconv2d/kernel* 
_class
loc:@conv2d/kernel
k
.conv2d/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d/kernel*
_output_shapes
: 

conv2d/kernel/AssignAssignVariableOpconv2d/kernel(conv2d/kernel/Initializer/random_uniform* 
_class
loc:@conv2d/kernel*
dtype0

!conv2d/kernel/Read/ReadVariableOpReadVariableOpconv2d/kernel* 
_class
loc:@conv2d/kernel*
dtype0*&
_output_shapes
: 

conv2d/bias/Initializer/zerosConst*
valueB *    *
_class
loc:@conv2d/bias*
dtype0*
_output_shapes
: 

conv2d/biasVarHandleOp*
shared_nameconv2d/bias*
_class
loc:@conv2d/bias*
	container *
shape: *
dtype0*
_output_shapes
: 
g
,conv2d/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d/bias*
_output_shapes
: 

conv2d/bias/AssignAssignVariableOpconv2d/biasconv2d/bias/Initializer/zeros*
_class
loc:@conv2d/bias*
dtype0

conv2d/bias/Read/ReadVariableOpReadVariableOpconv2d/bias*
_class
loc:@conv2d/bias*
dtype0*
_output_shapes
: 
e
conv2d/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
r
conv2d/Conv2D/ReadVariableOpReadVariableOpconv2d/kernel*
dtype0*&
_output_shapes
: 
ü
conv2d/Conv2DConv2DCastconv2d/Conv2D/ReadVariableOp*
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ *
	dilations
*
T0*
data_formatNHWC*
strides
*
explicit_paddings
 *
use_cudnn_on_gpu(
e
conv2d/BiasAdd/ReadVariableOpReadVariableOpconv2d/bias*
dtype0*
_output_shapes
: 

conv2d/BiasAddBiasAddconv2d/Conv2Dconv2d/BiasAdd/ReadVariableOp*
T0*
data_formatNHWC*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ 
]
conv2d/ReluReluconv2d/BiasAdd*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ *
T0
ş
max_pooling2d/MaxPoolMaxPoolconv2d/Relu*
ksize
*
paddingVALID*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ *
T0*
data_formatNHWC*
strides

­
0conv2d_1/kernel/Initializer/random_uniform/shapeConst*%
valueB"          @   *"
_class
loc:@conv2d_1/kernel*
dtype0*
_output_shapes
:

.conv2d_1/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *ÍĚL˝*"
_class
loc:@conv2d_1/kernel

.conv2d_1/kernel/Initializer/random_uniform/maxConst*
valueB
 *ÍĚL=*"
_class
loc:@conv2d_1/kernel*
dtype0*
_output_shapes
: 
ö
8conv2d_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform0conv2d_1/kernel/Initializer/random_uniform/shape*
dtype0*&
_output_shapes
: @*

seed *
T0*"
_class
loc:@conv2d_1/kernel*
seed2 
Ú
.conv2d_1/kernel/Initializer/random_uniform/subSub.conv2d_1/kernel/Initializer/random_uniform/max.conv2d_1/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*"
_class
loc:@conv2d_1/kernel
ô
.conv2d_1/kernel/Initializer/random_uniform/mulMul8conv2d_1/kernel/Initializer/random_uniform/RandomUniform.conv2d_1/kernel/Initializer/random_uniform/sub*
T0*"
_class
loc:@conv2d_1/kernel*&
_output_shapes
: @
ć
*conv2d_1/kernel/Initializer/random_uniformAdd.conv2d_1/kernel/Initializer/random_uniform/mul.conv2d_1/kernel/Initializer/random_uniform/min*&
_output_shapes
: @*
T0*"
_class
loc:@conv2d_1/kernel
ˇ
conv2d_1/kernelVarHandleOp*
shape: @*
dtype0*
_output_shapes
: * 
shared_nameconv2d_1/kernel*"
_class
loc:@conv2d_1/kernel*
	container 
o
0conv2d_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d_1/kernel*
_output_shapes
: 

conv2d_1/kernel/AssignAssignVariableOpconv2d_1/kernel*conv2d_1/kernel/Initializer/random_uniform*"
_class
loc:@conv2d_1/kernel*
dtype0

#conv2d_1/kernel/Read/ReadVariableOpReadVariableOpconv2d_1/kernel*"
_class
loc:@conv2d_1/kernel*
dtype0*&
_output_shapes
: @

conv2d_1/bias/Initializer/zerosConst*
valueB@*    * 
_class
loc:@conv2d_1/bias*
dtype0*
_output_shapes
:@
Ľ
conv2d_1/biasVarHandleOp*
dtype0*
_output_shapes
: *
shared_nameconv2d_1/bias* 
_class
loc:@conv2d_1/bias*
	container *
shape:@
k
.conv2d_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d_1/bias*
_output_shapes
: 

conv2d_1/bias/AssignAssignVariableOpconv2d_1/biasconv2d_1/bias/Initializer/zeros* 
_class
loc:@conv2d_1/bias*
dtype0

!conv2d_1/bias/Read/ReadVariableOpReadVariableOpconv2d_1/bias* 
_class
loc:@conv2d_1/bias*
dtype0*
_output_shapes
:@
g
conv2d_1/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
v
conv2d_1/Conv2D/ReadVariableOpReadVariableOpconv2d_1/kernel*
dtype0*&
_output_shapes
: @

conv2d_1/Conv2DConv2Dmax_pooling2d/MaxPoolconv2d_1/Conv2D/ReadVariableOp*
	dilations
*
T0*
data_formatNHWC*
strides
*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
i
conv2d_1/BiasAdd/ReadVariableOpReadVariableOpconv2d_1/bias*
dtype0*
_output_shapes
:@

conv2d_1/BiasAddBiasAddconv2d_1/Conv2Dconv2d_1/BiasAdd/ReadVariableOp*
data_formatNHWC*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@*
T0
a
conv2d_1/ReluReluconv2d_1/BiasAdd*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
ž
max_pooling2d_1/MaxPoolMaxPoolconv2d_1/Relu*
ksize
*
paddingVALID*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@*
T0*
data_formatNHWC*
strides

d
flatten/ShapeShapemax_pooling2d_1/MaxPool*
_output_shapes
:*
T0*
out_type0
e
flatten/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
g
flatten/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
g
flatten/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Ą
flatten/strided_sliceStridedSliceflatten/Shapeflatten/strided_slice/stackflatten/strided_slice/stack_1flatten/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
b
flatten/Reshape/shape/1Const*
valueB :
˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes
: 

flatten/Reshape/shapePackflatten/strided_sliceflatten/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 

flatten/ReshapeReshapemax_pooling2d_1/MaxPoolflatten/Reshape/shape*
T0*
Tshape0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Ŕ

-dense/kernel/Initializer/random_uniform/shapeConst*
valueB"@     *
_class
loc:@dense/kernel*
dtype0*
_output_shapes
:

+dense/kernel/Initializer/random_uniform/minConst*
valueB
 *˝*
_class
loc:@dense/kernel*
dtype0*
_output_shapes
: 

+dense/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *=*
_class
loc:@dense/kernel
ç
5dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform-dense/kernel/Initializer/random_uniform/shape*
dtype0* 
_output_shapes
:
Ŕ*

seed *
T0*
_class
loc:@dense/kernel*
seed2 
Î
+dense/kernel/Initializer/random_uniform/subSub+dense/kernel/Initializer/random_uniform/max+dense/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*
_class
loc:@dense/kernel
â
+dense/kernel/Initializer/random_uniform/mulMul5dense/kernel/Initializer/random_uniform/RandomUniform+dense/kernel/Initializer/random_uniform/sub*
T0*
_class
loc:@dense/kernel* 
_output_shapes
:
Ŕ
Ô
'dense/kernel/Initializer/random_uniformAdd+dense/kernel/Initializer/random_uniform/mul+dense/kernel/Initializer/random_uniform/min* 
_output_shapes
:
Ŕ*
T0*
_class
loc:@dense/kernel
¨
dense/kernelVarHandleOp*
dtype0*
_output_shapes
: *
shared_namedense/kernel*
_class
loc:@dense/kernel*
	container *
shape:
Ŕ
i
-dense/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense/kernel*
_output_shapes
: 

dense/kernel/AssignAssignVariableOpdense/kernel'dense/kernel/Initializer/random_uniform*
_class
loc:@dense/kernel*
dtype0

 dense/kernel/Read/ReadVariableOpReadVariableOpdense/kernel*
dtype0* 
_output_shapes
:
Ŕ*
_class
loc:@dense/kernel

,dense/bias/Initializer/zeros/shape_as_tensorConst*
valueB:*
_class
loc:@dense/bias*
dtype0*
_output_shapes
:

"dense/bias/Initializer/zeros/ConstConst*
valueB
 *    *
_class
loc:@dense/bias*
dtype0*
_output_shapes
: 
Í
dense/bias/Initializer/zerosFill,dense/bias/Initializer/zeros/shape_as_tensor"dense/bias/Initializer/zeros/Const*
T0*

index_type0*
_class
loc:@dense/bias*
_output_shapes	
:


dense/biasVarHandleOp*
	container *
shape:*
dtype0*
_output_shapes
: *
shared_name
dense/bias*
_class
loc:@dense/bias
e
+dense/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOp
dense/bias*
_output_shapes
: 
{
dense/bias/AssignAssignVariableOp
dense/biasdense/bias/Initializer/zeros*
_class
loc:@dense/bias*
dtype0

dense/bias/Read/ReadVariableOpReadVariableOp
dense/bias*
_class
loc:@dense/bias*
dtype0*
_output_shapes	
:
j
dense/MatMul/ReadVariableOpReadVariableOpdense/kernel*
dtype0* 
_output_shapes
:
Ŕ

dense/MatMulMatMulflatten/Reshapedense/MatMul/ReadVariableOp*
transpose_b( *
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_a( 
d
dense/BiasAdd/ReadVariableOpReadVariableOp
dense/bias*
dtype0*
_output_shapes	
:

dense/BiasAddBiasAdddense/MatMuldense/BiasAdd/ReadVariableOp*
T0*
data_formatNHWC*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
T

dense/ReluReludense/BiasAdd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Y
dropout/dropout/rateConst*
valueB
 *ÍĚĚ>*
dtype0*
_output_shapes
: 
_
dropout/dropout/ShapeShape
dense/Relu*
_output_shapes
:*
T0*
out_type0
g
"dropout/dropout/random_uniform/minConst*
valueB
 *    *
dtype0*
_output_shapes
: 
g
"dropout/dropout/random_uniform/maxConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
­
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape*

seed *
T0*
dtype0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
seed2 

"dropout/dropout/random_uniform/subSub"dropout/dropout/random_uniform/max"dropout/dropout/random_uniform/min*
T0*
_output_shapes
: 
Ž
"dropout/dropout/random_uniform/mulMul,dropout/dropout/random_uniform/RandomUniform"dropout/dropout/random_uniform/sub*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
 
dropout/dropout/random_uniformAdd"dropout/dropout/random_uniform/mul"dropout/dropout/random_uniform/min*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Z
dropout/dropout/sub/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
h
dropout/dropout/subSubdropout/dropout/sub/xdropout/dropout/rate*
T0*
_output_shapes
: 
^
dropout/dropout/truediv/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
s
dropout/dropout/truedivRealDivdropout/dropout/truediv/xdropout/dropout/sub*
T0*
_output_shapes
: 

dropout/dropout/GreaterEqualGreaterEqualdropout/dropout/random_uniformdropout/dropout/rate*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
r
dropout/dropout/mulMul
dense/Reludropout/dropout/truediv*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

dropout/dropout/CastCastdropout/dropout/GreaterEqual*

SrcT0
*
Truncate( *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*

DstT0
z
dropout/dropout/mul_1Muldropout/dropout/muldropout/dropout/Cast*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ł
/dense_1/kernel/Initializer/random_uniform/shapeConst*
valueB"   
   *!
_class
loc:@dense_1/kernel*
dtype0*
_output_shapes
:

-dense_1/kernel/Initializer/random_uniform/minConst*
valueB
 *č˝*!
_class
loc:@dense_1/kernel*
dtype0*
_output_shapes
: 

-dense_1/kernel/Initializer/random_uniform/maxConst*
valueB
 *č=*!
_class
loc:@dense_1/kernel*
dtype0*
_output_shapes
: 
ě
7dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_1/kernel/Initializer/random_uniform/shape*
dtype0*
_output_shapes
:	
*

seed *
T0*!
_class
loc:@dense_1/kernel*
seed2 
Ö
-dense_1/kernel/Initializer/random_uniform/subSub-dense_1/kernel/Initializer/random_uniform/max-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
: 
é
-dense_1/kernel/Initializer/random_uniform/mulMul7dense_1/kernel/Initializer/random_uniform/RandomUniform-dense_1/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
:	

Ű
)dense_1/kernel/Initializer/random_uniformAdd-dense_1/kernel/Initializer/random_uniform/mul-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
:	

­
dense_1/kernelVarHandleOp*
dtype0*
_output_shapes
: *
shared_namedense_1/kernel*!
_class
loc:@dense_1/kernel*
	container *
shape:	

m
/dense_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_1/kernel*
_output_shapes
: 

dense_1/kernel/AssignAssignVariableOpdense_1/kernel)dense_1/kernel/Initializer/random_uniform*!
_class
loc:@dense_1/kernel*
dtype0

"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel*!
_class
loc:@dense_1/kernel*
dtype0*
_output_shapes
:	


dense_1/bias/Initializer/zerosConst*
valueB
*    *
_class
loc:@dense_1/bias*
dtype0*
_output_shapes
:

˘
dense_1/biasVarHandleOp*
dtype0*
_output_shapes
: *
shared_namedense_1/bias*
_class
loc:@dense_1/bias*
	container *
shape:

i
-dense_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_1/bias*
_output_shapes
: 

dense_1/bias/AssignAssignVariableOpdense_1/biasdense_1/bias/Initializer/zeros*
_class
loc:@dense_1/bias*
dtype0

 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_class
loc:@dense_1/bias*
dtype0*
_output_shapes
:

m
dense_1/MatMul/ReadVariableOpReadVariableOpdense_1/kernel*
dtype0*
_output_shapes
:	

Ś
dense_1/MatMulMatMuldropout/dropout/mul_1dense_1/MatMul/ReadVariableOp*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
transpose_a( *
transpose_b( *
T0
g
dense_1/BiasAdd/ReadVariableOpReadVariableOpdense_1/bias*
dtype0*
_output_shapes
:


dense_1/BiasAddBiasAdddense_1/MatMuldense_1/BiasAdd/ReadVariableOp*
data_formatNHWC*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0
]
dense_1/SoftmaxSoftmaxdense_1/BiasAdd*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙


)Adam/iterations/Initializer/initial_valueConst*
value	B	 R *"
_class
loc:@Adam/iterations*
dtype0	*
_output_shapes
: 
§
Adam/iterationsVarHandleOp*
shape: *
dtype0	*
_output_shapes
: * 
shared_nameAdam/iterations*"
_class
loc:@Adam/iterations*
	container 
o
0Adam/iterations/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/iterations*
_output_shapes
: 

Adam/iterations/AssignAssignVariableOpAdam/iterations)Adam/iterations/Initializer/initial_value*"
_class
loc:@Adam/iterations*
dtype0	

#Adam/iterations/Read/ReadVariableOpReadVariableOpAdam/iterations*"
_class
loc:@Adam/iterations*
dtype0	*
_output_shapes
: 

!Adam/lr/Initializer/initial_valueConst*
valueB
 *ÍĚĚ=*
_class
loc:@Adam/lr*
dtype0*
_output_shapes
: 

Adam/lrVarHandleOp*
_class
loc:@Adam/lr*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name	Adam/lr
_
(Adam/lr/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/lr*
_output_shapes
: 
w
Adam/lr/AssignAssignVariableOpAdam/lr!Adam/lr/Initializer/initial_value*
_class
loc:@Adam/lr*
dtype0
w
Adam/lr/Read/ReadVariableOpReadVariableOpAdam/lr*
_class
loc:@Adam/lr*
dtype0*
_output_shapes
: 

%Adam/beta_1/Initializer/initial_valueConst*
valueB
 *fff?*
_class
loc:@Adam/beta_1*
dtype0*
_output_shapes
: 

Adam/beta_1VarHandleOp*
_class
loc:@Adam/beta_1*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_nameAdam/beta_1
g
,Adam/beta_1/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/beta_1*
_output_shapes
: 

Adam/beta_1/AssignAssignVariableOpAdam/beta_1%Adam/beta_1/Initializer/initial_value*
_class
loc:@Adam/beta_1*
dtype0

Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: *
_class
loc:@Adam/beta_1

%Adam/beta_2/Initializer/initial_valueConst*
valueB
 *wž?*
_class
loc:@Adam/beta_2*
dtype0*
_output_shapes
: 

Adam/beta_2VarHandleOp*
shared_nameAdam/beta_2*
_class
loc:@Adam/beta_2*
	container *
shape: *
dtype0*
_output_shapes
: 
g
,Adam/beta_2/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/beta_2*
_output_shapes
: 

Adam/beta_2/AssignAssignVariableOpAdam/beta_2%Adam/beta_2/Initializer/initial_value*
dtype0*
_class
loc:@Adam/beta_2

Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_class
loc:@Adam/beta_2*
dtype0*
_output_shapes
: 

$Adam/decay/Initializer/initial_valueConst*
dtype0*
_output_shapes
: *
valueB
 *    *
_class
loc:@Adam/decay


Adam/decayVarHandleOp*
dtype0*
_output_shapes
: *
shared_name
Adam/decay*
_class
loc:@Adam/decay*
	container *
shape: 
e
+Adam/decay/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Adam/decay*
_output_shapes
: 

Adam/decay/AssignAssignVariableOp
Adam/decay$Adam/decay/Initializer/initial_value*
_class
loc:@Adam/decay*
dtype0

Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_class
loc:@Adam/decay*
dtype0*
_output_shapes
: 
v
total/Initializer/zerosConst*
dtype0*
_output_shapes
: *
valueB
 *    *
_class

loc:@total

totalVarHandleOp*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_nametotal*
_class

loc:@total
[
&total/IsInitialized/VarIsInitializedOpVarIsInitializedOptotal*
_output_shapes
: 
g
total/AssignAssignVariableOptotaltotal/Initializer/zeros*
dtype0*
_class

loc:@total
q
total/Read/ReadVariableOpReadVariableOptotal*
_class

loc:@total*
dtype0*
_output_shapes
: 
z
count_1/Initializer/zerosConst*
valueB
 *    *
_class
loc:@count_1*
dtype0*
_output_shapes
: 

count_1VarHandleOp*
dtype0*
_output_shapes
: *
shared_name	count_1*
_class
loc:@count_1*
	container *
shape: 
_
(count_1/IsInitialized/VarIsInitializedOpVarIsInitializedOpcount_1*
_output_shapes
: 
o
count_1/AssignAssignVariableOpcount_1count_1/Initializer/zeros*
dtype0*
_class
loc:@count_1
w
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_class
loc:@count_1*
dtype0*
_output_shapes
: 
g
metrics/acc/ArgMax/dimensionConst*
dtype0*
_output_shapes
: *
valueB :
˙˙˙˙˙˙˙˙˙

metrics/acc/ArgMaxArgMaxdense_1/Softmaxmetrics/acc/ArgMax/dimension*
T0*
output_type0	*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tidx0
y
metrics/acc/CastCastmetrics/acc/ArgMax*

SrcT0	*
Truncate( *#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

DstT0
b
metrics/acc/EqualEqualCast_1metrics/acc/Cast*
T0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
z
metrics/acc/Cast_1Castmetrics/acc/Equal*
Truncate( *#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

DstT0*

SrcT0

[
metrics/acc/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
{
metrics/acc/SumSummetrics/acc/Cast_1metrics/acc/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
[
metrics/acc/AssignAddVariableOpAssignAddVariableOptotalmetrics/acc/Sum*
dtype0

metrics/acc/ReadVariableOpReadVariableOptotal ^metrics/acc/AssignAddVariableOp^metrics/acc/Sum*
dtype0*
_output_shapes
: 
]
metrics/acc/SizeSizemetrics/acc/Cast_1*
_output_shapes
: *
T0*
out_type0
l
metrics/acc/Cast_2Castmetrics/acc/Size*
Truncate( *
_output_shapes
: *

DstT0*

SrcT0

!metrics/acc/AssignAddVariableOp_1AssignAddVariableOpcount_1metrics/acc/Cast_2 ^metrics/acc/AssignAddVariableOp*
dtype0
˘
metrics/acc/ReadVariableOp_1ReadVariableOpcount_1 ^metrics/acc/AssignAddVariableOp"^metrics/acc/AssignAddVariableOp_1*
dtype0*
_output_shapes
: 

%metrics/acc/div_no_nan/ReadVariableOpReadVariableOptotal"^metrics/acc/AssignAddVariableOp_1*
dtype0*
_output_shapes
: 

'metrics/acc/div_no_nan/ReadVariableOp_1ReadVariableOpcount_1"^metrics/acc/AssignAddVariableOp_1*
dtype0*
_output_shapes
: 

metrics/acc/div_no_nanDivNoNan%metrics/acc/div_no_nan/ReadVariableOp'metrics/acc/div_no_nan/ReadVariableOp_1*
T0*
_output_shapes
: 
Y
metrics/acc/IdentityIdentitymetrics/acc/div_no_nan*
T0*
_output_shapes
: 
r
loss/dense_1_loss/Reshape/shapeConst*
valueB:
˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes
:

loss/dense_1_loss/ReshapeReshapeCast_1loss/dense_1_loss/Reshape/shape*
T0*
Tshape0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙

loss/dense_1_loss/CastCastloss/dense_1_loss/Reshape*
Truncate( *#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

DstT0	*

SrcT0
r
!loss/dense_1_loss/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"˙˙˙˙
   

loss/dense_1_loss/Reshape_1Reshapedense_1/BiasAdd!loss/dense_1_loss/Reshape_1/shape*
T0*
Tshape0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙


;loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/ShapeShapeloss/dense_1_loss/Cast*
T0	*
out_type0*
_output_shapes
:

Yloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits#SparseSoftmaxCrossEntropyWithLogitsloss/dense_1_loss/Reshape_1loss/dense_1_loss/Cast*6
_output_shapes$
":˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
*
Tlabels0	*
T0
j
%loss/dense_1_loss/weighted_loss/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

Tloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 

Sloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 
ě
Sloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/shapeShapeYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*
out_type0*
_output_shapes
:

Rloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
j
bloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
ż
Aloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/ShapeShapeYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogitsc^loss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success*
T0*
out_type0*
_output_shapes
:
ë
Aloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/ConstConstc^loss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *  ?

;loss/dense_1_loss/weighted_loss/broadcast_weights/ones_likeFillAloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/ShapeAloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/Const*
T0*

index_type0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ę
1loss/dense_1_loss/weighted_loss/broadcast_weightsMul%loss/dense_1_loss/weighted_loss/Const;loss/dense_1_loss/weighted_loss/broadcast_weights/ones_like*
T0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
ć
#loss/dense_1_loss/weighted_loss/MulMulYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits1loss/dense_1_loss/weighted_loss/broadcast_weights*
T0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
a
loss/dense_1_loss/ConstConst*
valueB: *
dtype0*
_output_shapes
:

loss/dense_1_loss/SumSum#loss/dense_1_loss/weighted_loss/Mulloss/dense_1_loss/Const*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
|
loss/dense_1_loss/num_elementsSize#loss/dense_1_loss/weighted_loss/Mul*
T0*
out_type0*
_output_shapes
: 

#loss/dense_1_loss/num_elements/CastCastloss/dense_1_loss/num_elements*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
\
loss/dense_1_loss/Const_1Const*
valueB *
dtype0*
_output_shapes
: 

loss/dense_1_loss/Sum_1Sumloss/dense_1_loss/Sumloss/dense_1_loss/Const_1*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0

loss/dense_1_loss/valueDivNoNanloss/dense_1_loss/Sum_1#loss/dense_1_loss/num_elements/Cast*
T0*
_output_shapes
: 
O

loss/mul/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
U
loss/mulMul
loss/mul/xloss/dense_1_loss/value*
T0*
_output_shapes
: 
x
training/gradients/ShapeConst*
dtype0*
_output_shapes
: *
valueB *
_class
loc:@loss/mul
~
training/gradients/grad_ys_0Const*
dtype0*
_output_shapes
: *
valueB
 *  ?*
_class
loc:@loss/mul
§
training/gradients/FillFilltraining/gradients/Shapetraining/gradients/grad_ys_0*
T0*

index_type0*
_class
loc:@loss/mul*
_output_shapes
: 

$training/gradients/loss/mul_grad/MulMultraining/gradients/Fillloss/dense_1_loss/value*
T0*
_class
loc:@loss/mul*
_output_shapes
: 

&training/gradients/loss/mul_grad/Mul_1Multraining/gradients/Fill
loss/mul/x*
T0*
_class
loc:@loss/mul*
_output_shapes
: 
¤
5training/gradients/loss/dense_1_loss/value_grad/ShapeConst*
dtype0*
_output_shapes
: *
valueB **
_class 
loc:@loss/dense_1_loss/value
Ś
7training/gradients/loss/dense_1_loss/value_grad/Shape_1Const*
dtype0*
_output_shapes
: *
valueB **
_class 
loc:@loss/dense_1_loss/value
ˇ
Etraining/gradients/loss/dense_1_loss/value_grad/BroadcastGradientArgsBroadcastGradientArgs5training/gradients/loss/dense_1_loss/value_grad/Shape7training/gradients/loss/dense_1_loss/value_grad/Shape_1*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
T0**
_class 
loc:@loss/dense_1_loss/value
ŕ
:training/gradients/loss/dense_1_loss/value_grad/div_no_nanDivNoNan&training/gradients/loss/mul_grad/Mul_1#loss/dense_1_loss/num_elements/Cast*
_output_shapes
: *
T0**
_class 
loc:@loss/dense_1_loss/value
§
3training/gradients/loss/dense_1_loss/value_grad/SumSum:training/gradients/loss/dense_1_loss/value_grad/div_no_nanEtraining/gradients/loss/dense_1_loss/value_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 

7training/gradients/loss/dense_1_loss/value_grad/ReshapeReshape3training/gradients/loss/dense_1_loss/value_grad/Sum5training/gradients/loss/dense_1_loss/value_grad/Shape*
T0*
Tshape0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
 
3training/gradients/loss/dense_1_loss/value_grad/NegNegloss/dense_1_loss/Sum_1*
_output_shapes
: *
T0**
_class 
loc:@loss/dense_1_loss/value
ď
<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_1DivNoNan3training/gradients/loss/dense_1_loss/value_grad/Neg#loss/dense_1_loss/num_elements/Cast*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
ř
<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_2DivNoNan<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_1#loss/dense_1_loss/num_elements/Cast*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
í
3training/gradients/loss/dense_1_loss/value_grad/mulMul&training/gradients/loss/mul_grad/Mul_1<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_2*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
¤
5training/gradients/loss/dense_1_loss/value_grad/Sum_1Sum3training/gradients/loss/dense_1_loss/value_grad/mulGtraining/gradients/loss/dense_1_loss/value_grad/BroadcastGradientArgs:1*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: *

Tidx0*
	keep_dims( 

9training/gradients/loss/dense_1_loss/value_grad/Reshape_1Reshape5training/gradients/loss/dense_1_loss/value_grad/Sum_17training/gradients/loss/dense_1_loss/value_grad/Shape_1*
T0*
Tshape0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
Ź
=training/gradients/loss/dense_1_loss/Sum_1_grad/Reshape/shapeConst*
dtype0*
_output_shapes
: *
valueB **
_class 
loc:@loss/dense_1_loss/Sum_1

7training/gradients/loss/dense_1_loss/Sum_1_grad/ReshapeReshape7training/gradients/loss/dense_1_loss/value_grad/Reshape=training/gradients/loss/dense_1_loss/Sum_1_grad/Reshape/shape*
T0*
Tshape0**
_class 
loc:@loss/dense_1_loss/Sum_1*
_output_shapes
: 
¤
5training/gradients/loss/dense_1_loss/Sum_1_grad/ConstConst*
valueB **
_class 
loc:@loss/dense_1_loss/Sum_1*
dtype0*
_output_shapes
: 

4training/gradients/loss/dense_1_loss/Sum_1_grad/TileTile7training/gradients/loss/dense_1_loss/Sum_1_grad/Reshape5training/gradients/loss/dense_1_loss/Sum_1_grad/Const*
_output_shapes
: *

Tmultiples0*
T0**
_class 
loc:@loss/dense_1_loss/Sum_1
Ż
;training/gradients/loss/dense_1_loss/Sum_grad/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:*(
_class
loc:@loss/dense_1_loss/Sum

5training/gradients/loss/dense_1_loss/Sum_grad/ReshapeReshape4training/gradients/loss/dense_1_loss/Sum_1_grad/Tile;training/gradients/loss/dense_1_loss/Sum_grad/Reshape/shape*
T0*
Tshape0*(
_class
loc:@loss/dense_1_loss/Sum*
_output_shapes
:
Ŕ
3training/gradients/loss/dense_1_loss/Sum_grad/ShapeShape#loss/dense_1_loss/weighted_loss/Mul*
T0*
out_type0*(
_class
loc:@loss/dense_1_loss/Sum*
_output_shapes
:

2training/gradients/loss/dense_1_loss/Sum_grad/TileTile5training/gradients/loss/dense_1_loss/Sum_grad/Reshape3training/gradients/loss/dense_1_loss/Sum_grad/Shape*
T0*(
_class
loc:@loss/dense_1_loss/Sum*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tmultiples0

Atraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/ShapeShapeYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
_output_shapes
:*
T0*
out_type0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul
ě
Ctraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape_1Shape1loss/dense_1_loss/weighted_loss/broadcast_weights*
T0*
out_type0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
_output_shapes
:
ç
Qtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/ShapeCtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape_1*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/MulMul2training/gradients/loss/dense_1_loss/Sum_grad/Tile1loss/dense_1_loss/weighted_loss/broadcast_weights*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul
Ň
?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/SumSum?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/MulQtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/BroadcastGradientArgs*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
_output_shapes
:*

Tidx0*
	keep_dims( 
Ć
Ctraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/ReshapeReshape?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/SumAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*
Tshape0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul
˝
Atraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Mul_1MulYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits2training/gradients/loss/dense_1_loss/Sum_grad/Tile*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ř
Atraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Sum_1SumAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Mul_1Straining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/BroadcastGradientArgs:1*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
_output_shapes
:*

Tidx0*
	keep_dims( 
Ě
Etraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Reshape_1ReshapeAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Sum_1Ctraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape_1*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*
Tshape0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul
§
training/gradients/zeros_like	ZerosLike[loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

É
training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradientPreventGradient[loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*´
message¨ĽCurrently there is no way to take the second derivative of sparse_softmax_cross_entropy_with_logits due to the fused implementation's interaction with tf.gradients()*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits
ş
training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dimConst*
valueB :
˙˙˙˙˙˙˙˙˙*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
dtype0*
_output_shapes
: 
ţ
|training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims
ExpandDimsCtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Reshapetraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tdim0*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits

utraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mulMul|training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDimstraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradient*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

¸
9training/gradients/loss/dense_1_loss/Reshape_1_grad/ShapeShapedense_1/BiasAdd*
T0*
out_type0*.
_class$
" loc:@loss/dense_1_loss/Reshape_1*
_output_shapes
:
č
;training/gradients/loss/dense_1_loss/Reshape_1_grad/ReshapeReshapeutraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul9training/gradients/loss/dense_1_loss/Reshape_1_grad/Shape*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0*
Tshape0*.
_class$
" loc:@loss/dense_1_loss/Reshape_1
ß
3training/gradients/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad;training/gradients/loss/dense_1_loss/Reshape_1_grad/Reshape*
T0*"
_class
loc:@dense_1/BiasAdd*
data_formatNHWC*
_output_shapes
:


-training/gradients/dense_1/MatMul_grad/MatMulMatMul;training/gradients/loss/dense_1_loss/Reshape_1_grad/Reshapedense_1/MatMul/ReadVariableOp*
T0*!
_class
loc:@dense_1/MatMul*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_a( *
transpose_b(

/training/gradients/dense_1/MatMul_grad/MatMul_1MatMuldropout/dropout/mul_1;training/gradients/loss/dense_1_loss/Reshape_1_grad/Reshape*
_output_shapes
:	
*
transpose_a(*
transpose_b( *
T0*!
_class
loc:@dense_1/MatMul
°
3training/gradients/dropout/dropout/mul_1_grad/ShapeShapedropout/dropout/mul*
T0*
out_type0*(
_class
loc:@dropout/dropout/mul_1*
_output_shapes
:
ł
5training/gradients/dropout/dropout/mul_1_grad/Shape_1Shapedropout/dropout/Cast*
_output_shapes
:*
T0*
out_type0*(
_class
loc:@dropout/dropout/mul_1
Ż
Ctraining/gradients/dropout/dropout/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgs3training/gradients/dropout/dropout/mul_1_grad/Shape5training/gradients/dropout/dropout/mul_1_grad/Shape_1*
T0*(
_class
loc:@dropout/dropout/mul_1*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ú
1training/gradients/dropout/dropout/mul_1_grad/MulMul-training/gradients/dense_1/MatMul_grad/MatMuldropout/dropout/Cast*
T0*(
_class
loc:@dropout/dropout/mul_1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

1training/gradients/dropout/dropout/mul_1_grad/SumSum1training/gradients/dropout/dropout/mul_1_grad/MulCtraining/gradients/dropout/dropout/mul_1_grad/BroadcastGradientArgs*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0*(
_class
loc:@dropout/dropout/mul_1

5training/gradients/dropout/dropout/mul_1_grad/ReshapeReshape1training/gradients/dropout/dropout/mul_1_grad/Sum3training/gradients/dropout/dropout/mul_1_grad/Shape*
T0*
Tshape0*(
_class
loc:@dropout/dropout/mul_1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ű
3training/gradients/dropout/dropout/mul_1_grad/Mul_1Muldropout/dropout/mul-training/gradients/dense_1/MatMul_grad/MatMul*
T0*(
_class
loc:@dropout/dropout/mul_1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
3training/gradients/dropout/dropout/mul_1_grad/Sum_1Sum3training/gradients/dropout/dropout/mul_1_grad/Mul_1Etraining/gradients/dropout/dropout/mul_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0*(
_class
loc:@dropout/dropout/mul_1*
_output_shapes
:

7training/gradients/dropout/dropout/mul_1_grad/Reshape_1Reshape3training/gradients/dropout/dropout/mul_1_grad/Sum_15training/gradients/dropout/dropout/mul_1_grad/Shape_1*
T0*
Tshape0*(
_class
loc:@dropout/dropout/mul_1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ł
1training/gradients/dropout/dropout/mul_grad/ShapeShape
dense/Relu*
_output_shapes
:*
T0*
out_type0*&
_class
loc:@dropout/dropout/mul

3training/gradients/dropout/dropout/mul_grad/Shape_1Const*
valueB *&
_class
loc:@dropout/dropout/mul*
dtype0*
_output_shapes
: 
§
Atraining/gradients/dropout/dropout/mul_grad/BroadcastGradientArgsBroadcastGradientArgs1training/gradients/dropout/dropout/mul_grad/Shape3training/gradients/dropout/dropout/mul_grad/Shape_1*
T0*&
_class
loc:@dropout/dropout/mul*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
á
/training/gradients/dropout/dropout/mul_grad/MulMul5training/gradients/dropout/dropout/mul_1_grad/Reshapedropout/dropout/truediv*
T0*&
_class
loc:@dropout/dropout/mul*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

/training/gradients/dropout/dropout/mul_grad/SumSum/training/gradients/dropout/dropout/mul_grad/MulAtraining/gradients/dropout/dropout/mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0*&
_class
loc:@dropout/dropout/mul*
_output_shapes
:

3training/gradients/dropout/dropout/mul_grad/ReshapeReshape/training/gradients/dropout/dropout/mul_grad/Sum1training/gradients/dropout/dropout/mul_grad/Shape*
T0*
Tshape0*&
_class
loc:@dropout/dropout/mul*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ö
1training/gradients/dropout/dropout/mul_grad/Mul_1Mul
dense/Relu5training/gradients/dropout/dropout/mul_1_grad/Reshape*
T0*&
_class
loc:@dropout/dropout/mul*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

1training/gradients/dropout/dropout/mul_grad/Sum_1Sum1training/gradients/dropout/dropout/mul_grad/Mul_1Ctraining/gradients/dropout/dropout/mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0*&
_class
loc:@dropout/dropout/mul*
_output_shapes
:
˙
5training/gradients/dropout/dropout/mul_grad/Reshape_1Reshape1training/gradients/dropout/dropout/mul_grad/Sum_13training/gradients/dropout/dropout/mul_grad/Shape_1*
T0*
Tshape0*&
_class
loc:@dropout/dropout/mul*
_output_shapes
: 
Ę
+training/gradients/dense/Relu_grad/ReluGradReluGrad3training/gradients/dropout/dropout/mul_grad/Reshape
dense/Relu*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*
_class
loc:@dense/Relu
Ě
1training/gradients/dense/BiasAdd_grad/BiasAddGradBiasAddGrad+training/gradients/dense/Relu_grad/ReluGrad*
T0* 
_class
loc:@dense/BiasAdd*
data_formatNHWC*
_output_shapes	
:
ů
+training/gradients/dense/MatMul_grad/MatMulMatMul+training/gradients/dense/Relu_grad/ReluGraddense/MatMul/ReadVariableOp*
T0*
_class
loc:@dense/MatMul*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Ŕ*
transpose_a( *
transpose_b(
ç
-training/gradients/dense/MatMul_grad/MatMul_1MatMulflatten/Reshape+training/gradients/dense/Relu_grad/ReluGrad*
transpose_b( *
T0*
_class
loc:@dense/MatMul* 
_output_shapes
:
Ŕ*
transpose_a(
¨
-training/gradients/flatten/Reshape_grad/ShapeShapemax_pooling2d_1/MaxPool*
_output_shapes
:*
T0*
out_type0*"
_class
loc:@flatten/Reshape

/training/gradients/flatten/Reshape_grad/ReshapeReshape+training/gradients/dense/MatMul_grad/MatMul-training/gradients/flatten/Reshape_grad/Shape*
T0*
Tshape0*"
_class
loc:@flatten/Reshape*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
Ü
;training/gradients/max_pooling2d_1/MaxPool_grad/MaxPoolGradMaxPoolGradconv2d_1/Relumax_pooling2d_1/MaxPool/training/gradients/flatten/Reshape_grad/Reshape*
ksize
*
paddingVALID*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@*
T0**
_class 
loc:@max_pooling2d_1/MaxPool*
data_formatNHWC*
strides

â
.training/gradients/conv2d_1/Relu_grad/ReluGradReluGrad;training/gradients/max_pooling2d_1/MaxPool_grad/MaxPoolGradconv2d_1/Relu*
T0* 
_class
loc:@conv2d_1/Relu*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
Ô
4training/gradients/conv2d_1/BiasAdd_grad/BiasAddGradBiasAddGrad.training/gradients/conv2d_1/Relu_grad/ReluGrad*
T0*#
_class
loc:@conv2d_1/BiasAdd*
data_formatNHWC*
_output_shapes
:@
×
.training/gradients/conv2d_1/Conv2D_grad/ShapeNShapeNmax_pooling2d/MaxPoolconv2d_1/Conv2D/ReadVariableOp*
T0*
out_type0*"
_class
loc:@conv2d_1/Conv2D*
N* 
_output_shapes
::
ˇ
;training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput.training/gradients/conv2d_1/Conv2D_grad/ShapeNconv2d_1/Conv2D/ReadVariableOp.training/gradients/conv2d_1/Relu_grad/ReluGrad*
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ *
	dilations
*
T0*"
_class
loc:@conv2d_1/Conv2D*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 
Š
<training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFiltermax_pooling2d/MaxPool0training/gradients/conv2d_1/Conv2D_grad/ShapeN:1.training/gradients/conv2d_1/Relu_grad/ReluGrad*
T0*"
_class
loc:@conv2d_1/Conv2D*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME*&
_output_shapes
: @*
	dilations

ŕ
9training/gradients/max_pooling2d/MaxPool_grad/MaxPoolGradMaxPoolGradconv2d/Relumax_pooling2d/MaxPool;training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropInput*
T0*(
_class
loc:@max_pooling2d/MaxPool*
strides
*
data_formatNHWC*
ksize
*
paddingVALID*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ 
Ú
,training/gradients/conv2d/Relu_grad/ReluGradReluGrad9training/gradients/max_pooling2d/MaxPool_grad/MaxPoolGradconv2d/Relu*
T0*
_class
loc:@conv2d/Relu*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ 
Î
2training/gradients/conv2d/BiasAdd_grad/BiasAddGradBiasAddGrad,training/gradients/conv2d/Relu_grad/ReluGrad*
T0*!
_class
loc:@conv2d/BiasAdd*
data_formatNHWC*
_output_shapes
: 
Ŕ
,training/gradients/conv2d/Conv2D_grad/ShapeNShapeNCastconv2d/Conv2D/ReadVariableOp*
T0*
out_type0* 
_class
loc:@conv2d/Conv2D*
N* 
_output_shapes
::
­
9training/gradients/conv2d/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput,training/gradients/conv2d/Conv2D_grad/ShapeNconv2d/Conv2D/ReadVariableOp,training/gradients/conv2d/Relu_grad/ReluGrad*
	dilations
*
T0* 
_class
loc:@conv2d/Conv2D*
data_formatNHWC*
strides
*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙

:training/gradients/conv2d/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilterCast.training/gradients/conv2d/Conv2D_grad/ShapeN:1,training/gradients/conv2d/Relu_grad/ReluGrad*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingSAME*&
_output_shapes
: *
	dilations
*
T0* 
_class
loc:@conv2d/Conv2D
Z
training/AssignAdd/valueConst*
value	B	 R*
dtype0	*
_output_shapes
: 

training/AssignAdd	AssignAddglobal_steptraining/AssignAdd/value*
T0	*
_class
loc:@global_step*
_output_shapes
: *
use_locking( 
|
training/CastCastglobal_step/read^training/AssignAdd*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
_
training/Pow/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
`
training/PowPowtraining/Pow/ReadVariableOptraining/Cast*
T0*
_output_shapes
: 
S
training/sub/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
R
training/subSubtraining/sub/xtraining/Pow*
T0*
_output_shapes
: 
S
training/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    
U
training/Const_1Const*
valueB
 *  *
dtype0*
_output_shapes
: 
j
training/clip_by_value/MinimumMinimumtraining/subtraining/Const_1*
_output_shapes
: *
T0
r
training/clip_by_valueMaximumtraining/clip_by_value/Minimumtraining/Const*
_output_shapes
: *
T0
N
training/SqrtSqrttraining/clip_by_value*
_output_shapes
: *
T0
a
training/Pow_1/ReadVariableOpReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
d
training/Pow_1Powtraining/Pow_1/ReadVariableOptraining/Cast*
T0*
_output_shapes
: 
U
training/sub_1/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
X
training/sub_1Subtraining/sub_1/xtraining/Pow_1*
T0*
_output_shapes
: 
[
training/truedivRealDivtraining/Sqrttraining/sub_1*
T0*
_output_shapes
: 
W
training/ReadVariableOpReadVariableOpAdam/lr*
dtype0*
_output_shapes
: 
_
training/mulMultraining/ReadVariableOptraining/truediv*
T0*
_output_shapes
: 
s
training/zerosConst*
dtype0*&
_output_shapes
: *%
valueB *    
˝
training/VariableVarHandleOp*
shape: *
dtype0*
_output_shapes
: *"
shared_nametraining/Variable*$
_class
loc:@training/Variable*
	container 
s
2training/Variable/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable*
_output_shapes
: 

training/Variable/AssignAssignVariableOptraining/Variabletraining/zeros*$
_class
loc:@training/Variable*
dtype0
Ľ
%training/Variable/Read/ReadVariableOpReadVariableOptraining/Variable*$
_class
loc:@training/Variable*
dtype0*&
_output_shapes
: 
]
training/zeros_1Const*
valueB *    *
dtype0*
_output_shapes
: 
ˇ
training/Variable_1VarHandleOp*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_1*&
_class
loc:@training/Variable_1*
	container *
shape: 
w
4training/Variable_1/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_1*
_output_shapes
: 

training/Variable_1/AssignAssignVariableOptraining/Variable_1training/zeros_1*&
_class
loc:@training/Variable_1*
dtype0

'training/Variable_1/Read/ReadVariableOpReadVariableOptraining/Variable_1*
dtype0*
_output_shapes
: *&
_class
loc:@training/Variable_1
y
 training/zeros_2/shape_as_tensorConst*
dtype0*
_output_shapes
:*%
valueB"          @   
[
training/zeros_2/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_2Fill training/zeros_2/shape_as_tensortraining/zeros_2/Const*
T0*

index_type0*&
_output_shapes
: @
Ă
training/Variable_2VarHandleOp*&
_class
loc:@training/Variable_2*
	container *
shape: @*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_2
w
4training/Variable_2/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_2*
_output_shapes
: 

training/Variable_2/AssignAssignVariableOptraining/Variable_2training/zeros_2*&
_class
loc:@training/Variable_2*
dtype0
Ť
'training/Variable_2/Read/ReadVariableOpReadVariableOptraining/Variable_2*&
_class
loc:@training/Variable_2*
dtype0*&
_output_shapes
: @
]
training/zeros_3Const*
valueB@*    *
dtype0*
_output_shapes
:@
ˇ
training/Variable_3VarHandleOp*$
shared_nametraining/Variable_3*&
_class
loc:@training/Variable_3*
	container *
shape:@*
dtype0*
_output_shapes
: 
w
4training/Variable_3/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_3*
_output_shapes
: 

training/Variable_3/AssignAssignVariableOptraining/Variable_3training/zeros_3*&
_class
loc:@training/Variable_3*
dtype0

'training/Variable_3/Read/ReadVariableOpReadVariableOptraining/Variable_3*
dtype0*
_output_shapes
:@*&
_class
loc:@training/Variable_3
q
 training/zeros_4/shape_as_tensorConst*
valueB"@     *
dtype0*
_output_shapes
:
[
training/zeros_4/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_4Fill training/zeros_4/shape_as_tensortraining/zeros_4/Const* 
_output_shapes
:
Ŕ*
T0*

index_type0
˝
training/Variable_4VarHandleOp*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_4*&
_class
loc:@training/Variable_4*
	container *
shape:
Ŕ
w
4training/Variable_4/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_4*
_output_shapes
: 

training/Variable_4/AssignAssignVariableOptraining/Variable_4training/zeros_4*
dtype0*&
_class
loc:@training/Variable_4
Ľ
'training/Variable_4/Read/ReadVariableOpReadVariableOptraining/Variable_4*&
_class
loc:@training/Variable_4*
dtype0* 
_output_shapes
:
Ŕ
k
 training/zeros_5/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
[
training/zeros_5/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_5Fill training/zeros_5/shape_as_tensortraining/zeros_5/Const*
_output_shapes	
:*
T0*

index_type0
¸
training/Variable_5VarHandleOp*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_5*&
_class
loc:@training/Variable_5*
	container *
shape:
w
4training/Variable_5/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_5*
_output_shapes
: 

training/Variable_5/AssignAssignVariableOptraining/Variable_5training/zeros_5*&
_class
loc:@training/Variable_5*
dtype0
 
'training/Variable_5/Read/ReadVariableOpReadVariableOptraining/Variable_5*&
_class
loc:@training/Variable_5*
dtype0*
_output_shapes	
:
q
 training/zeros_6/shape_as_tensorConst*
valueB"   
   *
dtype0*
_output_shapes
:
[
training/zeros_6/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_6Fill training/zeros_6/shape_as_tensortraining/zeros_6/Const*
T0*

index_type0*
_output_shapes
:	

ź
training/Variable_6VarHandleOp*
shape:	
*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_6*&
_class
loc:@training/Variable_6*
	container 
w
4training/Variable_6/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_6*
_output_shapes
: 

training/Variable_6/AssignAssignVariableOptraining/Variable_6training/zeros_6*&
_class
loc:@training/Variable_6*
dtype0
¤
'training/Variable_6/Read/ReadVariableOpReadVariableOptraining/Variable_6*
dtype0*
_output_shapes
:	
*&
_class
loc:@training/Variable_6
]
training/zeros_7Const*
valueB
*    *
dtype0*
_output_shapes
:

ˇ
training/Variable_7VarHandleOp*&
_class
loc:@training/Variable_7*
	container *
shape:
*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_7
w
4training/Variable_7/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_7*
_output_shapes
: 

training/Variable_7/AssignAssignVariableOptraining/Variable_7training/zeros_7*&
_class
loc:@training/Variable_7*
dtype0

'training/Variable_7/Read/ReadVariableOpReadVariableOptraining/Variable_7*
dtype0*
_output_shapes
:
*&
_class
loc:@training/Variable_7
u
training/zeros_8Const*
dtype0*&
_output_shapes
: *%
valueB *    
Ă
training/Variable_8VarHandleOp*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_8*&
_class
loc:@training/Variable_8*
	container *
shape: 
w
4training/Variable_8/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_8*
_output_shapes
: 

training/Variable_8/AssignAssignVariableOptraining/Variable_8training/zeros_8*&
_class
loc:@training/Variable_8*
dtype0
Ť
'training/Variable_8/Read/ReadVariableOpReadVariableOptraining/Variable_8*
dtype0*&
_output_shapes
: *&
_class
loc:@training/Variable_8
]
training/zeros_9Const*
valueB *    *
dtype0*
_output_shapes
: 
ˇ
training/Variable_9VarHandleOp*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_9*&
_class
loc:@training/Variable_9*
	container *
shape: 
w
4training/Variable_9/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_9*
_output_shapes
: 

training/Variable_9/AssignAssignVariableOptraining/Variable_9training/zeros_9*
dtype0*&
_class
loc:@training/Variable_9

'training/Variable_9/Read/ReadVariableOpReadVariableOptraining/Variable_9*
dtype0*
_output_shapes
: *&
_class
loc:@training/Variable_9
z
!training/zeros_10/shape_as_tensorConst*%
valueB"          @   *
dtype0*
_output_shapes
:
\
training/zeros_10/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_10Fill!training/zeros_10/shape_as_tensortraining/zeros_10/Const*
T0*

index_type0*&
_output_shapes
: @
Ć
training/Variable_10VarHandleOp*
	container *
shape: @*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_10*'
_class
loc:@training/Variable_10
y
5training/Variable_10/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_10*
_output_shapes
: 

training/Variable_10/AssignAssignVariableOptraining/Variable_10training/zeros_10*'
_class
loc:@training/Variable_10*
dtype0
Ž
(training/Variable_10/Read/ReadVariableOpReadVariableOptraining/Variable_10*'
_class
loc:@training/Variable_10*
dtype0*&
_output_shapes
: @
^
training/zeros_11Const*
valueB@*    *
dtype0*
_output_shapes
:@
ş
training/Variable_11VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_11*'
_class
loc:@training/Variable_11*
	container *
shape:@
y
5training/Variable_11/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_11*
_output_shapes
: 

training/Variable_11/AssignAssignVariableOptraining/Variable_11training/zeros_11*'
_class
loc:@training/Variable_11*
dtype0
˘
(training/Variable_11/Read/ReadVariableOpReadVariableOptraining/Variable_11*'
_class
loc:@training/Variable_11*
dtype0*
_output_shapes
:@
r
!training/zeros_12/shape_as_tensorConst*
valueB"@     *
dtype0*
_output_shapes
:
\
training/zeros_12/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_12Fill!training/zeros_12/shape_as_tensortraining/zeros_12/Const*
T0*

index_type0* 
_output_shapes
:
Ŕ
Ŕ
training/Variable_12VarHandleOp*
shape:
Ŕ*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_12*'
_class
loc:@training/Variable_12*
	container 
y
5training/Variable_12/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_12*
_output_shapes
: 

training/Variable_12/AssignAssignVariableOptraining/Variable_12training/zeros_12*'
_class
loc:@training/Variable_12*
dtype0
¨
(training/Variable_12/Read/ReadVariableOpReadVariableOptraining/Variable_12*'
_class
loc:@training/Variable_12*
dtype0* 
_output_shapes
:
Ŕ
l
!training/zeros_13/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB:
\
training/zeros_13/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_13Fill!training/zeros_13/shape_as_tensortraining/zeros_13/Const*
T0*

index_type0*
_output_shapes	
:
ť
training/Variable_13VarHandleOp*%
shared_nametraining/Variable_13*'
_class
loc:@training/Variable_13*
	container *
shape:*
dtype0*
_output_shapes
: 
y
5training/Variable_13/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_13*
_output_shapes
: 

training/Variable_13/AssignAssignVariableOptraining/Variable_13training/zeros_13*'
_class
loc:@training/Variable_13*
dtype0
Ł
(training/Variable_13/Read/ReadVariableOpReadVariableOptraining/Variable_13*'
_class
loc:@training/Variable_13*
dtype0*
_output_shapes	
:
r
!training/zeros_14/shape_as_tensorConst*
valueB"   
   *
dtype0*
_output_shapes
:
\
training/zeros_14/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_14Fill!training/zeros_14/shape_as_tensortraining/zeros_14/Const*
_output_shapes
:	
*
T0*

index_type0
ż
training/Variable_14VarHandleOp*'
_class
loc:@training/Variable_14*
	container *
shape:	
*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_14
y
5training/Variable_14/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_14*
_output_shapes
: 

training/Variable_14/AssignAssignVariableOptraining/Variable_14training/zeros_14*'
_class
loc:@training/Variable_14*
dtype0
§
(training/Variable_14/Read/ReadVariableOpReadVariableOptraining/Variable_14*'
_class
loc:@training/Variable_14*
dtype0*
_output_shapes
:	

^
training/zeros_15Const*
valueB
*    *
dtype0*
_output_shapes
:

ş
training/Variable_15VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_15*'
_class
loc:@training/Variable_15*
	container *
shape:

y
5training/Variable_15/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_15*
_output_shapes
: 

training/Variable_15/AssignAssignVariableOptraining/Variable_15training/zeros_15*'
_class
loc:@training/Variable_15*
dtype0
˘
(training/Variable_15/Read/ReadVariableOpReadVariableOptraining/Variable_15*'
_class
loc:@training/Variable_15*
dtype0*
_output_shapes
:

k
!training/zeros_16/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB:
\
training/zeros_16/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_16Fill!training/zeros_16/shape_as_tensortraining/zeros_16/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_16VarHandleOp*
	container *
shape:*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_16*'
_class
loc:@training/Variable_16
y
5training/Variable_16/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_16*
_output_shapes
: 

training/Variable_16/AssignAssignVariableOptraining/Variable_16training/zeros_16*'
_class
loc:@training/Variable_16*
dtype0
˘
(training/Variable_16/Read/ReadVariableOpReadVariableOptraining/Variable_16*'
_class
loc:@training/Variable_16*
dtype0*
_output_shapes
:
k
!training/zeros_17/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_17/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_17Fill!training/zeros_17/shape_as_tensortraining/zeros_17/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_17VarHandleOp*
	container *
shape:*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_17*'
_class
loc:@training/Variable_17
y
5training/Variable_17/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_17*
_output_shapes
: 

training/Variable_17/AssignAssignVariableOptraining/Variable_17training/zeros_17*
dtype0*'
_class
loc:@training/Variable_17
˘
(training/Variable_17/Read/ReadVariableOpReadVariableOptraining/Variable_17*'
_class
loc:@training/Variable_17*
dtype0*
_output_shapes
:
k
!training/zeros_18/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_18/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_18Fill!training/zeros_18/shape_as_tensortraining/zeros_18/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_18VarHandleOp*
	container *
shape:*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_18*'
_class
loc:@training/Variable_18
y
5training/Variable_18/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_18*
_output_shapes
: 

training/Variable_18/AssignAssignVariableOptraining/Variable_18training/zeros_18*'
_class
loc:@training/Variable_18*
dtype0
˘
(training/Variable_18/Read/ReadVariableOpReadVariableOptraining/Variable_18*'
_class
loc:@training/Variable_18*
dtype0*
_output_shapes
:
k
!training/zeros_19/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_19/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_19Fill!training/zeros_19/shape_as_tensortraining/zeros_19/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_19VarHandleOp*
shape:*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_19*'
_class
loc:@training/Variable_19*
	container 
y
5training/Variable_19/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_19*
_output_shapes
: 

training/Variable_19/AssignAssignVariableOptraining/Variable_19training/zeros_19*'
_class
loc:@training/Variable_19*
dtype0
˘
(training/Variable_19/Read/ReadVariableOpReadVariableOptraining/Variable_19*'
_class
loc:@training/Variable_19*
dtype0*
_output_shapes
:
k
!training/zeros_20/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB:
\
training/zeros_20/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_20Fill!training/zeros_20/shape_as_tensortraining/zeros_20/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_20VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_20*'
_class
loc:@training/Variable_20*
	container *
shape:
y
5training/Variable_20/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_20*
_output_shapes
: 

training/Variable_20/AssignAssignVariableOptraining/Variable_20training/zeros_20*
dtype0*'
_class
loc:@training/Variable_20
˘
(training/Variable_20/Read/ReadVariableOpReadVariableOptraining/Variable_20*'
_class
loc:@training/Variable_20*
dtype0*
_output_shapes
:
k
!training/zeros_21/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_21/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_21Fill!training/zeros_21/shape_as_tensortraining/zeros_21/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_21VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_21*'
_class
loc:@training/Variable_21*
	container *
shape:
y
5training/Variable_21/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_21*
_output_shapes
: 

training/Variable_21/AssignAssignVariableOptraining/Variable_21training/zeros_21*
dtype0*'
_class
loc:@training/Variable_21
˘
(training/Variable_21/Read/ReadVariableOpReadVariableOptraining/Variable_21*'
_class
loc:@training/Variable_21*
dtype0*
_output_shapes
:
k
!training/zeros_22/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_22/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_22Fill!training/zeros_22/shape_as_tensortraining/zeros_22/Const*
_output_shapes
:*
T0*

index_type0
ş
training/Variable_22VarHandleOp*%
shared_nametraining/Variable_22*'
_class
loc:@training/Variable_22*
	container *
shape:*
dtype0*
_output_shapes
: 
y
5training/Variable_22/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_22*
_output_shapes
: 

training/Variable_22/AssignAssignVariableOptraining/Variable_22training/zeros_22*
dtype0*'
_class
loc:@training/Variable_22
˘
(training/Variable_22/Read/ReadVariableOpReadVariableOptraining/Variable_22*'
_class
loc:@training/Variable_22*
dtype0*
_output_shapes
:
k
!training/zeros_23/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_23/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_23Fill!training/zeros_23/shape_as_tensortraining/zeros_23/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_23VarHandleOp*%
shared_nametraining/Variable_23*'
_class
loc:@training/Variable_23*
	container *
shape:*
dtype0*
_output_shapes
: 
y
5training/Variable_23/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_23*
_output_shapes
: 

training/Variable_23/AssignAssignVariableOptraining/Variable_23training/zeros_23*'
_class
loc:@training/Variable_23*
dtype0
˘
(training/Variable_23/Read/ReadVariableOpReadVariableOptraining/Variable_23*'
_class
loc:@training/Variable_23*
dtype0*
_output_shapes
:
]
training/ReadVariableOp_1ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
w
training/mul_1/ReadVariableOpReadVariableOptraining/Variable*
dtype0*&
_output_shapes
: 

training/mul_1Multraining/ReadVariableOp_1training/mul_1/ReadVariableOp*
T0*&
_output_shapes
: 
]
training/ReadVariableOp_2ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
U
training/sub_2/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
c
training/sub_2Subtraining/sub_2/xtraining/ReadVariableOp_2*
T0*
_output_shapes
: 

training/mul_2Multraining/sub_2:training/gradients/conv2d/Conv2D_grad/Conv2DBackpropFilter*
T0*&
_output_shapes
: 
d
training/addAddtraining/mul_1training/mul_2*
T0*&
_output_shapes
: 
]
training/ReadVariableOp_3ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
y
training/mul_3/ReadVariableOpReadVariableOptraining/Variable_8*
dtype0*&
_output_shapes
: 

training/mul_3Multraining/ReadVariableOp_3training/mul_3/ReadVariableOp*
T0*&
_output_shapes
: 
]
training/ReadVariableOp_4ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
U
training/sub_3/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
c
training/sub_3Subtraining/sub_3/xtraining/ReadVariableOp_4*
T0*
_output_shapes
: 

training/SquareSquare:training/gradients/conv2d/Conv2D_grad/Conv2DBackpropFilter*&
_output_shapes
: *
T0
g
training/mul_4Multraining/sub_3training/Square*
T0*&
_output_shapes
: 
f
training/add_1Addtraining/mul_3training/mul_4*
T0*&
_output_shapes
: 
b
training/mul_5Multraining/multraining/add*
T0*&
_output_shapes
: 
U
training/Const_2Const*
valueB
 *    *
dtype0*
_output_shapes
: 
U
training/Const_3Const*
dtype0*
_output_shapes
: *
valueB
 *  
~
 training/clip_by_value_1/MinimumMinimumtraining/add_1training/Const_3*
T0*&
_output_shapes
: 

training/clip_by_value_1Maximum training/clip_by_value_1/Minimumtraining/Const_2*&
_output_shapes
: *
T0
b
training/Sqrt_1Sqrttraining/clip_by_value_1*
T0*&
_output_shapes
: 
U
training/add_2/yConst*
dtype0*
_output_shapes
: *
valueB
 *żÖ3
i
training/add_2Addtraining/Sqrt_1training/add_2/y*
T0*&
_output_shapes
: 
n
training/truediv_1RealDivtraining/mul_5training/add_2*&
_output_shapes
: *
T0
o
training/ReadVariableOp_5ReadVariableOpconv2d/kernel*
dtype0*&
_output_shapes
: 
u
training/sub_4Subtraining/ReadVariableOp_5training/truediv_1*
T0*&
_output_shapes
: 
[
training/AssignVariableOpAssignVariableOptraining/Variabletraining/add*
dtype0

training/ReadVariableOp_6ReadVariableOptraining/Variable^training/AssignVariableOp*
dtype0*&
_output_shapes
: 
a
training/AssignVariableOp_1AssignVariableOptraining/Variable_8training/add_1*
dtype0

training/ReadVariableOp_7ReadVariableOptraining/Variable_8^training/AssignVariableOp_1*
dtype0*&
_output_shapes
: 
[
training/AssignVariableOp_2AssignVariableOpconv2d/kerneltraining/sub_4*
dtype0

training/ReadVariableOp_8ReadVariableOpconv2d/kernel^training/AssignVariableOp_2*
dtype0*&
_output_shapes
: 
]
training/ReadVariableOp_9ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
m
training/mul_6/ReadVariableOpReadVariableOptraining/Variable_1*
dtype0*
_output_shapes
: 
t
training/mul_6Multraining/ReadVariableOp_9training/mul_6/ReadVariableOp*
T0*
_output_shapes
: 
^
training/ReadVariableOp_10ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
U
training/sub_5/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
d
training/sub_5Subtraining/sub_5/xtraining/ReadVariableOp_10*
T0*
_output_shapes
: 
~
training/mul_7Multraining/sub_52training/gradients/conv2d/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
: 
Z
training/add_3Addtraining/mul_6training/mul_7*
T0*
_output_shapes
: 
^
training/ReadVariableOp_11ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
m
training/mul_8/ReadVariableOpReadVariableOptraining/Variable_9*
dtype0*
_output_shapes
: 
u
training/mul_8Multraining/ReadVariableOp_11training/mul_8/ReadVariableOp*
T0*
_output_shapes
: 
^
training/ReadVariableOp_12ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
U
training/sub_6/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
d
training/sub_6Subtraining/sub_6/xtraining/ReadVariableOp_12*
_output_shapes
: *
T0
t
training/Square_1Square2training/gradients/conv2d/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
: 
]
training/mul_9Multraining/sub_6training/Square_1*
T0*
_output_shapes
: 
Z
training/add_4Addtraining/mul_8training/mul_9*
T0*
_output_shapes
: 
Y
training/mul_10Multraining/multraining/add_3*
T0*
_output_shapes
: 
U
training/Const_4Const*
valueB
 *    *
dtype0*
_output_shapes
: 
U
training/Const_5Const*
valueB
 *  *
dtype0*
_output_shapes
: 
r
 training/clip_by_value_2/MinimumMinimumtraining/add_4training/Const_5*
T0*
_output_shapes
: 
|
training/clip_by_value_2Maximum training/clip_by_value_2/Minimumtraining/Const_4*
T0*
_output_shapes
: 
V
training/Sqrt_2Sqrttraining/clip_by_value_2*
_output_shapes
: *
T0
U
training/add_5/yConst*
dtype0*
_output_shapes
: *
valueB
 *żÖ3
]
training/add_5Addtraining/Sqrt_2training/add_5/y*
_output_shapes
: *
T0
c
training/truediv_2RealDivtraining/mul_10training/add_5*
T0*
_output_shapes
: 
b
training/ReadVariableOp_13ReadVariableOpconv2d/bias*
dtype0*
_output_shapes
: 
j
training/sub_7Subtraining/ReadVariableOp_13training/truediv_2*
_output_shapes
: *
T0
a
training/AssignVariableOp_3AssignVariableOptraining/Variable_1training/add_3*
dtype0

training/ReadVariableOp_14ReadVariableOptraining/Variable_1^training/AssignVariableOp_3*
dtype0*
_output_shapes
: 
a
training/AssignVariableOp_4AssignVariableOptraining/Variable_9training/add_4*
dtype0

training/ReadVariableOp_15ReadVariableOptraining/Variable_9^training/AssignVariableOp_4*
dtype0*
_output_shapes
: 
Y
training/AssignVariableOp_5AssignVariableOpconv2d/biastraining/sub_7*
dtype0

training/ReadVariableOp_16ReadVariableOpconv2d/bias^training/AssignVariableOp_5*
dtype0*
_output_shapes
: 
^
training/ReadVariableOp_17ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
z
training/mul_11/ReadVariableOpReadVariableOptraining/Variable_2*
dtype0*&
_output_shapes
: @

training/mul_11Multraining/ReadVariableOp_17training/mul_11/ReadVariableOp*&
_output_shapes
: @*
T0
^
training/ReadVariableOp_18ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
U
training/sub_8/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
d
training/sub_8Subtraining/sub_8/xtraining/ReadVariableOp_18*
T0*
_output_shapes
: 

training/mul_12Multraining/sub_8<training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropFilter*
T0*&
_output_shapes
: @
h
training/add_6Addtraining/mul_11training/mul_12*&
_output_shapes
: @*
T0
^
training/ReadVariableOp_19ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
{
training/mul_13/ReadVariableOpReadVariableOptraining/Variable_10*
dtype0*&
_output_shapes
: @

training/mul_13Multraining/ReadVariableOp_19training/mul_13/ReadVariableOp*&
_output_shapes
: @*
T0
^
training/ReadVariableOp_20ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
U
training/sub_9/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
d
training/sub_9Subtraining/sub_9/xtraining/ReadVariableOp_20*
T0*
_output_shapes
: 

training/Square_2Square<training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropFilter*
T0*&
_output_shapes
: @
j
training/mul_14Multraining/sub_9training/Square_2*
T0*&
_output_shapes
: @
h
training/add_7Addtraining/mul_13training/mul_14*&
_output_shapes
: @*
T0
e
training/mul_15Multraining/multraining/add_6*
T0*&
_output_shapes
: @
U
training/Const_6Const*
dtype0*
_output_shapes
: *
valueB
 *    
U
training/Const_7Const*
valueB
 *  *
dtype0*
_output_shapes
: 
~
 training/clip_by_value_3/MinimumMinimumtraining/add_7training/Const_7*&
_output_shapes
: @*
T0

training/clip_by_value_3Maximum training/clip_by_value_3/Minimumtraining/Const_6*
T0*&
_output_shapes
: @
b
training/Sqrt_3Sqrttraining/clip_by_value_3*&
_output_shapes
: @*
T0
U
training/add_8/yConst*
dtype0*
_output_shapes
: *
valueB
 *żÖ3
i
training/add_8Addtraining/Sqrt_3training/add_8/y*
T0*&
_output_shapes
: @
o
training/truediv_3RealDivtraining/mul_15training/add_8*
T0*&
_output_shapes
: @
r
training/ReadVariableOp_21ReadVariableOpconv2d_1/kernel*
dtype0*&
_output_shapes
: @
w
training/sub_10Subtraining/ReadVariableOp_21training/truediv_3*
T0*&
_output_shapes
: @
a
training/AssignVariableOp_6AssignVariableOptraining/Variable_2training/add_6*
dtype0

training/ReadVariableOp_22ReadVariableOptraining/Variable_2^training/AssignVariableOp_6*
dtype0*&
_output_shapes
: @
b
training/AssignVariableOp_7AssignVariableOptraining/Variable_10training/add_7*
dtype0

training/ReadVariableOp_23ReadVariableOptraining/Variable_10^training/AssignVariableOp_7*
dtype0*&
_output_shapes
: @
^
training/AssignVariableOp_8AssignVariableOpconv2d_1/kerneltraining/sub_10*
dtype0

training/ReadVariableOp_24ReadVariableOpconv2d_1/kernel^training/AssignVariableOp_8*
dtype0*&
_output_shapes
: @
^
training/ReadVariableOp_25ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
n
training/mul_16/ReadVariableOpReadVariableOptraining/Variable_3*
dtype0*
_output_shapes
:@
w
training/mul_16Multraining/ReadVariableOp_25training/mul_16/ReadVariableOp*
T0*
_output_shapes
:@
^
training/ReadVariableOp_26ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_11/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_11Subtraining/sub_11/xtraining/ReadVariableOp_26*
_output_shapes
: *
T0

training/mul_17Multraining/sub_114training/gradients/conv2d_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:@
\
training/add_9Addtraining/mul_16training/mul_17*
_output_shapes
:@*
T0
^
training/ReadVariableOp_27ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
o
training/mul_18/ReadVariableOpReadVariableOptraining/Variable_11*
dtype0*
_output_shapes
:@
w
training/mul_18Multraining/ReadVariableOp_27training/mul_18/ReadVariableOp*
T0*
_output_shapes
:@
^
training/ReadVariableOp_28ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_12/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_12Subtraining/sub_12/xtraining/ReadVariableOp_28*
_output_shapes
: *
T0
v
training/Square_3Square4training/gradients/conv2d_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:@
_
training/mul_19Multraining/sub_12training/Square_3*
T0*
_output_shapes
:@
]
training/add_10Addtraining/mul_18training/mul_19*
T0*
_output_shapes
:@
Y
training/mul_20Multraining/multraining/add_9*
T0*
_output_shapes
:@
U
training/Const_8Const*
valueB
 *    *
dtype0*
_output_shapes
: 
U
training/Const_9Const*
dtype0*
_output_shapes
: *
valueB
 *  
s
 training/clip_by_value_4/MinimumMinimumtraining/add_10training/Const_9*
T0*
_output_shapes
:@
|
training/clip_by_value_4Maximum training/clip_by_value_4/Minimumtraining/Const_8*
T0*
_output_shapes
:@
V
training/Sqrt_4Sqrttraining/clip_by_value_4*
_output_shapes
:@*
T0
V
training/add_11/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
_
training/add_11Addtraining/Sqrt_4training/add_11/y*
T0*
_output_shapes
:@
d
training/truediv_4RealDivtraining/mul_20training/add_11*
T0*
_output_shapes
:@
d
training/ReadVariableOp_29ReadVariableOpconv2d_1/bias*
dtype0*
_output_shapes
:@
k
training/sub_13Subtraining/ReadVariableOp_29training/truediv_4*
_output_shapes
:@*
T0
a
training/AssignVariableOp_9AssignVariableOptraining/Variable_3training/add_9*
dtype0

training/ReadVariableOp_30ReadVariableOptraining/Variable_3^training/AssignVariableOp_9*
dtype0*
_output_shapes
:@
d
training/AssignVariableOp_10AssignVariableOptraining/Variable_11training/add_10*
dtype0

training/ReadVariableOp_31ReadVariableOptraining/Variable_11^training/AssignVariableOp_10*
dtype0*
_output_shapes
:@
]
training/AssignVariableOp_11AssignVariableOpconv2d_1/biastraining/sub_13*
dtype0

training/ReadVariableOp_32ReadVariableOpconv2d_1/bias^training/AssignVariableOp_11*
dtype0*
_output_shapes
:@
^
training/ReadVariableOp_33ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
t
training/mul_21/ReadVariableOpReadVariableOptraining/Variable_4*
dtype0* 
_output_shapes
:
Ŕ
}
training/mul_21Multraining/ReadVariableOp_33training/mul_21/ReadVariableOp* 
_output_shapes
:
Ŕ*
T0
^
training/ReadVariableOp_34ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_14/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_14Subtraining/sub_14/xtraining/ReadVariableOp_34*
T0*
_output_shapes
: 

training/mul_22Multraining/sub_14-training/gradients/dense/MatMul_grad/MatMul_1*
T0* 
_output_shapes
:
Ŕ
c
training/add_12Addtraining/mul_21training/mul_22*
T0* 
_output_shapes
:
Ŕ
^
training/ReadVariableOp_35ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
u
training/mul_23/ReadVariableOpReadVariableOptraining/Variable_12*
dtype0* 
_output_shapes
:
Ŕ
}
training/mul_23Multraining/ReadVariableOp_35training/mul_23/ReadVariableOp*
T0* 
_output_shapes
:
Ŕ
^
training/ReadVariableOp_36ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_15/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
f
training/sub_15Subtraining/sub_15/xtraining/ReadVariableOp_36*
T0*
_output_shapes
: 
u
training/Square_4Square-training/gradients/dense/MatMul_grad/MatMul_1* 
_output_shapes
:
Ŕ*
T0
e
training/mul_24Multraining/sub_15training/Square_4*
T0* 
_output_shapes
:
Ŕ
c
training/add_13Addtraining/mul_23training/mul_24*
T0* 
_output_shapes
:
Ŕ
`
training/mul_25Multraining/multraining/add_12*
T0* 
_output_shapes
:
Ŕ
V
training/Const_10Const*
dtype0*
_output_shapes
: *
valueB
 *    
V
training/Const_11Const*
valueB
 *  *
dtype0*
_output_shapes
: 
z
 training/clip_by_value_5/MinimumMinimumtraining/add_13training/Const_11*
T0* 
_output_shapes
:
Ŕ

training/clip_by_value_5Maximum training/clip_by_value_5/Minimumtraining/Const_10*
T0* 
_output_shapes
:
Ŕ
\
training/Sqrt_5Sqrttraining/clip_by_value_5*
T0* 
_output_shapes
:
Ŕ
V
training/add_14/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
e
training/add_14Addtraining/Sqrt_5training/add_14/y*
T0* 
_output_shapes
:
Ŕ
j
training/truediv_5RealDivtraining/mul_25training/add_14*
T0* 
_output_shapes
:
Ŕ
i
training/ReadVariableOp_37ReadVariableOpdense/kernel*
dtype0* 
_output_shapes
:
Ŕ
q
training/sub_16Subtraining/ReadVariableOp_37training/truediv_5*
T0* 
_output_shapes
:
Ŕ
c
training/AssignVariableOp_12AssignVariableOptraining/Variable_4training/add_12*
dtype0

training/ReadVariableOp_38ReadVariableOptraining/Variable_4^training/AssignVariableOp_12*
dtype0* 
_output_shapes
:
Ŕ
d
training/AssignVariableOp_13AssignVariableOptraining/Variable_12training/add_13*
dtype0

training/ReadVariableOp_39ReadVariableOptraining/Variable_12^training/AssignVariableOp_13*
dtype0* 
_output_shapes
:
Ŕ
\
training/AssignVariableOp_14AssignVariableOpdense/kerneltraining/sub_16*
dtype0

training/ReadVariableOp_40ReadVariableOpdense/kernel^training/AssignVariableOp_14*
dtype0* 
_output_shapes
:
Ŕ
^
training/ReadVariableOp_41ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
o
training/mul_26/ReadVariableOpReadVariableOptraining/Variable_5*
dtype0*
_output_shapes	
:
x
training/mul_26Multraining/ReadVariableOp_41training/mul_26/ReadVariableOp*
T0*
_output_shapes	
:
^
training/ReadVariableOp_42ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_17/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_17Subtraining/sub_17/xtraining/ReadVariableOp_42*
T0*
_output_shapes
: 

training/mul_27Multraining/sub_171training/gradients/dense/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:
^
training/add_15Addtraining/mul_26training/mul_27*
T0*
_output_shapes	
:
^
training/ReadVariableOp_43ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
p
training/mul_28/ReadVariableOpReadVariableOptraining/Variable_13*
dtype0*
_output_shapes	
:
x
training/mul_28Multraining/ReadVariableOp_43training/mul_28/ReadVariableOp*
T0*
_output_shapes	
:
^
training/ReadVariableOp_44ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_18/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_18Subtraining/sub_18/xtraining/ReadVariableOp_44*
T0*
_output_shapes
: 
t
training/Square_5Square1training/gradients/dense/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:
`
training/mul_29Multraining/sub_18training/Square_5*
_output_shapes	
:*
T0
^
training/add_16Addtraining/mul_28training/mul_29*
T0*
_output_shapes	
:
[
training/mul_30Multraining/multraining/add_15*
T0*
_output_shapes	
:
V
training/Const_12Const*
valueB
 *    *
dtype0*
_output_shapes
: 
V
training/Const_13Const*
valueB
 *  *
dtype0*
_output_shapes
: 
u
 training/clip_by_value_6/MinimumMinimumtraining/add_16training/Const_13*
T0*
_output_shapes	
:
~
training/clip_by_value_6Maximum training/clip_by_value_6/Minimumtraining/Const_12*
_output_shapes	
:*
T0
W
training/Sqrt_6Sqrttraining/clip_by_value_6*
_output_shapes	
:*
T0
V
training/add_17/yConst*
dtype0*
_output_shapes
: *
valueB
 *żÖ3
`
training/add_17Addtraining/Sqrt_6training/add_17/y*
T0*
_output_shapes	
:
e
training/truediv_6RealDivtraining/mul_30training/add_17*
T0*
_output_shapes	
:
b
training/ReadVariableOp_45ReadVariableOp
dense/bias*
dtype0*
_output_shapes	
:
l
training/sub_19Subtraining/ReadVariableOp_45training/truediv_6*
T0*
_output_shapes	
:
c
training/AssignVariableOp_15AssignVariableOptraining/Variable_5training/add_15*
dtype0

training/ReadVariableOp_46ReadVariableOptraining/Variable_5^training/AssignVariableOp_15*
dtype0*
_output_shapes	
:
d
training/AssignVariableOp_16AssignVariableOptraining/Variable_13training/add_16*
dtype0

training/ReadVariableOp_47ReadVariableOptraining/Variable_13^training/AssignVariableOp_16*
dtype0*
_output_shapes	
:
Z
training/AssignVariableOp_17AssignVariableOp
dense/biastraining/sub_19*
dtype0

training/ReadVariableOp_48ReadVariableOp
dense/bias^training/AssignVariableOp_17*
dtype0*
_output_shapes	
:
^
training/ReadVariableOp_49ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
s
training/mul_31/ReadVariableOpReadVariableOptraining/Variable_6*
dtype0*
_output_shapes
:	

|
training/mul_31Multraining/ReadVariableOp_49training/mul_31/ReadVariableOp*
T0*
_output_shapes
:	

^
training/ReadVariableOp_50ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_20/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_20Subtraining/sub_20/xtraining/ReadVariableOp_50*
T0*
_output_shapes
: 

training/mul_32Multraining/sub_20/training/gradients/dense_1/MatMul_grad/MatMul_1*
_output_shapes
:	
*
T0
b
training/add_18Addtraining/mul_31training/mul_32*
T0*
_output_shapes
:	

^
training/ReadVariableOp_51ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
t
training/mul_33/ReadVariableOpReadVariableOptraining/Variable_14*
dtype0*
_output_shapes
:	

|
training/mul_33Multraining/ReadVariableOp_51training/mul_33/ReadVariableOp*
T0*
_output_shapes
:	

^
training/ReadVariableOp_52ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_21/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_21Subtraining/sub_21/xtraining/ReadVariableOp_52*
T0*
_output_shapes
: 
v
training/Square_6Square/training/gradients/dense_1/MatMul_grad/MatMul_1*
T0*
_output_shapes
:	

d
training/mul_34Multraining/sub_21training/Square_6*
T0*
_output_shapes
:	

b
training/add_19Addtraining/mul_33training/mul_34*
T0*
_output_shapes
:	

_
training/mul_35Multraining/multraining/add_18*
T0*
_output_shapes
:	

V
training/Const_14Const*
dtype0*
_output_shapes
: *
valueB
 *    
V
training/Const_15Const*
valueB
 *  *
dtype0*
_output_shapes
: 
y
 training/clip_by_value_7/MinimumMinimumtraining/add_19training/Const_15*
T0*
_output_shapes
:	


training/clip_by_value_7Maximum training/clip_by_value_7/Minimumtraining/Const_14*
_output_shapes
:	
*
T0
[
training/Sqrt_7Sqrttraining/clip_by_value_7*
T0*
_output_shapes
:	

V
training/add_20/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
d
training/add_20Addtraining/Sqrt_7training/add_20/y*
_output_shapes
:	
*
T0
i
training/truediv_7RealDivtraining/mul_35training/add_20*
_output_shapes
:	
*
T0
j
training/ReadVariableOp_53ReadVariableOpdense_1/kernel*
dtype0*
_output_shapes
:	

p
training/sub_22Subtraining/ReadVariableOp_53training/truediv_7*
_output_shapes
:	
*
T0
c
training/AssignVariableOp_18AssignVariableOptraining/Variable_6training/add_18*
dtype0

training/ReadVariableOp_54ReadVariableOptraining/Variable_6^training/AssignVariableOp_18*
dtype0*
_output_shapes
:	

d
training/AssignVariableOp_19AssignVariableOptraining/Variable_14training/add_19*
dtype0

training/ReadVariableOp_55ReadVariableOptraining/Variable_14^training/AssignVariableOp_19*
dtype0*
_output_shapes
:	

^
training/AssignVariableOp_20AssignVariableOpdense_1/kerneltraining/sub_22*
dtype0

training/ReadVariableOp_56ReadVariableOpdense_1/kernel^training/AssignVariableOp_20*
dtype0*
_output_shapes
:	

^
training/ReadVariableOp_57ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
n
training/mul_36/ReadVariableOpReadVariableOptraining/Variable_7*
dtype0*
_output_shapes
:

w
training/mul_36Multraining/ReadVariableOp_57training/mul_36/ReadVariableOp*
_output_shapes
:
*
T0
^
training/ReadVariableOp_58ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_23/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
f
training/sub_23Subtraining/sub_23/xtraining/ReadVariableOp_58*
T0*
_output_shapes
: 

training/mul_37Multraining/sub_233training/gradients/dense_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:

]
training/add_21Addtraining/mul_36training/mul_37*
T0*
_output_shapes
:

^
training/ReadVariableOp_59ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
o
training/mul_38/ReadVariableOpReadVariableOptraining/Variable_15*
dtype0*
_output_shapes
:

w
training/mul_38Multraining/ReadVariableOp_59training/mul_38/ReadVariableOp*
_output_shapes
:
*
T0
^
training/ReadVariableOp_60ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_24/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_24Subtraining/sub_24/xtraining/ReadVariableOp_60*
T0*
_output_shapes
: 
u
training/Square_7Square3training/gradients/dense_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:

_
training/mul_39Multraining/sub_24training/Square_7*
T0*
_output_shapes
:

]
training/add_22Addtraining/mul_38training/mul_39*
_output_shapes
:
*
T0
Z
training/mul_40Multraining/multraining/add_21*
T0*
_output_shapes
:

V
training/Const_16Const*
valueB
 *    *
dtype0*
_output_shapes
: 
V
training/Const_17Const*
valueB
 *  *
dtype0*
_output_shapes
: 
t
 training/clip_by_value_8/MinimumMinimumtraining/add_22training/Const_17*
T0*
_output_shapes
:

}
training/clip_by_value_8Maximum training/clip_by_value_8/Minimumtraining/Const_16*
T0*
_output_shapes
:

V
training/Sqrt_8Sqrttraining/clip_by_value_8*
_output_shapes
:
*
T0
V
training/add_23/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
_
training/add_23Addtraining/Sqrt_8training/add_23/y*
T0*
_output_shapes
:

d
training/truediv_8RealDivtraining/mul_40training/add_23*
T0*
_output_shapes
:

c
training/ReadVariableOp_61ReadVariableOpdense_1/bias*
dtype0*
_output_shapes
:

k
training/sub_25Subtraining/ReadVariableOp_61training/truediv_8*
T0*
_output_shapes
:

c
training/AssignVariableOp_21AssignVariableOptraining/Variable_7training/add_21*
dtype0

training/ReadVariableOp_62ReadVariableOptraining/Variable_7^training/AssignVariableOp_21*
dtype0*
_output_shapes
:

d
training/AssignVariableOp_22AssignVariableOptraining/Variable_15training/add_22*
dtype0

training/ReadVariableOp_63ReadVariableOptraining/Variable_15^training/AssignVariableOp_22*
dtype0*
_output_shapes
:

\
training/AssignVariableOp_23AssignVariableOpdense_1/biastraining/sub_25*
dtype0

training/ReadVariableOp_64ReadVariableOpdense_1/bias^training/AssignVariableOp_23*
dtype0*
_output_shapes
:


training_1/group_depsNoOp	^loss/mul^training/AssignVariableOp^training/AssignVariableOp_1^training/AssignVariableOp_10^training/AssignVariableOp_11^training/AssignVariableOp_12^training/AssignVariableOp_13^training/AssignVariableOp_14^training/AssignVariableOp_15^training/AssignVariableOp_16^training/AssignVariableOp_17^training/AssignVariableOp_18^training/AssignVariableOp_19^training/AssignVariableOp_2^training/AssignVariableOp_20^training/AssignVariableOp_21^training/AssignVariableOp_22^training/AssignVariableOp_23^training/AssignVariableOp_3^training/AssignVariableOp_4^training/AssignVariableOp_5^training/AssignVariableOp_6^training/AssignVariableOp_7^training/AssignVariableOp_8^training/AssignVariableOp_9
W
div_no_nan/ReadVariableOpReadVariableOptotal*
dtype0*
_output_shapes
: 
[
div_no_nan/ReadVariableOp_1ReadVariableOpcount_1*
dtype0*
_output_shapes
: 
o

div_no_nanDivNoNandiv_no_nan/ReadVariableOpdiv_no_nan/ReadVariableOp_1*
T0*
_output_shapes
: 
A
IdentityIdentity
div_no_nan*
T0*
_output_shapes
: 
Y
div_no_nan_1/ReadVariableOpReadVariableOptotal*
dtype0*
_output_shapes
: 
]
div_no_nan_1/ReadVariableOp_1ReadVariableOpcount_1*
dtype0*
_output_shapes
: 
u
div_no_nan_1DivNoNandiv_no_nan_1/ReadVariableOpdiv_no_nan_1/ReadVariableOp_1*
T0*
_output_shapes
: 
E

Identity_1Identitydiv_no_nan_1*
_output_shapes
: *
T0

checkpoint_initializer/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

#checkpoint_initializer/tensor_namesConst"/device:CPU:0* 
valueBBAdam/beta_1*
dtype0*
_output_shapes
:

'checkpoint_initializer/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Č
checkpoint_initializer	RestoreV2checkpoint_initializer/prefix#checkpoint_initializer/tensor_names'checkpoint_initializer/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
Q

Identity_2Identitycheckpoint_initializer*
T0*
_output_shapes
:
J
AssignVariableOpAssignVariableOpAdam/beta_1
Identity_2*
dtype0

checkpoint_initializer_1/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_1/tensor_namesConst"/device:CPU:0* 
valueBBAdam/beta_2*
dtype0*
_output_shapes
:

)checkpoint_initializer_1/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Đ
checkpoint_initializer_1	RestoreV2checkpoint_initializer_1/prefix%checkpoint_initializer_1/tensor_names)checkpoint_initializer_1/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
S

Identity_3Identitycheckpoint_initializer_1*
T0*
_output_shapes
:
L
AssignVariableOp_1AssignVariableOpAdam/beta_2
Identity_3*
dtype0

checkpoint_initializer_2/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_2/tensor_namesConst"/device:CPU:0*
valueBB
Adam/decay*
dtype0*
_output_shapes
:

)checkpoint_initializer_2/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Đ
checkpoint_initializer_2	RestoreV2checkpoint_initializer_2/prefix%checkpoint_initializer_2/tensor_names)checkpoint_initializer_2/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
: 
S

Identity_4Identitycheckpoint_initializer_2*
T0*
_output_shapes
:
K
AssignVariableOp_2AssignVariableOp
Adam/decay
Identity_4*
dtype0

checkpoint_initializer_3/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

%checkpoint_initializer_3/tensor_namesConst"/device:CPU:0*$
valueBBAdam/iterations*
dtype0*
_output_shapes
:

)checkpoint_initializer_3/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Đ
checkpoint_initializer_3	RestoreV2checkpoint_initializer_3/prefix%checkpoint_initializer_3/tensor_names)checkpoint_initializer_3/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2	
S

Identity_5Identitycheckpoint_initializer_3*
T0	*
_output_shapes
:
P
AssignVariableOp_3AssignVariableOpAdam/iterations
Identity_5*
dtype0	

checkpoint_initializer_4/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_4/tensor_namesConst"/device:CPU:0*
valueBBAdam/lr*
dtype0*
_output_shapes
:

)checkpoint_initializer_4/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Đ
checkpoint_initializer_4	RestoreV2checkpoint_initializer_4/prefix%checkpoint_initializer_4/tensor_names)checkpoint_initializer_4/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
S

Identity_6Identitycheckpoint_initializer_4*
T0*
_output_shapes
:
H
AssignVariableOp_4AssignVariableOpAdam/lr
Identity_6*
dtype0

checkpoint_initializer_5/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

%checkpoint_initializer_5/tensor_namesConst"/device:CPU:0* 
valueBBconv2d/bias*
dtype0*
_output_shapes
:

)checkpoint_initializer_5/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ô
checkpoint_initializer_5	RestoreV2checkpoint_initializer_5/prefix%checkpoint_initializer_5/tensor_names)checkpoint_initializer_5/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
S

Identity_7Identitycheckpoint_initializer_5*
_output_shapes
:*
T0
L
AssignVariableOp_5AssignVariableOpconv2d/bias
Identity_7*
dtype0

checkpoint_initializer_6/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_6/tensor_namesConst"/device:CPU:0*"
valueBBconv2d/kernel*
dtype0*
_output_shapes
:

)checkpoint_initializer_6/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
ŕ
checkpoint_initializer_6	RestoreV2checkpoint_initializer_6/prefix%checkpoint_initializer_6/tensor_names)checkpoint_initializer_6/shape_and_slices"/device:CPU:0*
dtypes
2*&
_output_shapes
: 
S

Identity_8Identitycheckpoint_initializer_6*
T0*
_output_shapes
:
N
AssignVariableOp_6AssignVariableOpconv2d/kernel
Identity_8*
dtype0

checkpoint_initializer_7/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

%checkpoint_initializer_7/tensor_namesConst"/device:CPU:0*"
valueBBconv2d_1/bias*
dtype0*
_output_shapes
:

)checkpoint_initializer_7/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ô
checkpoint_initializer_7	RestoreV2checkpoint_initializer_7/prefix%checkpoint_initializer_7/tensor_names)checkpoint_initializer_7/shape_and_slices"/device:CPU:0*
_output_shapes
:@*
dtypes
2
S

Identity_9Identitycheckpoint_initializer_7*
T0*
_output_shapes
:
N
AssignVariableOp_7AssignVariableOpconv2d_1/bias
Identity_9*
dtype0

checkpoint_initializer_8/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_8/tensor_namesConst"/device:CPU:0*$
valueBBconv2d_1/kernel*
dtype0*
_output_shapes
:

)checkpoint_initializer_8/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ŕ
checkpoint_initializer_8	RestoreV2checkpoint_initializer_8/prefix%checkpoint_initializer_8/tensor_names)checkpoint_initializer_8/shape_and_slices"/device:CPU:0*
dtypes
2*&
_output_shapes
: @
T
Identity_10Identitycheckpoint_initializer_8*
T0*
_output_shapes
:
Q
AssignVariableOp_8AssignVariableOpconv2d_1/kernelIdentity_10*
dtype0

checkpoint_initializer_9/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_9/tensor_namesConst"/device:CPU:0*
valueBB
dense/bias*
dtype0*
_output_shapes
:

)checkpoint_initializer_9/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ő
checkpoint_initializer_9	RestoreV2checkpoint_initializer_9/prefix%checkpoint_initializer_9/tensor_names)checkpoint_initializer_9/shape_and_slices"/device:CPU:0*
_output_shapes	
:*
dtypes
2
T
Identity_11Identitycheckpoint_initializer_9*
_output_shapes
:*
T0
L
AssignVariableOp_9AssignVariableOp
dense/biasIdentity_11*
dtype0

 checkpoint_initializer_10/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_10/tensor_namesConst"/device:CPU:0*!
valueBBdense/kernel*
dtype0*
_output_shapes
:

*checkpoint_initializer_10/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ţ
checkpoint_initializer_10	RestoreV2 checkpoint_initializer_10/prefix&checkpoint_initializer_10/tensor_names*checkpoint_initializer_10/shape_and_slices"/device:CPU:0*
dtypes
2* 
_output_shapes
:
Ŕ
U
Identity_12Identitycheckpoint_initializer_10*
T0*
_output_shapes
:
O
AssignVariableOp_10AssignVariableOpdense/kernelIdentity_12*
dtype0

 checkpoint_initializer_11/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_11/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*!
valueBBdense_1/bias

*checkpoint_initializer_11/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_11	RestoreV2 checkpoint_initializer_11/prefix&checkpoint_initializer_11/tensor_names*checkpoint_initializer_11/shape_and_slices"/device:CPU:0*
_output_shapes
:
*
dtypes
2
U
Identity_13Identitycheckpoint_initializer_11*
_output_shapes
:*
T0
O
AssignVariableOp_11AssignVariableOpdense_1/biasIdentity_13*
dtype0

 checkpoint_initializer_12/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_12/tensor_namesConst"/device:CPU:0*#
valueBBdense_1/kernel*
dtype0*
_output_shapes
:

*checkpoint_initializer_12/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ý
checkpoint_initializer_12	RestoreV2 checkpoint_initializer_12/prefix&checkpoint_initializer_12/tensor_names*checkpoint_initializer_12/shape_and_slices"/device:CPU:0*
_output_shapes
:	
*
dtypes
2
U
Identity_14Identitycheckpoint_initializer_12*
T0*
_output_shapes
:
Q
AssignVariableOp_12AssignVariableOpdense_1/kernelIdentity_14*
dtype0

 checkpoint_initializer_13/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_13/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*&
valueBBtraining/Variable

*checkpoint_initializer_13/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ä
checkpoint_initializer_13	RestoreV2 checkpoint_initializer_13/prefix&checkpoint_initializer_13/tensor_names*checkpoint_initializer_13/shape_and_slices"/device:CPU:0*&
_output_shapes
: *
dtypes
2
U
Identity_15Identitycheckpoint_initializer_13*
T0*
_output_shapes
:
T
AssignVariableOp_13AssignVariableOptraining/VariableIdentity_15*
dtype0

 checkpoint_initializer_14/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_14/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_1*
dtype0*
_output_shapes
:

*checkpoint_initializer_14/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_14	RestoreV2 checkpoint_initializer_14/prefix&checkpoint_initializer_14/tensor_names*checkpoint_initializer_14/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
: 
U
Identity_16Identitycheckpoint_initializer_14*
_output_shapes
:*
T0
V
AssignVariableOp_14AssignVariableOptraining/Variable_1Identity_16*
dtype0

 checkpoint_initializer_15/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_15/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_10*
dtype0*
_output_shapes
:

*checkpoint_initializer_15/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ä
checkpoint_initializer_15	RestoreV2 checkpoint_initializer_15/prefix&checkpoint_initializer_15/tensor_names*checkpoint_initializer_15/shape_and_slices"/device:CPU:0*
dtypes
2*&
_output_shapes
: @
U
Identity_17Identitycheckpoint_initializer_15*
_output_shapes
:*
T0
W
AssignVariableOp_15AssignVariableOptraining/Variable_10Identity_17*
dtype0

 checkpoint_initializer_16/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_16/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_11*
dtype0*
_output_shapes
:

*checkpoint_initializer_16/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ř
checkpoint_initializer_16	RestoreV2 checkpoint_initializer_16/prefix&checkpoint_initializer_16/tensor_names*checkpoint_initializer_16/shape_and_slices"/device:CPU:0*
_output_shapes
:@*
dtypes
2
U
Identity_18Identitycheckpoint_initializer_16*
T0*
_output_shapes
:
W
AssignVariableOp_16AssignVariableOptraining/Variable_11Identity_18*
dtype0

 checkpoint_initializer_17/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_17/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_12*
dtype0*
_output_shapes
:

*checkpoint_initializer_17/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ţ
checkpoint_initializer_17	RestoreV2 checkpoint_initializer_17/prefix&checkpoint_initializer_17/tensor_names*checkpoint_initializer_17/shape_and_slices"/device:CPU:0* 
_output_shapes
:
Ŕ*
dtypes
2
U
Identity_19Identitycheckpoint_initializer_17*
_output_shapes
:*
T0
W
AssignVariableOp_17AssignVariableOptraining/Variable_12Identity_19*
dtype0

 checkpoint_initializer_18/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_18/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_13*
dtype0*
_output_shapes
:

*checkpoint_initializer_18/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ů
checkpoint_initializer_18	RestoreV2 checkpoint_initializer_18/prefix&checkpoint_initializer_18/tensor_names*checkpoint_initializer_18/shape_and_slices"/device:CPU:0*
_output_shapes	
:*
dtypes
2
U
Identity_20Identitycheckpoint_initializer_18*
T0*
_output_shapes
:
W
AssignVariableOp_18AssignVariableOptraining/Variable_13Identity_20*
dtype0

 checkpoint_initializer_19/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_19/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_14*
dtype0*
_output_shapes
:

*checkpoint_initializer_19/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ý
checkpoint_initializer_19	RestoreV2 checkpoint_initializer_19/prefix&checkpoint_initializer_19/tensor_names*checkpoint_initializer_19/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
:	

U
Identity_21Identitycheckpoint_initializer_19*
T0*
_output_shapes
:
W
AssignVariableOp_19AssignVariableOptraining/Variable_14Identity_21*
dtype0

 checkpoint_initializer_20/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_20/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*)
value BBtraining/Variable_15

*checkpoint_initializer_20/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_20	RestoreV2 checkpoint_initializer_20/prefix&checkpoint_initializer_20/tensor_names*checkpoint_initializer_20/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
:

U
Identity_22Identitycheckpoint_initializer_20*
T0*
_output_shapes
:
W
AssignVariableOp_20AssignVariableOptraining/Variable_15Identity_22*
dtype0

 checkpoint_initializer_21/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_21/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_16*
dtype0*
_output_shapes
:

*checkpoint_initializer_21/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_21	RestoreV2 checkpoint_initializer_21/prefix&checkpoint_initializer_21/tensor_names*checkpoint_initializer_21/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
:
U
Identity_23Identitycheckpoint_initializer_21*
T0*
_output_shapes
:
W
AssignVariableOp_21AssignVariableOptraining/Variable_16Identity_23*
dtype0

 checkpoint_initializer_22/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_22/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_17*
dtype0*
_output_shapes
:

*checkpoint_initializer_22/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_22	RestoreV2 checkpoint_initializer_22/prefix&checkpoint_initializer_22/tensor_names*checkpoint_initializer_22/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_24Identitycheckpoint_initializer_22*
T0*
_output_shapes
:
W
AssignVariableOp_22AssignVariableOptraining/Variable_17Identity_24*
dtype0

 checkpoint_initializer_23/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_23/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_18*
dtype0*
_output_shapes
:

*checkpoint_initializer_23/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_23	RestoreV2 checkpoint_initializer_23/prefix&checkpoint_initializer_23/tensor_names*checkpoint_initializer_23/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_25Identitycheckpoint_initializer_23*
T0*
_output_shapes
:
W
AssignVariableOp_23AssignVariableOptraining/Variable_18Identity_25*
dtype0

 checkpoint_initializer_24/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_24/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_19*
dtype0*
_output_shapes
:

*checkpoint_initializer_24/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_24	RestoreV2 checkpoint_initializer_24/prefix&checkpoint_initializer_24/tensor_names*checkpoint_initializer_24/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_26Identitycheckpoint_initializer_24*
T0*
_output_shapes
:
W
AssignVariableOp_24AssignVariableOptraining/Variable_19Identity_26*
dtype0

 checkpoint_initializer_25/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_25/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_2*
dtype0*
_output_shapes
:

*checkpoint_initializer_25/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ä
checkpoint_initializer_25	RestoreV2 checkpoint_initializer_25/prefix&checkpoint_initializer_25/tensor_names*checkpoint_initializer_25/shape_and_slices"/device:CPU:0*&
_output_shapes
: @*
dtypes
2
U
Identity_27Identitycheckpoint_initializer_25*
_output_shapes
:*
T0
V
AssignVariableOp_25AssignVariableOptraining/Variable_2Identity_27*
dtype0

 checkpoint_initializer_26/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_26/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_20*
dtype0*
_output_shapes
:

*checkpoint_initializer_26/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_26	RestoreV2 checkpoint_initializer_26/prefix&checkpoint_initializer_26/tensor_names*checkpoint_initializer_26/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_28Identitycheckpoint_initializer_26*
T0*
_output_shapes
:
W
AssignVariableOp_26AssignVariableOptraining/Variable_20Identity_28*
dtype0

 checkpoint_initializer_27/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_27/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_21*
dtype0*
_output_shapes
:

*checkpoint_initializer_27/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_27	RestoreV2 checkpoint_initializer_27/prefix&checkpoint_initializer_27/tensor_names*checkpoint_initializer_27/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_29Identitycheckpoint_initializer_27*
T0*
_output_shapes
:
W
AssignVariableOp_27AssignVariableOptraining/Variable_21Identity_29*
dtype0

 checkpoint_initializer_28/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_28/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*)
value BBtraining/Variable_22

*checkpoint_initializer_28/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_28	RestoreV2 checkpoint_initializer_28/prefix&checkpoint_initializer_28/tensor_names*checkpoint_initializer_28/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
:
U
Identity_30Identitycheckpoint_initializer_28*
T0*
_output_shapes
:
W
AssignVariableOp_28AssignVariableOptraining/Variable_22Identity_30*
dtype0

 checkpoint_initializer_29/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_29/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_23*
dtype0*
_output_shapes
:

*checkpoint_initializer_29/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_29	RestoreV2 checkpoint_initializer_29/prefix&checkpoint_initializer_29/tensor_names*checkpoint_initializer_29/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_31Identitycheckpoint_initializer_29*
_output_shapes
:*
T0
W
AssignVariableOp_29AssignVariableOptraining/Variable_23Identity_31*
dtype0

 checkpoint_initializer_30/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_30/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_3*
dtype0*
_output_shapes
:

*checkpoint_initializer_30/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_30	RestoreV2 checkpoint_initializer_30/prefix&checkpoint_initializer_30/tensor_names*checkpoint_initializer_30/shape_and_slices"/device:CPU:0*
_output_shapes
:@*
dtypes
2
U
Identity_32Identitycheckpoint_initializer_30*
_output_shapes
:*
T0
V
AssignVariableOp_30AssignVariableOptraining/Variable_3Identity_32*
dtype0

 checkpoint_initializer_31/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_31/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_4*
dtype0*
_output_shapes
:

*checkpoint_initializer_31/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ţ
checkpoint_initializer_31	RestoreV2 checkpoint_initializer_31/prefix&checkpoint_initializer_31/tensor_names*checkpoint_initializer_31/shape_and_slices"/device:CPU:0*
dtypes
2* 
_output_shapes
:
Ŕ
U
Identity_33Identitycheckpoint_initializer_31*
T0*
_output_shapes
:
V
AssignVariableOp_31AssignVariableOptraining/Variable_4Identity_33*
dtype0

 checkpoint_initializer_32/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_32/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_5*
dtype0*
_output_shapes
:

*checkpoint_initializer_32/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ů
checkpoint_initializer_32	RestoreV2 checkpoint_initializer_32/prefix&checkpoint_initializer_32/tensor_names*checkpoint_initializer_32/shape_and_slices"/device:CPU:0*
_output_shapes	
:*
dtypes
2
U
Identity_34Identitycheckpoint_initializer_32*
T0*
_output_shapes
:
V
AssignVariableOp_32AssignVariableOptraining/Variable_5Identity_34*
dtype0

 checkpoint_initializer_33/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_33/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*(
valueBBtraining/Variable_6

*checkpoint_initializer_33/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ý
checkpoint_initializer_33	RestoreV2 checkpoint_initializer_33/prefix&checkpoint_initializer_33/tensor_names*checkpoint_initializer_33/shape_and_slices"/device:CPU:0*
_output_shapes
:	
*
dtypes
2
U
Identity_35Identitycheckpoint_initializer_33*
T0*
_output_shapes
:
V
AssignVariableOp_33AssignVariableOptraining/Variable_6Identity_35*
dtype0

 checkpoint_initializer_34/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_34/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*(
valueBBtraining/Variable_7

*checkpoint_initializer_34/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_34	RestoreV2 checkpoint_initializer_34/prefix&checkpoint_initializer_34/tensor_names*checkpoint_initializer_34/shape_and_slices"/device:CPU:0*
_output_shapes
:
*
dtypes
2
U
Identity_36Identitycheckpoint_initializer_34*
T0*
_output_shapes
:
V
AssignVariableOp_34AssignVariableOptraining/Variable_7Identity_36*
dtype0

 checkpoint_initializer_35/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_35/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*(
valueBBtraining/Variable_8

*checkpoint_initializer_35/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ä
checkpoint_initializer_35	RestoreV2 checkpoint_initializer_35/prefix&checkpoint_initializer_35/tensor_names*checkpoint_initializer_35/shape_and_slices"/device:CPU:0*&
_output_shapes
: *
dtypes
2
U
Identity_37Identitycheckpoint_initializer_35*
T0*
_output_shapes
:
V
AssignVariableOp_35AssignVariableOptraining/Variable_8Identity_37*
dtype0

 checkpoint_initializer_36/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_36/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_9*
dtype0*
_output_shapes
:

*checkpoint_initializer_36/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_36	RestoreV2 checkpoint_initializer_36/prefix&checkpoint_initializer_36/tensor_names*checkpoint_initializer_36/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
U
Identity_38Identitycheckpoint_initializer_36*
T0*
_output_shapes
:
V
AssignVariableOp_36AssignVariableOptraining/Variable_9Identity_38*
dtype0
R
loss_1/tagsConst*
valueB Bloss_1*
dtype0*
_output_shapes
: 
O
loss_1ScalarSummaryloss_1/tagsloss/mul*
_output_shapes
: *
T0
Ă
initNoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^global_step/Assign

init_1NoOp
"

group_depsNoOp^init^init_1

4report_uninitialized_variables/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 
n
1report_uninitialized_variables/VarIsInitializedOpVarIsInitializedOpconv2d/kernel*
_output_shapes
: 
n
3report_uninitialized_variables/VarIsInitializedOp_1VarIsInitializedOpconv2d/bias*
_output_shapes
: 
r
3report_uninitialized_variables/VarIsInitializedOp_2VarIsInitializedOpconv2d_1/kernel*
_output_shapes
: 
p
3report_uninitialized_variables/VarIsInitializedOp_3VarIsInitializedOpconv2d_1/bias*
_output_shapes
: 
o
3report_uninitialized_variables/VarIsInitializedOp_4VarIsInitializedOpdense/kernel*
_output_shapes
: 
m
3report_uninitialized_variables/VarIsInitializedOp_5VarIsInitializedOp
dense/bias*
_output_shapes
: 
q
3report_uninitialized_variables/VarIsInitializedOp_6VarIsInitializedOpdense_1/kernel*
_output_shapes
: 
o
3report_uninitialized_variables/VarIsInitializedOp_7VarIsInitializedOpdense_1/bias*
_output_shapes
: 
r
3report_uninitialized_variables/VarIsInitializedOp_8VarIsInitializedOpAdam/iterations*
_output_shapes
: 
j
3report_uninitialized_variables/VarIsInitializedOp_9VarIsInitializedOpAdam/lr*
_output_shapes
: 
o
4report_uninitialized_variables/VarIsInitializedOp_10VarIsInitializedOpAdam/beta_1*
_output_shapes
: 
o
4report_uninitialized_variables/VarIsInitializedOp_11VarIsInitializedOpAdam/beta_2*
_output_shapes
: 
n
4report_uninitialized_variables/VarIsInitializedOp_12VarIsInitializedOp
Adam/decay*
_output_shapes
: 
u
4report_uninitialized_variables/VarIsInitializedOp_13VarIsInitializedOptraining/Variable*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_14VarIsInitializedOptraining/Variable_1*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_15VarIsInitializedOptraining/Variable_2*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_16VarIsInitializedOptraining/Variable_3*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_17VarIsInitializedOptraining/Variable_4*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_18VarIsInitializedOptraining/Variable_5*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_19VarIsInitializedOptraining/Variable_6*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_20VarIsInitializedOptraining/Variable_7*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_21VarIsInitializedOptraining/Variable_8*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_22VarIsInitializedOptraining/Variable_9*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_23VarIsInitializedOptraining/Variable_10*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_24VarIsInitializedOptraining/Variable_11*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_25VarIsInitializedOptraining/Variable_12*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_26VarIsInitializedOptraining/Variable_13*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_27VarIsInitializedOptraining/Variable_14*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_28VarIsInitializedOptraining/Variable_15*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_29VarIsInitializedOptraining/Variable_16*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_30VarIsInitializedOptraining/Variable_17*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_31VarIsInitializedOptraining/Variable_18*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_32VarIsInitializedOptraining/Variable_19*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_33VarIsInitializedOptraining/Variable_20*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_34VarIsInitializedOptraining/Variable_21*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_35VarIsInitializedOptraining/Variable_22*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_36VarIsInitializedOptraining/Variable_23*
_output_shapes
: 
k
4report_uninitialized_variables/VarIsInitializedOp_37VarIsInitializedOpcount_1*
_output_shapes
: 
i
4report_uninitialized_variables/VarIsInitializedOp_38VarIsInitializedOptotal*
_output_shapes
: 
Ů
$report_uninitialized_variables/stackPack4report_uninitialized_variables/IsVariableInitialized1report_uninitialized_variables/VarIsInitializedOp3report_uninitialized_variables/VarIsInitializedOp_13report_uninitialized_variables/VarIsInitializedOp_23report_uninitialized_variables/VarIsInitializedOp_33report_uninitialized_variables/VarIsInitializedOp_43report_uninitialized_variables/VarIsInitializedOp_53report_uninitialized_variables/VarIsInitializedOp_63report_uninitialized_variables/VarIsInitializedOp_73report_uninitialized_variables/VarIsInitializedOp_83report_uninitialized_variables/VarIsInitializedOp_94report_uninitialized_variables/VarIsInitializedOp_104report_uninitialized_variables/VarIsInitializedOp_114report_uninitialized_variables/VarIsInitializedOp_124report_uninitialized_variables/VarIsInitializedOp_134report_uninitialized_variables/VarIsInitializedOp_144report_uninitialized_variables/VarIsInitializedOp_154report_uninitialized_variables/VarIsInitializedOp_164report_uninitialized_variables/VarIsInitializedOp_174report_uninitialized_variables/VarIsInitializedOp_184report_uninitialized_variables/VarIsInitializedOp_194report_uninitialized_variables/VarIsInitializedOp_204report_uninitialized_variables/VarIsInitializedOp_214report_uninitialized_variables/VarIsInitializedOp_224report_uninitialized_variables/VarIsInitializedOp_234report_uninitialized_variables/VarIsInitializedOp_244report_uninitialized_variables/VarIsInitializedOp_254report_uninitialized_variables/VarIsInitializedOp_264report_uninitialized_variables/VarIsInitializedOp_274report_uninitialized_variables/VarIsInitializedOp_284report_uninitialized_variables/VarIsInitializedOp_294report_uninitialized_variables/VarIsInitializedOp_304report_uninitialized_variables/VarIsInitializedOp_314report_uninitialized_variables/VarIsInitializedOp_324report_uninitialized_variables/VarIsInitializedOp_334report_uninitialized_variables/VarIsInitializedOp_344report_uninitialized_variables/VarIsInitializedOp_354report_uninitialized_variables/VarIsInitializedOp_364report_uninitialized_variables/VarIsInitializedOp_374report_uninitialized_variables/VarIsInitializedOp_38"/device:CPU:0*
T0
*

axis *
N(*
_output_shapes
:(

)report_uninitialized_variables/LogicalNot
LogicalNot$report_uninitialized_variables/stack"/device:CPU:0*
_output_shapes
:(
Ň
$report_uninitialized_variables/ConstConst"/device:CPU:0*ę
valueŕBÝ(Bglobal_stepBconv2d/kernelBconv2d/biasBconv2d_1/kernelBconv2d_1/biasBdense/kernelB
dense/biasBdense_1/kernelBdense_1/biasBAdam/iterationsBAdam/lrBAdam/beta_1BAdam/beta_2B
Adam/decayBtraining/VariableBtraining/Variable_1Btraining/Variable_2Btraining/Variable_3Btraining/Variable_4Btraining/Variable_5Btraining/Variable_6Btraining/Variable_7Btraining/Variable_8Btraining/Variable_9Btraining/Variable_10Btraining/Variable_11Btraining/Variable_12Btraining/Variable_13Btraining/Variable_14Btraining/Variable_15Btraining/Variable_16Btraining/Variable_17Btraining/Variable_18Btraining/Variable_19Btraining/Variable_20Btraining/Variable_21Btraining/Variable_22Btraining/Variable_23Bcount_1Btotal*
dtype0*
_output_shapes
:(

1report_uninitialized_variables/boolean_mask/ShapeConst"/device:CPU:0*
valueB:(*
dtype0*
_output_shapes
:

?report_uninitialized_variables/boolean_mask/strided_slice/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice/stack_1Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:

Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
č
9report_uninitialized_variables/boolean_mask/strided_sliceStridedSlice1report_uninitialized_variables/boolean_mask/Shape?report_uninitialized_variables/boolean_mask/strided_slice/stackAreport_uninitialized_variables/boolean_mask/strided_slice/stack_1Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2"/device:CPU:0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
:*
Index0*
T0

Breport_uninitialized_variables/boolean_mask/Prod/reduction_indicesConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

0report_uninitialized_variables/boolean_mask/ProdProd9report_uninitialized_variables/boolean_mask/strided_sliceBreport_uninitialized_variables/boolean_mask/Prod/reduction_indices"/device:CPU:0*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

3report_uninitialized_variables/boolean_mask/Shape_1Const"/device:CPU:0*
valueB:(*
dtype0*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
đ
;report_uninitialized_variables/boolean_mask/strided_slice_1StridedSlice3report_uninitialized_variables/boolean_mask/Shape_1Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackCreport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2"/device:CPU:0*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask 

3report_uninitialized_variables/boolean_mask/Shape_2Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:(

Areport_uninitialized_variables/boolean_mask/strided_slice_2/stackConst"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_2Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
đ
;report_uninitialized_variables/boolean_mask/strided_slice_2StridedSlice3report_uninitialized_variables/boolean_mask/Shape_2Areport_uninitialized_variables/boolean_mask/strided_slice_2/stackCreport_uninitialized_variables/boolean_mask/strided_slice_2/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_2"/device:CPU:0*
T0*
Index0*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask*
_output_shapes
: 
ž
;report_uninitialized_variables/boolean_mask/concat/values_1Pack0report_uninitialized_variables/boolean_mask/Prod"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:

7report_uninitialized_variables/boolean_mask/concat/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
÷
2report_uninitialized_variables/boolean_mask/concatConcatV2;report_uninitialized_variables/boolean_mask/strided_slice_1;report_uninitialized_variables/boolean_mask/concat/values_1;report_uninitialized_variables/boolean_mask/strided_slice_27report_uninitialized_variables/boolean_mask/concat/axis"/device:CPU:0*

Tidx0*
T0*
N*
_output_shapes
:
Ú
3report_uninitialized_variables/boolean_mask/ReshapeReshape$report_uninitialized_variables/Const2report_uninitialized_variables/boolean_mask/concat"/device:CPU:0*
T0*
Tshape0*
_output_shapes
:(

;report_uninitialized_variables/boolean_mask/Reshape_1/shapeConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
˙˙˙˙˙˙˙˙˙
ę
5report_uninitialized_variables/boolean_mask/Reshape_1Reshape)report_uninitialized_variables/LogicalNot;report_uninitialized_variables/boolean_mask/Reshape_1/shape"/device:CPU:0*
T0
*
Tshape0*
_output_shapes
:(
˛
1report_uninitialized_variables/boolean_mask/WhereWhere5report_uninitialized_variables/boolean_mask/Reshape_1"/device:CPU:0*
T0
*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ĺ
3report_uninitialized_variables/boolean_mask/SqueezeSqueeze1report_uninitialized_variables/boolean_mask/Where"/device:CPU:0*
squeeze_dims
*
T0	*#
_output_shapes
:˙˙˙˙˙˙˙˙˙

9report_uninitialized_variables/boolean_mask/GatherV2/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
×
4report_uninitialized_variables/boolean_mask/GatherV2GatherV23report_uninitialized_variables/boolean_mask/Reshape3report_uninitialized_variables/boolean_mask/Squeeze9report_uninitialized_variables/boolean_mask/GatherV2/axis"/device:CPU:0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
Taxis0*

batch_dims *
Tindices0	*
Tparams0
v
$report_uninitialized_resources/ConstConst"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
M
concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
ž
concatConcatV24report_uninitialized_variables/boolean_mask/GatherV2$report_uninitialized_resources/Constconcat/axis*
T0*
N*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tidx0
Ą
6report_uninitialized_variables_1/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 
p
3report_uninitialized_variables_1/VarIsInitializedOpVarIsInitializedOpconv2d/kernel*
_output_shapes
: 
p
5report_uninitialized_variables_1/VarIsInitializedOp_1VarIsInitializedOpconv2d/bias*
_output_shapes
: 
t
5report_uninitialized_variables_1/VarIsInitializedOp_2VarIsInitializedOpconv2d_1/kernel*
_output_shapes
: 
r
5report_uninitialized_variables_1/VarIsInitializedOp_3VarIsInitializedOpconv2d_1/bias*
_output_shapes
: 
q
5report_uninitialized_variables_1/VarIsInitializedOp_4VarIsInitializedOpdense/kernel*
_output_shapes
: 
o
5report_uninitialized_variables_1/VarIsInitializedOp_5VarIsInitializedOp
dense/bias*
_output_shapes
: 
s
5report_uninitialized_variables_1/VarIsInitializedOp_6VarIsInitializedOpdense_1/kernel*
_output_shapes
: 
q
5report_uninitialized_variables_1/VarIsInitializedOp_7VarIsInitializedOpdense_1/bias*
_output_shapes
: 
t
5report_uninitialized_variables_1/VarIsInitializedOp_8VarIsInitializedOpAdam/iterations*
_output_shapes
: 
l
5report_uninitialized_variables_1/VarIsInitializedOp_9VarIsInitializedOpAdam/lr*
_output_shapes
: 
q
6report_uninitialized_variables_1/VarIsInitializedOp_10VarIsInitializedOpAdam/beta_1*
_output_shapes
: 
q
6report_uninitialized_variables_1/VarIsInitializedOp_11VarIsInitializedOpAdam/beta_2*
_output_shapes
: 
p
6report_uninitialized_variables_1/VarIsInitializedOp_12VarIsInitializedOp
Adam/decay*
_output_shapes
: 
w
6report_uninitialized_variables_1/VarIsInitializedOp_13VarIsInitializedOptraining/Variable*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_14VarIsInitializedOptraining/Variable_1*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_15VarIsInitializedOptraining/Variable_2*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_16VarIsInitializedOptraining/Variable_3*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_17VarIsInitializedOptraining/Variable_4*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_18VarIsInitializedOptraining/Variable_5*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_19VarIsInitializedOptraining/Variable_6*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_20VarIsInitializedOptraining/Variable_7*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_21VarIsInitializedOptraining/Variable_8*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_22VarIsInitializedOptraining/Variable_9*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_23VarIsInitializedOptraining/Variable_10*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_24VarIsInitializedOptraining/Variable_11*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_25VarIsInitializedOptraining/Variable_12*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_26VarIsInitializedOptraining/Variable_13*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_27VarIsInitializedOptraining/Variable_14*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_28VarIsInitializedOptraining/Variable_15*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_29VarIsInitializedOptraining/Variable_16*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_30VarIsInitializedOptraining/Variable_17*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_31VarIsInitializedOptraining/Variable_18*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_32VarIsInitializedOptraining/Variable_19*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_33VarIsInitializedOptraining/Variable_20*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_34VarIsInitializedOptraining/Variable_21*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_35VarIsInitializedOptraining/Variable_22*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_36VarIsInitializedOptraining/Variable_23*
_output_shapes
: 
ť
&report_uninitialized_variables_1/stackPack6report_uninitialized_variables_1/IsVariableInitialized3report_uninitialized_variables_1/VarIsInitializedOp5report_uninitialized_variables_1/VarIsInitializedOp_15report_uninitialized_variables_1/VarIsInitializedOp_25report_uninitialized_variables_1/VarIsInitializedOp_35report_uninitialized_variables_1/VarIsInitializedOp_45report_uninitialized_variables_1/VarIsInitializedOp_55report_uninitialized_variables_1/VarIsInitializedOp_65report_uninitialized_variables_1/VarIsInitializedOp_75report_uninitialized_variables_1/VarIsInitializedOp_85report_uninitialized_variables_1/VarIsInitializedOp_96report_uninitialized_variables_1/VarIsInitializedOp_106report_uninitialized_variables_1/VarIsInitializedOp_116report_uninitialized_variables_1/VarIsInitializedOp_126report_uninitialized_variables_1/VarIsInitializedOp_136report_uninitialized_variables_1/VarIsInitializedOp_146report_uninitialized_variables_1/VarIsInitializedOp_156report_uninitialized_variables_1/VarIsInitializedOp_166report_uninitialized_variables_1/VarIsInitializedOp_176report_uninitialized_variables_1/VarIsInitializedOp_186report_uninitialized_variables_1/VarIsInitializedOp_196report_uninitialized_variables_1/VarIsInitializedOp_206report_uninitialized_variables_1/VarIsInitializedOp_216report_uninitialized_variables_1/VarIsInitializedOp_226report_uninitialized_variables_1/VarIsInitializedOp_236report_uninitialized_variables_1/VarIsInitializedOp_246report_uninitialized_variables_1/VarIsInitializedOp_256report_uninitialized_variables_1/VarIsInitializedOp_266report_uninitialized_variables_1/VarIsInitializedOp_276report_uninitialized_variables_1/VarIsInitializedOp_286report_uninitialized_variables_1/VarIsInitializedOp_296report_uninitialized_variables_1/VarIsInitializedOp_306report_uninitialized_variables_1/VarIsInitializedOp_316report_uninitialized_variables_1/VarIsInitializedOp_326report_uninitialized_variables_1/VarIsInitializedOp_336report_uninitialized_variables_1/VarIsInitializedOp_346report_uninitialized_variables_1/VarIsInitializedOp_356report_uninitialized_variables_1/VarIsInitializedOp_36"/device:CPU:0*
T0
*

axis *
N&*
_output_shapes
:&

+report_uninitialized_variables_1/LogicalNot
LogicalNot&report_uninitialized_variables_1/stack"/device:CPU:0*
_output_shapes
:&
Ä
&report_uninitialized_variables_1/ConstConst"/device:CPU:0*Ú
valueĐBÍ&Bglobal_stepBconv2d/kernelBconv2d/biasBconv2d_1/kernelBconv2d_1/biasBdense/kernelB
dense/biasBdense_1/kernelBdense_1/biasBAdam/iterationsBAdam/lrBAdam/beta_1BAdam/beta_2B
Adam/decayBtraining/VariableBtraining/Variable_1Btraining/Variable_2Btraining/Variable_3Btraining/Variable_4Btraining/Variable_5Btraining/Variable_6Btraining/Variable_7Btraining/Variable_8Btraining/Variable_9Btraining/Variable_10Btraining/Variable_11Btraining/Variable_12Btraining/Variable_13Btraining/Variable_14Btraining/Variable_15Btraining/Variable_16Btraining/Variable_17Btraining/Variable_18Btraining/Variable_19Btraining/Variable_20Btraining/Variable_21Btraining/Variable_22Btraining/Variable_23*
dtype0*
_output_shapes
:&

3report_uninitialized_variables_1/boolean_mask/ShapeConst"/device:CPU:0*
valueB:&*
dtype0*
_output_shapes
:

Areport_uninitialized_variables_1/boolean_mask/strided_slice/stackConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB: 

Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
ň
;report_uninitialized_variables_1/boolean_mask/strided_sliceStridedSlice3report_uninitialized_variables_1/boolean_mask/ShapeAreport_uninitialized_variables_1/boolean_mask/strided_slice/stackCreport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2"/device:CPU:0*
end_mask *
_output_shapes
:*
Index0*
T0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask 

Dreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indicesConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

2report_uninitialized_variables_1/boolean_mask/ProdProd;report_uninitialized_variables_1/boolean_mask/strided_sliceDreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indices"/device:CPU:0*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0

5report_uninitialized_variables_1/boolean_mask/Shape_1Const"/device:CPU:0*
valueB:&*
dtype0*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
ú
=report_uninitialized_variables_1/boolean_mask/strided_slice_1StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_1Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2"/device:CPU:0*
ellipsis_mask *

begin_mask*
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask 

5report_uninitialized_variables_1/boolean_mask/Shape_2Const"/device:CPU:0*
valueB:&*
dtype0*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice_2/stackConst"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
ú
=report_uninitialized_variables_1/boolean_mask/strided_slice_2StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_2Creport_uninitialized_variables_1/boolean_mask/strided_slice_2/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_2"/device:CPU:0*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask*
_output_shapes
: *
Index0*
T0
Â
=report_uninitialized_variables_1/boolean_mask/concat/values_1Pack2report_uninitialized_variables_1/boolean_mask/Prod"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:

9report_uninitialized_variables_1/boolean_mask/concat/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

4report_uninitialized_variables_1/boolean_mask/concatConcatV2=report_uninitialized_variables_1/boolean_mask/strided_slice_1=report_uninitialized_variables_1/boolean_mask/concat/values_1=report_uninitialized_variables_1/boolean_mask/strided_slice_29report_uninitialized_variables_1/boolean_mask/concat/axis"/device:CPU:0*
N*
_output_shapes
:*

Tidx0*
T0
ŕ
5report_uninitialized_variables_1/boolean_mask/ReshapeReshape&report_uninitialized_variables_1/Const4report_uninitialized_variables_1/boolean_mask/concat"/device:CPU:0*
T0*
Tshape0*
_output_shapes
:&

=report_uninitialized_variables_1/boolean_mask/Reshape_1/shapeConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
˙˙˙˙˙˙˙˙˙
đ
7report_uninitialized_variables_1/boolean_mask/Reshape_1Reshape+report_uninitialized_variables_1/LogicalNot=report_uninitialized_variables_1/boolean_mask/Reshape_1/shape"/device:CPU:0*
T0
*
Tshape0*
_output_shapes
:&
ś
3report_uninitialized_variables_1/boolean_mask/WhereWhere7report_uninitialized_variables_1/boolean_mask/Reshape_1"/device:CPU:0*
T0
*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
É
5report_uninitialized_variables_1/boolean_mask/SqueezeSqueeze3report_uninitialized_variables_1/boolean_mask/Where"/device:CPU:0*
squeeze_dims
*
T0	*#
_output_shapes
:˙˙˙˙˙˙˙˙˙

;report_uninitialized_variables_1/boolean_mask/GatherV2/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
ß
6report_uninitialized_variables_1/boolean_mask/GatherV2GatherV25report_uninitialized_variables_1/boolean_mask/Reshape5report_uninitialized_variables_1/boolean_mask/Squeeze;report_uninitialized_variables_1/boolean_mask/GatherV2/axis"/device:CPU:0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
Taxis0*

batch_dims *
Tindices0	*
Tparams0
x
&report_uninitialized_resources_1/ConstConst"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
O
concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ć
concat_1ConcatV26report_uninitialized_variables_1/boolean_mask/GatherV2&report_uninitialized_resources_1/Constconcat_1/axis*
T0*
N*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tidx0
.
init_2NoOp^count_1/Assign^total/Assign

init_all_tablesNoOp

init_3NoOp
8
group_deps_1NoOp^init_2^init_3^init_all_tables
K
Merge/MergeSummaryMergeSummaryloss_1*
N*
_output_shapes
: 
Y
save/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
n
save/filenamePlaceholderWithDefaultsave/filename/input*
dtype0*
_output_shapes
: *
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
dtype0*
_output_shapes
: *
shape: 

save/StringJoin/inputs_1Const*<
value3B1 B+_temp_c27a82aab15a477c921e2cf5d734503e/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
dtype0*
_output_shapes
: *
value	B : 

save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
ś
save/SaveV2/tensor_namesConst"/device:CPU:0*Ú
valueĐBÍ&BAdam/beta_1BAdam/beta_2B
Adam/decayBAdam/iterationsBAdam/lrBconv2d/biasBconv2d/kernelBconv2d_1/biasBconv2d_1/kernelB
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelBglobal_stepBtraining/VariableBtraining/Variable_1Btraining/Variable_10Btraining/Variable_11Btraining/Variable_12Btraining/Variable_13Btraining/Variable_14Btraining/Variable_15Btraining/Variable_16Btraining/Variable_17Btraining/Variable_18Btraining/Variable_19Btraining/Variable_2Btraining/Variable_20Btraining/Variable_21Btraining/Variable_22Btraining/Variable_23Btraining/Variable_3Btraining/Variable_4Btraining/Variable_5Btraining/Variable_6Btraining/Variable_7Btraining/Variable_8Btraining/Variable_9*
dtype0*
_output_shapes
:&
ž
save/SaveV2/shape_and_slicesConst"/device:CPU:0*_
valueVBT&B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:&
Ń
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp#Adam/iterations/Read/ReadVariableOpAdam/lr/Read/ReadVariableOpconv2d/bias/Read/ReadVariableOp!conv2d/kernel/Read/ReadVariableOp!conv2d_1/bias/Read/ReadVariableOp#conv2d_1/kernel/Read/ReadVariableOpdense/bias/Read/ReadVariableOp dense/kernel/Read/ReadVariableOp dense_1/bias/Read/ReadVariableOp"dense_1/kernel/Read/ReadVariableOpglobal_step%training/Variable/Read/ReadVariableOp'training/Variable_1/Read/ReadVariableOp(training/Variable_10/Read/ReadVariableOp(training/Variable_11/Read/ReadVariableOp(training/Variable_12/Read/ReadVariableOp(training/Variable_13/Read/ReadVariableOp(training/Variable_14/Read/ReadVariableOp(training/Variable_15/Read/ReadVariableOp(training/Variable_16/Read/ReadVariableOp(training/Variable_17/Read/ReadVariableOp(training/Variable_18/Read/ReadVariableOp(training/Variable_19/Read/ReadVariableOp'training/Variable_2/Read/ReadVariableOp(training/Variable_20/Read/ReadVariableOp(training/Variable_21/Read/ReadVariableOp(training/Variable_22/Read/ReadVariableOp(training/Variable_23/Read/ReadVariableOp'training/Variable_3/Read/ReadVariableOp'training/Variable_4/Read/ReadVariableOp'training/Variable_5/Read/ReadVariableOp'training/Variable_6/Read/ReadVariableOp'training/Variable_7/Read/ReadVariableOp'training/Variable_8/Read/ReadVariableOp'training/Variable_9/Read/ReadVariableOp"/device:CPU:0*4
dtypes*
(2&		
 
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
Ź
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:

save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(

save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
_output_shapes
: *
T0
š
save/RestoreV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:&*Ú
valueĐBÍ&BAdam/beta_1BAdam/beta_2B
Adam/decayBAdam/iterationsBAdam/lrBconv2d/biasBconv2d/kernelBconv2d_1/biasBconv2d_1/kernelB
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelBglobal_stepBtraining/VariableBtraining/Variable_1Btraining/Variable_10Btraining/Variable_11Btraining/Variable_12Btraining/Variable_13Btraining/Variable_14Btraining/Variable_15Btraining/Variable_16Btraining/Variable_17Btraining/Variable_18Btraining/Variable_19Btraining/Variable_2Btraining/Variable_20Btraining/Variable_21Btraining/Variable_22Btraining/Variable_23Btraining/Variable_3Btraining/Variable_4Btraining/Variable_5Btraining/Variable_6Btraining/Variable_7Btraining/Variable_8Btraining/Variable_9
Á
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*_
valueVBT&B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:&
Ű
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*Ž
_output_shapes
::::::::::::::::::::::::::::::::::::::*4
dtypes*
(2&		
N
save/Identity_1Identitysave/RestoreV2*
T0*
_output_shapes
:
T
save/AssignVariableOpAssignVariableOpAdam/beta_1save/Identity_1*
dtype0
P
save/Identity_2Identitysave/RestoreV2:1*
T0*
_output_shapes
:
V
save/AssignVariableOp_1AssignVariableOpAdam/beta_2save/Identity_2*
dtype0
P
save/Identity_3Identitysave/RestoreV2:2*
T0*
_output_shapes
:
U
save/AssignVariableOp_2AssignVariableOp
Adam/decaysave/Identity_3*
dtype0
P
save/Identity_4Identitysave/RestoreV2:3*
T0	*
_output_shapes
:
Z
save/AssignVariableOp_3AssignVariableOpAdam/iterationssave/Identity_4*
dtype0	
P
save/Identity_5Identitysave/RestoreV2:4*
T0*
_output_shapes
:
R
save/AssignVariableOp_4AssignVariableOpAdam/lrsave/Identity_5*
dtype0
P
save/Identity_6Identitysave/RestoreV2:5*
_output_shapes
:*
T0
V
save/AssignVariableOp_5AssignVariableOpconv2d/biassave/Identity_6*
dtype0
P
save/Identity_7Identitysave/RestoreV2:6*
_output_shapes
:*
T0
X
save/AssignVariableOp_6AssignVariableOpconv2d/kernelsave/Identity_7*
dtype0
P
save/Identity_8Identitysave/RestoreV2:7*
T0*
_output_shapes
:
X
save/AssignVariableOp_7AssignVariableOpconv2d_1/biassave/Identity_8*
dtype0
P
save/Identity_9Identitysave/RestoreV2:8*
T0*
_output_shapes
:
Z
save/AssignVariableOp_8AssignVariableOpconv2d_1/kernelsave/Identity_9*
dtype0
Q
save/Identity_10Identitysave/RestoreV2:9*
T0*
_output_shapes
:
V
save/AssignVariableOp_9AssignVariableOp
dense/biassave/Identity_10*
dtype0
R
save/Identity_11Identitysave/RestoreV2:10*
T0*
_output_shapes
:
Y
save/AssignVariableOp_10AssignVariableOpdense/kernelsave/Identity_11*
dtype0
R
save/Identity_12Identitysave/RestoreV2:11*
T0*
_output_shapes
:
Y
save/AssignVariableOp_11AssignVariableOpdense_1/biassave/Identity_12*
dtype0
R
save/Identity_13Identitysave/RestoreV2:12*
_output_shapes
:*
T0
[
save/AssignVariableOp_12AssignVariableOpdense_1/kernelsave/Identity_13*
dtype0

save/AssignAssignglobal_stepsave/RestoreV2:13*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
R
save/Identity_14Identitysave/RestoreV2:14*
T0*
_output_shapes
:
^
save/AssignVariableOp_13AssignVariableOptraining/Variablesave/Identity_14*
dtype0
R
save/Identity_15Identitysave/RestoreV2:15*
T0*
_output_shapes
:
`
save/AssignVariableOp_14AssignVariableOptraining/Variable_1save/Identity_15*
dtype0
R
save/Identity_16Identitysave/RestoreV2:16*
T0*
_output_shapes
:
a
save/AssignVariableOp_15AssignVariableOptraining/Variable_10save/Identity_16*
dtype0
R
save/Identity_17Identitysave/RestoreV2:17*
_output_shapes
:*
T0
a
save/AssignVariableOp_16AssignVariableOptraining/Variable_11save/Identity_17*
dtype0
R
save/Identity_18Identitysave/RestoreV2:18*
T0*
_output_shapes
:
a
save/AssignVariableOp_17AssignVariableOptraining/Variable_12save/Identity_18*
dtype0
R
save/Identity_19Identitysave/RestoreV2:19*
T0*
_output_shapes
:
a
save/AssignVariableOp_18AssignVariableOptraining/Variable_13save/Identity_19*
dtype0
R
save/Identity_20Identitysave/RestoreV2:20*
T0*
_output_shapes
:
a
save/AssignVariableOp_19AssignVariableOptraining/Variable_14save/Identity_20*
dtype0
R
save/Identity_21Identitysave/RestoreV2:21*
_output_shapes
:*
T0
a
save/AssignVariableOp_20AssignVariableOptraining/Variable_15save/Identity_21*
dtype0
R
save/Identity_22Identitysave/RestoreV2:22*
T0*
_output_shapes
:
a
save/AssignVariableOp_21AssignVariableOptraining/Variable_16save/Identity_22*
dtype0
R
save/Identity_23Identitysave/RestoreV2:23*
_output_shapes
:*
T0
a
save/AssignVariableOp_22AssignVariableOptraining/Variable_17save/Identity_23*
dtype0
R
save/Identity_24Identitysave/RestoreV2:24*
T0*
_output_shapes
:
a
save/AssignVariableOp_23AssignVariableOptraining/Variable_18save/Identity_24*
dtype0
R
save/Identity_25Identitysave/RestoreV2:25*
T0*
_output_shapes
:
a
save/AssignVariableOp_24AssignVariableOptraining/Variable_19save/Identity_25*
dtype0
R
save/Identity_26Identitysave/RestoreV2:26*
T0*
_output_shapes
:
`
save/AssignVariableOp_25AssignVariableOptraining/Variable_2save/Identity_26*
dtype0
R
save/Identity_27Identitysave/RestoreV2:27*
T0*
_output_shapes
:
a
save/AssignVariableOp_26AssignVariableOptraining/Variable_20save/Identity_27*
dtype0
R
save/Identity_28Identitysave/RestoreV2:28*
T0*
_output_shapes
:
a
save/AssignVariableOp_27AssignVariableOptraining/Variable_21save/Identity_28*
dtype0
R
save/Identity_29Identitysave/RestoreV2:29*
T0*
_output_shapes
:
a
save/AssignVariableOp_28AssignVariableOptraining/Variable_22save/Identity_29*
dtype0
R
save/Identity_30Identitysave/RestoreV2:30*
_output_shapes
:*
T0
a
save/AssignVariableOp_29AssignVariableOptraining/Variable_23save/Identity_30*
dtype0
R
save/Identity_31Identitysave/RestoreV2:31*
T0*
_output_shapes
:
`
save/AssignVariableOp_30AssignVariableOptraining/Variable_3save/Identity_31*
dtype0
R
save/Identity_32Identitysave/RestoreV2:32*
T0*
_output_shapes
:
`
save/AssignVariableOp_31AssignVariableOptraining/Variable_4save/Identity_32*
dtype0
R
save/Identity_33Identitysave/RestoreV2:33*
T0*
_output_shapes
:
`
save/AssignVariableOp_32AssignVariableOptraining/Variable_5save/Identity_33*
dtype0
R
save/Identity_34Identitysave/RestoreV2:34*
T0*
_output_shapes
:
`
save/AssignVariableOp_33AssignVariableOptraining/Variable_6save/Identity_34*
dtype0
R
save/Identity_35Identitysave/RestoreV2:35*
_output_shapes
:*
T0
`
save/AssignVariableOp_34AssignVariableOptraining/Variable_7save/Identity_35*
dtype0
R
save/Identity_36Identitysave/RestoreV2:36*
T0*
_output_shapes
:
`
save/AssignVariableOp_35AssignVariableOptraining/Variable_8save/Identity_36*
dtype0
R
save/Identity_37Identitysave/RestoreV2:37*
T0*
_output_shapes
:
`
save/AssignVariableOp_36AssignVariableOptraining/Variable_9save/Identity_37*
dtype0

save/restore_shardNoOp^save/Assign^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_10^save/AssignVariableOp_11^save/AssignVariableOp_12^save/AssignVariableOp_13^save/AssignVariableOp_14^save/AssignVariableOp_15^save/AssignVariableOp_16^save/AssignVariableOp_17^save/AssignVariableOp_18^save/AssignVariableOp_19^save/AssignVariableOp_2^save/AssignVariableOp_20^save/AssignVariableOp_21^save/AssignVariableOp_22^save/AssignVariableOp_23^save/AssignVariableOp_24^save/AssignVariableOp_25^save/AssignVariableOp_26^save/AssignVariableOp_27^save/AssignVariableOp_28^save/AssignVariableOp_29^save/AssignVariableOp_3^save/AssignVariableOp_30^save/AssignVariableOp_31^save/AssignVariableOp_32^save/AssignVariableOp_33^save/AssignVariableOp_34^save/AssignVariableOp_35^save/AssignVariableOp_36^save/AssignVariableOp_4^save/AssignVariableOp_5^save/AssignVariableOp_6^save/AssignVariableOp_7^save/AssignVariableOp_8^save/AssignVariableOp_9
-
save/restore_allNoOp^save/restore_shardˇ!
ŕ
`
/__inference_Dataset_flat_map_read_one_file_1028

args_0
identity˘TFRecordDatasetQ
compression_typeConst*
dtype0*
_output_shapes
: *
valueB B O
buffer_sizeConst*
valueB		 R*
dtype0	*
_output_shapes
: s
TFRecordDatasetTFRecordDatasetargs_0compression_type:output:0buffer_size:output:0*
_output_shapes
: a
IdentityIdentityTFRecordDataset:handle:0^TFRecordDataset*
T0*
_output_shapes
: "
identityIdentity:output:0*
_input_shapes
: 2"
TFRecordDatasetTFRecordDataset:& "
 
_user_specified_nameargs_0
Ń
R
&__inference_Dataset_map__parse_fn_1061

args_0
identity

identity_1^
ParseSingleExample/key_depthConst*
value	B	 R *
dtype0	*
_output_shapes
: c
 ParseSingleExample/Reshape/shapeConst*
dtype0*
_output_shapes
: *
valueB Ś
ParseSingleExample/ReshapeReshape%ParseSingleExample/key_depth:output:0)ParseSingleExample/Reshape/shape:output:0*
T0	*
Tshape0*
_output_shapes
: _
ParseSingleExample/key_heightConst*
value	B	 R *
dtype0	*
_output_shapes
: e
"ParseSingleExample/Reshape_1/shapeConst*
valueB *
dtype0*
_output_shapes
: Ť
ParseSingleExample/Reshape_1Reshape&ParseSingleExample/key_height:output:0+ParseSingleExample/Reshape_1/shape:output:0*
T0	*
Tshape0*
_output_shapes
: a
 ParseSingleExample/key_image_rawConst*
valueB B *
dtype0*
_output_shapes
: e
"ParseSingleExample/Reshape_2/shapeConst*
valueB *
dtype0*
_output_shapes
: Ž
ParseSingleExample/Reshape_2Reshape)ParseSingleExample/key_image_raw:output:0+ParseSingleExample/Reshape_2/shape:output:0*
T0*
Tshape0*
_output_shapes
: ^
ParseSingleExample/key_labelConst*
value	B	 R *
dtype0	*
_output_shapes
: e
"ParseSingleExample/Reshape_3/shapeConst*
valueB *
dtype0*
_output_shapes
: Ş
ParseSingleExample/Reshape_3Reshape%ParseSingleExample/key_label:output:0+ParseSingleExample/Reshape_3/shape:output:0*
T0	*
Tshape0*
_output_shapes
: ^
ParseSingleExample/key_widthConst*
value	B	 R *
dtype0	*
_output_shapes
: e
"ParseSingleExample/Reshape_4/shapeConst*
dtype0*
_output_shapes
: *
valueB Ş
ParseSingleExample/Reshape_4Reshape%ParseSingleExample/key_width:output:0+ParseSingleExample/Reshape_4/shape:output:0*
T0	*
Tshape0*
_output_shapes
: Ę
%ParseSingleExample/ParseSingleExampleParseSingleExampleargs_0#ParseSingleExample/Reshape:output:0%ParseSingleExample/Reshape_1:output:0%ParseSingleExample/Reshape_2:output:0%ParseSingleExample/Reshape_3:output:0%ParseSingleExample/Reshape_4:output:0*
Tdense	
2				*

num_sparse *8

dense_keys*
(depthheight	image_rawlabelwidth*
_output_shapes

: : : : : *
sparse_types
 *
dense_shapes

: : : : : *
sparse_keys
 
	DecodeRaw	DecodeRaw4ParseSingleExample/ParseSingleExample:dense_values:2*
little_endian(*
out_type0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Reshape/CastCast4ParseSingleExample/ParseSingleExample:dense_values:1*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
Reshape/Cast_1Cast4ParseSingleExample/ParseSingleExample:dense_values:4*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
Reshape/Cast_2Cast4ParseSingleExample/ParseSingleExample:dense_values:0*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0
Reshape/shapePackReshape/Cast:y:0Reshape/Cast_1:y:0Reshape/Cast_2:y:0*
T0*

axis *
N*
_output_shapes
:y
ReshapeReshapeDecodeRaw:output:0Reshape/shape:output:0*
T0*
Tshape0*"
_output_shapes
:
CastCast4ParseSingleExample/ParseSingleExample:dense_values:3*

SrcT0	*
Truncate( *
_output_shapes
: *

DstT0S
IdentityIdentityReshape:output:0*
T0*"
_output_shapes
:A

Identity_1IdentityCast:y:0*
_output_shapes
: *
T0"
identityIdentity:output:0"!

identity_1Identity_1:output:0*
_input_shapes
: :& "
 
_user_specified_nameargs_0"&éÂ %     3Íb	ôh¨íH×AJË
ŤEE
:
Add
x"T
y"T
z"T"
Ttype:
2	

ArgMax

input"T
	dimension"Tidx
output"output_type" 
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
s
	AssignAdd
ref"T

value"T

output_ref"T" 
Ttype:
2	"
use_lockingbool( 
E
AssignAddVariableOp
resource
value"dtype"
dtypetype
B
AssignVariableOp
resource
value"dtype"
dtypetype
°
BatchDatasetV2
input_dataset

batch_size	
drop_remainder


handle"
parallel_copybool( "
output_types
list(type)(0" 
output_shapeslist(shape)(0
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
~
BiasAddGrad
out_backprop"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype

Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

Ŕ
Conv2DBackpropFilter

input"T
filter_sizes
out_backprop"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

ż
Conv2DBackpropInput
input_sizes
filter"T
out_backprop"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

8
DivNoNan
x"T
y"T
z"T"
Ttype:	
2
B
Equal
x"T
y"T
z
"
Ttype:
2	

W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
ˇ
FlatMapDataset
input_dataset
other_arguments2
Targuments

handle"	
ffunc"

Targuments
list(type)("
output_types
list(type)(0" 
output_shapeslist(shape)(0
­
GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"

batch_dimsint "
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
B
GreaterEqual
x"T
y"T
z
"
Ttype:
2	
.
Identity

input"T
output"T"	
Ttype
N
IsVariableInitialized
ref"dtype
is_initialized
"
dtypetype

IteratorGetNext
iterator

components2output_types"
output_types
list(type)(0" 
output_shapeslist(shape)(0
C
IteratorToStringHandle
resource_handle
string_handle


IteratorV2

handle"
shared_namestring"
	containerstring"
output_types
list(type)(0" 
output_shapeslist(shape)(0


LogicalNot
x

y

,
MakeIterator
dataset
iterator
ű

MapDataset
input_dataset
other_arguments2
Targuments

handle"	
ffunc"

Targuments
list(type)("
output_types
list(type)(0" 
output_shapeslist(shape)(0"$
use_inter_op_parallelismbool(" 
preserve_cardinalitybool( 
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
Ô
MaxPool

input"T
output"T"
Ttype0:
2	"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID":
data_formatstringNHWC:
NHWCNCHWNCHW_VECT_C
î
MaxPoolGrad

orig_input"T
orig_output"T	
grad"T
output"T"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW"
Ttype0:
2	
8
Maximum
x"T
y"T
z"T"
Ttype:

2	
N
Merge
inputs"T*N
output"T
value_index"	
Ttype"
Nint(0
8
MergeSummary
inputs*N
summary"
Nint(0
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
8
Minimum
x"T
y"T
z"T"
Ttype:

2	

ModelDataset
input_dataset

handle"

cpu_budgetint "
output_types
list(type)(0" 
output_shapeslist(shape)(0
=
Mul
x"T
y"T
z"T"
Ttype:
2	
.
Neg
x"T
y"T"
Ttype:

2	

NoOp
Ż
OptimizeDataset
input_dataset
optimizations

handle"
output_types
list(type)(0" 
output_shapeslist(shape)(0"(
optimization_configslist(string)
 
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
6
Pow
x"T
y"T
z"T"
Ttype:

2	
L
PreventGradient

input"T
output"T"	
Ttype"
messagestring 

Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
@
ReadVariableOp
resource
value"dtype"
dtypetype
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
\
	RefSwitch
data"T
pred

output_false"T
output_true"T"	
Ttype
E
Relu
features"T
activations"T"
Ttype:
2	
V
ReluGrad
	gradients"T
features"T
	backprops"T"
Ttype:
2	
{
RepeatDataset
input_dataset	
count	

handle"
output_types
list(type)(0" 
output_shapeslist(shape)(0
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
P
ScalarSummary
tags
values"T
summary"
Ttype:
2	
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
e
ShapeN
input"T*N
output"out_type*N"
Nint(0"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
˝
ShuffleDataset
input_dataset
buffer_size	
seed		
seed2	

handle"$
reshuffle_each_iterationbool("
output_types
list(type)(0" 
output_shapeslist(shape)(0
O
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
9
Softmax
logits"T
softmax"T"
Ttype:
2

#SparseSoftmaxCrossEntropyWithLogits
features"T
labels"Tlabels	
loss"T
backprop"T"
Ttype:
2"
Tlabelstype0	:
2	
-
Sqrt
x"T
y"T"
Ttype:

2
1
Square
x"T
y"T"
Ttype:

2	
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
ö
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
M
Switch	
data"T
pred

output_false"T
output_true"T"	
Ttype

TensorSliceDataset

components2Toutput_types

handle"
Toutput_types
list(type)(0" 
output_shapeslist(shape)(0
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
q
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape
9
VarIsInitializedOp
resource
is_initialized

s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring 
E
Where

input"T	
index	"%
Ttype0
:
2	

&
	ZerosLike
x"T
y"T"	
Ttype*1.14.02v1.14.0-rc1-22-gaf24dc91b5ëł

global_step/Initializer/zerosConst*
dtype0	*
_output_shapes
: *
_class
loc:@global_step*
value	B	 R 

global_step
VariableV2*
dtype0	*
_output_shapes
: *
shared_name *
_class
loc:@global_step*
	container *
shape: 
˛
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: *
use_locking(
j
global_step/readIdentityglobal_step*
T0	*
_class
loc:@global_step*
_output_shapes
: 

!global_step/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 

global_step/cond/SwitchSwitch!global_step/IsVariableInitialized!global_step/IsVariableInitialized*
T0
*
_output_shapes
: : 
a
global_step/cond/switch_tIdentityglobal_step/cond/Switch:1*
T0
*
_output_shapes
: 
_
global_step/cond/switch_fIdentityglobal_step/cond/Switch*
T0
*
_output_shapes
: 
h
global_step/cond/pred_idIdentity!global_step/IsVariableInitialized*
_output_shapes
: *
T0

b
global_step/cond/readIdentityglobal_step/cond/read/Switch:1*
T0	*
_output_shapes
: 

global_step/cond/read/Switch	RefSwitchglobal_stepglobal_step/cond/pred_id*
T0	*
_class
loc:@global_step*
_output_shapes
: : 

global_step/cond/Switch_1Switchglobal_step/Initializer/zerosglobal_step/cond/pred_id*
_output_shapes
: : *
T0	*
_class
loc:@global_step
}
global_step/cond/MergeMergeglobal_step/cond/Switch_1global_step/cond/read*
T0	*
N*
_output_shapes
: : 
S
global_step/add/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
b
global_step/addAddglobal_step/cond/Mergeglobal_step/add/y*
_output_shapes
: *
T0	
q
ConstConst"/device:CPU:0*
dtype0*
_output_shapes
: *-
value$B" B./data/mnist_train.tfrecords
v
flat_filenames/shapeConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
˙˙˙˙˙˙˙˙˙
x
flat_filenamesReshapeConstflat_filenames/shape"/device:CPU:0*
T0*
Tshape0*
_output_shapes
:

TensorSliceDatasetTensorSliceDatasetflat_filenames"/device:CPU:0*
output_shapes
: *
Toutput_types
2*
_output_shapes
: 
Ő
FlatMapDatasetFlatMapDatasetTensorSliceDataset"/device:CPU:0*
output_shapes
: *8
f3R1
/__inference_Dataset_flat_map_read_one_file_1028*
_output_shapes
: *
output_types
2*

Targuments
 


MapDataset
MapDatasetFlatMapDataset"/device:CPU:0*
preserve_cardinality( *
_output_shapes
: *#
output_shapes
:: */
f*R(
&__inference_Dataset_map__parse_fn_1061*
use_inter_op_parallelism(*
output_types
2*

Targuments
 
]
buffer_sizeConst"/device:CPU:0*
value
B	 Rč*
dtype0	*
_output_shapes
: 
U
seedConst"/device:CPU:0*
dtype0	*
_output_shapes
: *
value	B	 R 
V
seed2Const"/device:CPU:0*
value	B	 R *
dtype0	*
_output_shapes
: 
Ę
ShuffleDatasetShuffleDataset
MapDatasetbuffer_sizeseedseed2"/device:CPU:0*
reshuffle_each_iteration(*
_output_shapes
: *
output_types
2*#
output_shapes
:: 
_
countConst"/device:CPU:0*
dtype0	*
_output_shapes
: *
valueB	 R
˙˙˙˙˙˙˙˙˙

RepeatDatasetRepeatDatasetShuffleDatasetcount"/device:CPU:0*
output_types
2*#
output_shapes
:: *
_output_shapes
: 
[

batch_sizeConst"/device:CPU:0*
value	B	 Rd*
dtype0	*
_output_shapes
: 
_
drop_remainderConst"/device:CPU:0*
dtype0
*
_output_shapes
: *
value	B
 Z 
Ţ
BatchDatasetV2BatchDatasetV2RepeatDataset
batch_sizedrop_remainder"/device:CPU:0*
_output_shapes
: *
output_types
2*
parallel_copy( *=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

optimizationsConst*V
valueMBKBmap_and_batch_fusionBnoop_eliminationBshuffle_and_repeat_fusion*
dtype0*
_output_shapes
:
ř
OptimizeDatasetOptimizeDatasetBatchDatasetV2optimizations*F
optimization_configs.
,*map_vectorization:use_choose_fastest:false*
_output_shapes
: *
output_types
2*=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ž
ModelDatasetModelDatasetOptimizeDataset*=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*

cpu_budget *
_output_shapes
: *
output_types
2
Ť

IteratorV2
IteratorV2*=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
	container *
_output_shapes
: *
output_types
2*
shared_name 
U
MakeIteratorMakeIteratorModelDataset
IteratorV2*
_class
loc:@IteratorV2
T
IteratorToStringHandleIteratorToStringHandle
IteratorV2*
_output_shapes
: 
Ĺ
IteratorGetNextIteratorGetNext
IteratorV2*=
output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*>
_output_shapes,
*:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
output_types
2
v
CastCastIteratorGetNext*
Truncate( *

DstT0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙*

SrcT0
n
Cast_1CastIteratorGetNext:1*

SrcT0*
Truncate( *

DstT0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Š
.conv2d/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:* 
_class
loc:@conv2d/kernel*%
valueB"             

,conv2d/kernel/Initializer/random_uniform/minConst* 
_class
loc:@conv2d/kernel*
valueB
 *n§Ž˝*
dtype0*
_output_shapes
: 

,conv2d/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: * 
_class
loc:@conv2d/kernel*
valueB
 *n§Ž=
đ
6conv2d/kernel/Initializer/random_uniform/RandomUniformRandomUniform.conv2d/kernel/Initializer/random_uniform/shape*
T0* 
_class
loc:@conv2d/kernel*
seed2 *
dtype0*&
_output_shapes
: *

seed 
Ň
,conv2d/kernel/Initializer/random_uniform/subSub,conv2d/kernel/Initializer/random_uniform/max,conv2d/kernel/Initializer/random_uniform/min*
T0* 
_class
loc:@conv2d/kernel*
_output_shapes
: 
ě
,conv2d/kernel/Initializer/random_uniform/mulMul6conv2d/kernel/Initializer/random_uniform/RandomUniform,conv2d/kernel/Initializer/random_uniform/sub*
T0* 
_class
loc:@conv2d/kernel*&
_output_shapes
: 
Ţ
(conv2d/kernel/Initializer/random_uniformAdd,conv2d/kernel/Initializer/random_uniform/mul,conv2d/kernel/Initializer/random_uniform/min*
T0* 
_class
loc:@conv2d/kernel*&
_output_shapes
: 
ą
conv2d/kernelVarHandleOp*
dtype0*
_output_shapes
: *
shared_nameconv2d/kernel* 
_class
loc:@conv2d/kernel*
	container *
shape: 
k
.conv2d/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d/kernel*
_output_shapes
: 

conv2d/kernel/AssignAssignVariableOpconv2d/kernel(conv2d/kernel/Initializer/random_uniform* 
_class
loc:@conv2d/kernel*
dtype0

!conv2d/kernel/Read/ReadVariableOpReadVariableOpconv2d/kernel* 
_class
loc:@conv2d/kernel*
dtype0*&
_output_shapes
: 

conv2d/bias/Initializer/zerosConst*
_class
loc:@conv2d/bias*
valueB *    *
dtype0*
_output_shapes
: 

conv2d/biasVarHandleOp*
shared_nameconv2d/bias*
_class
loc:@conv2d/bias*
	container *
shape: *
dtype0*
_output_shapes
: 
g
,conv2d/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d/bias*
_output_shapes
: 

conv2d/bias/AssignAssignVariableOpconv2d/biasconv2d/bias/Initializer/zeros*
_class
loc:@conv2d/bias*
dtype0

conv2d/bias/Read/ReadVariableOpReadVariableOpconv2d/bias*
dtype0*
_output_shapes
: *
_class
loc:@conv2d/bias
e
conv2d/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
r
conv2d/Conv2D/ReadVariableOpReadVariableOpconv2d/kernel*
dtype0*&
_output_shapes
: 
ü
conv2d/Conv2DConv2DCastconv2d/Conv2D/ReadVariableOp*
T0*
data_formatNHWC*
strides
*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ *
	dilations

e
conv2d/BiasAdd/ReadVariableOpReadVariableOpconv2d/bias*
dtype0*
_output_shapes
: 

conv2d/BiasAddBiasAddconv2d/Conv2Dconv2d/BiasAdd/ReadVariableOp*
data_formatNHWC*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ *
T0
]
conv2d/ReluReluconv2d/BiasAdd*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ 
ş
max_pooling2d/MaxPoolMaxPoolconv2d/Relu*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ *
T0*
data_formatNHWC*
strides
*
ksize
*
paddingVALID
­
0conv2d_1/kernel/Initializer/random_uniform/shapeConst*"
_class
loc:@conv2d_1/kernel*%
valueB"          @   *
dtype0*
_output_shapes
:

.conv2d_1/kernel/Initializer/random_uniform/minConst*"
_class
loc:@conv2d_1/kernel*
valueB
 *ÍĚL˝*
dtype0*
_output_shapes
: 

.conv2d_1/kernel/Initializer/random_uniform/maxConst*"
_class
loc:@conv2d_1/kernel*
valueB
 *ÍĚL=*
dtype0*
_output_shapes
: 
ö
8conv2d_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform0conv2d_1/kernel/Initializer/random_uniform/shape*
dtype0*&
_output_shapes
: @*

seed *
T0*"
_class
loc:@conv2d_1/kernel*
seed2 
Ú
.conv2d_1/kernel/Initializer/random_uniform/subSub.conv2d_1/kernel/Initializer/random_uniform/max.conv2d_1/kernel/Initializer/random_uniform/min*
T0*"
_class
loc:@conv2d_1/kernel*
_output_shapes
: 
ô
.conv2d_1/kernel/Initializer/random_uniform/mulMul8conv2d_1/kernel/Initializer/random_uniform/RandomUniform.conv2d_1/kernel/Initializer/random_uniform/sub*
T0*"
_class
loc:@conv2d_1/kernel*&
_output_shapes
: @
ć
*conv2d_1/kernel/Initializer/random_uniformAdd.conv2d_1/kernel/Initializer/random_uniform/mul.conv2d_1/kernel/Initializer/random_uniform/min*
T0*"
_class
loc:@conv2d_1/kernel*&
_output_shapes
: @
ˇ
conv2d_1/kernelVarHandleOp* 
shared_nameconv2d_1/kernel*"
_class
loc:@conv2d_1/kernel*
	container *
shape: @*
dtype0*
_output_shapes
: 
o
0conv2d_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d_1/kernel*
_output_shapes
: 

conv2d_1/kernel/AssignAssignVariableOpconv2d_1/kernel*conv2d_1/kernel/Initializer/random_uniform*"
_class
loc:@conv2d_1/kernel*
dtype0

#conv2d_1/kernel/Read/ReadVariableOpReadVariableOpconv2d_1/kernel*"
_class
loc:@conv2d_1/kernel*
dtype0*&
_output_shapes
: @

conv2d_1/bias/Initializer/zerosConst* 
_class
loc:@conv2d_1/bias*
valueB@*    *
dtype0*
_output_shapes
:@
Ľ
conv2d_1/biasVarHandleOp*
dtype0*
_output_shapes
: *
shared_nameconv2d_1/bias* 
_class
loc:@conv2d_1/bias*
	container *
shape:@
k
.conv2d_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d_1/bias*
_output_shapes
: 

conv2d_1/bias/AssignAssignVariableOpconv2d_1/biasconv2d_1/bias/Initializer/zeros* 
_class
loc:@conv2d_1/bias*
dtype0

!conv2d_1/bias/Read/ReadVariableOpReadVariableOpconv2d_1/bias* 
_class
loc:@conv2d_1/bias*
dtype0*
_output_shapes
:@
g
conv2d_1/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
v
conv2d_1/Conv2D/ReadVariableOpReadVariableOpconv2d_1/kernel*
dtype0*&
_output_shapes
: @

conv2d_1/Conv2DConv2Dmax_pooling2d/MaxPoolconv2d_1/Conv2D/ReadVariableOp*
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 
i
conv2d_1/BiasAdd/ReadVariableOpReadVariableOpconv2d_1/bias*
dtype0*
_output_shapes
:@

conv2d_1/BiasAddBiasAddconv2d_1/Conv2Dconv2d_1/BiasAdd/ReadVariableOp*
T0*
data_formatNHWC*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
a
conv2d_1/ReluReluconv2d_1/BiasAdd*
T0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
ž
max_pooling2d_1/MaxPoolMaxPoolconv2d_1/Relu*
T0*
data_formatNHWC*
strides
*
ksize
*
paddingVALID*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
d
flatten/ShapeShapemax_pooling2d_1/MaxPool*
T0*
out_type0*
_output_shapes
:
e
flatten/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
g
flatten/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
g
flatten/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Ą
flatten/strided_sliceStridedSliceflatten/Shapeflatten/strided_slice/stackflatten/strided_slice/stack_1flatten/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
b
flatten/Reshape/shape/1Const*
valueB :
˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes
: 

flatten/Reshape/shapePackflatten/strided_sliceflatten/Reshape/shape/1*
N*
_output_shapes
:*
T0*

axis 

flatten/ReshapeReshapemax_pooling2d_1/MaxPoolflatten/Reshape/shape*(
_output_shapes
:˙˙˙˙˙˙˙˙˙Ŕ*
T0*
Tshape0

-dense/kernel/Initializer/random_uniform/shapeConst*
_class
loc:@dense/kernel*
valueB"@     *
dtype0*
_output_shapes
:

+dense/kernel/Initializer/random_uniform/minConst*
_class
loc:@dense/kernel*
valueB
 *˝*
dtype0*
_output_shapes
: 

+dense/kernel/Initializer/random_uniform/maxConst*
_class
loc:@dense/kernel*
valueB
 *=*
dtype0*
_output_shapes
: 
ç
5dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform-dense/kernel/Initializer/random_uniform/shape*
seed2 *
dtype0* 
_output_shapes
:
Ŕ*

seed *
T0*
_class
loc:@dense/kernel
Î
+dense/kernel/Initializer/random_uniform/subSub+dense/kernel/Initializer/random_uniform/max+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel*
_output_shapes
: 
â
+dense/kernel/Initializer/random_uniform/mulMul5dense/kernel/Initializer/random_uniform/RandomUniform+dense/kernel/Initializer/random_uniform/sub*
T0*
_class
loc:@dense/kernel* 
_output_shapes
:
Ŕ
Ô
'dense/kernel/Initializer/random_uniformAdd+dense/kernel/Initializer/random_uniform/mul+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel* 
_output_shapes
:
Ŕ
¨
dense/kernelVarHandleOp*
dtype0*
_output_shapes
: *
shared_namedense/kernel*
_class
loc:@dense/kernel*
	container *
shape:
Ŕ
i
-dense/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense/kernel*
_output_shapes
: 

dense/kernel/AssignAssignVariableOpdense/kernel'dense/kernel/Initializer/random_uniform*
_class
loc:@dense/kernel*
dtype0

 dense/kernel/Read/ReadVariableOpReadVariableOpdense/kernel*
_class
loc:@dense/kernel*
dtype0* 
_output_shapes
:
Ŕ

,dense/bias/Initializer/zeros/shape_as_tensorConst*
_class
loc:@dense/bias*
valueB:*
dtype0*
_output_shapes
:

"dense/bias/Initializer/zeros/ConstConst*
_class
loc:@dense/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
Í
dense/bias/Initializer/zerosFill,dense/bias/Initializer/zeros/shape_as_tensor"dense/bias/Initializer/zeros/Const*
T0*
_class
loc:@dense/bias*

index_type0*
_output_shapes	
:


dense/biasVarHandleOp*
shared_name
dense/bias*
_class
loc:@dense/bias*
	container *
shape:*
dtype0*
_output_shapes
: 
e
+dense/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOp
dense/bias*
_output_shapes
: 
{
dense/bias/AssignAssignVariableOp
dense/biasdense/bias/Initializer/zeros*
_class
loc:@dense/bias*
dtype0

dense/bias/Read/ReadVariableOpReadVariableOp
dense/bias*
dtype0*
_output_shapes	
:*
_class
loc:@dense/bias
j
dense/MatMul/ReadVariableOpReadVariableOpdense/kernel*
dtype0* 
_output_shapes
:
Ŕ

dense/MatMulMatMulflatten/Reshapedense/MatMul/ReadVariableOp*
transpose_a( *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_b( *
T0
d
dense/BiasAdd/ReadVariableOpReadVariableOp
dense/bias*
dtype0*
_output_shapes	
:

dense/BiasAddBiasAdddense/MatMuldense/BiasAdd/ReadVariableOp*
T0*
data_formatNHWC*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
T

dense/ReluReludense/BiasAdd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Y
dropout/dropout/rateConst*
valueB
 *ÍĚĚ>*
dtype0*
_output_shapes
: 
_
dropout/dropout/ShapeShape
dense/Relu*
T0*
out_type0*
_output_shapes
:
g
"dropout/dropout/random_uniform/minConst*
valueB
 *    *
dtype0*
_output_shapes
: 
g
"dropout/dropout/random_uniform/maxConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
­
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape*
T0*
dtype0*
seed2 *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*

seed 

"dropout/dropout/random_uniform/subSub"dropout/dropout/random_uniform/max"dropout/dropout/random_uniform/min*
T0*
_output_shapes
: 
Ž
"dropout/dropout/random_uniform/mulMul,dropout/dropout/random_uniform/RandomUniform"dropout/dropout/random_uniform/sub*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
 
dropout/dropout/random_uniformAdd"dropout/dropout/random_uniform/mul"dropout/dropout/random_uniform/min*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Z
dropout/dropout/sub/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
h
dropout/dropout/subSubdropout/dropout/sub/xdropout/dropout/rate*
T0*
_output_shapes
: 
^
dropout/dropout/truediv/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
s
dropout/dropout/truedivRealDivdropout/dropout/truediv/xdropout/dropout/sub*
_output_shapes
: *
T0

dropout/dropout/GreaterEqualGreaterEqualdropout/dropout/random_uniformdropout/dropout/rate*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
r
dropout/dropout/mulMul
dense/Reludropout/dropout/truediv*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

dropout/dropout/CastCastdropout/dropout/GreaterEqual*

SrcT0
*
Truncate( *

DstT0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
z
dropout/dropout/mul_1Muldropout/dropout/muldropout/dropout/Cast*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ł
/dense_1/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_1/kernel*
valueB"   
   *
dtype0*
_output_shapes
:

-dense_1/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_1/kernel*
valueB
 *č˝*
dtype0*
_output_shapes
: 

-dense_1/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_1/kernel*
valueB
 *č=*
dtype0*
_output_shapes
: 
ě
7dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_1/kernel/Initializer/random_uniform/shape*

seed *
T0*!
_class
loc:@dense_1/kernel*
seed2 *
dtype0*
_output_shapes
:	

Ö
-dense_1/kernel/Initializer/random_uniform/subSub-dense_1/kernel/Initializer/random_uniform/max-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
: 
é
-dense_1/kernel/Initializer/random_uniform/mulMul7dense_1/kernel/Initializer/random_uniform/RandomUniform-dense_1/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
:	

Ű
)dense_1/kernel/Initializer/random_uniformAdd-dense_1/kernel/Initializer/random_uniform/mul-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
:	

­
dense_1/kernelVarHandleOp*!
_class
loc:@dense_1/kernel*
	container *
shape:	
*
dtype0*
_output_shapes
: *
shared_namedense_1/kernel
m
/dense_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_1/kernel*
_output_shapes
: 

dense_1/kernel/AssignAssignVariableOpdense_1/kernel)dense_1/kernel/Initializer/random_uniform*!
_class
loc:@dense_1/kernel*
dtype0

"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel*!
_class
loc:@dense_1/kernel*
dtype0*
_output_shapes
:	


dense_1/bias/Initializer/zerosConst*
_class
loc:@dense_1/bias*
valueB
*    *
dtype0*
_output_shapes
:

˘
dense_1/biasVarHandleOp*
shape:
*
dtype0*
_output_shapes
: *
shared_namedense_1/bias*
_class
loc:@dense_1/bias*
	container 
i
-dense_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_1/bias*
_output_shapes
: 

dense_1/bias/AssignAssignVariableOpdense_1/biasdense_1/bias/Initializer/zeros*
_class
loc:@dense_1/bias*
dtype0

 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_class
loc:@dense_1/bias*
dtype0*
_output_shapes
:

m
dense_1/MatMul/ReadVariableOpReadVariableOpdense_1/kernel*
dtype0*
_output_shapes
:	

Ś
dense_1/MatMulMatMuldropout/dropout/mul_1dense_1/MatMul/ReadVariableOp*
transpose_a( *'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
transpose_b( *
T0
g
dense_1/BiasAdd/ReadVariableOpReadVariableOpdense_1/bias*
dtype0*
_output_shapes
:


dense_1/BiasAddBiasAdddense_1/MatMuldense_1/BiasAdd/ReadVariableOp*
T0*
data_formatNHWC*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

]
dense_1/SoftmaxSoftmaxdense_1/BiasAdd*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙


)Adam/iterations/Initializer/initial_valueConst*"
_class
loc:@Adam/iterations*
value	B	 R *
dtype0	*
_output_shapes
: 
§
Adam/iterationsVarHandleOp*"
_class
loc:@Adam/iterations*
	container *
shape: *
dtype0	*
_output_shapes
: * 
shared_nameAdam/iterations
o
0Adam/iterations/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/iterations*
_output_shapes
: 

Adam/iterations/AssignAssignVariableOpAdam/iterations)Adam/iterations/Initializer/initial_value*
dtype0	*"
_class
loc:@Adam/iterations

#Adam/iterations/Read/ReadVariableOpReadVariableOpAdam/iterations*"
_class
loc:@Adam/iterations*
dtype0	*
_output_shapes
: 

!Adam/lr/Initializer/initial_valueConst*
_class
loc:@Adam/lr*
valueB
 *ÍĚĚ=*
dtype0*
_output_shapes
: 

Adam/lrVarHandleOp*
shape: *
dtype0*
_output_shapes
: *
shared_name	Adam/lr*
_class
loc:@Adam/lr*
	container 
_
(Adam/lr/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/lr*
_output_shapes
: 
w
Adam/lr/AssignAssignVariableOpAdam/lr!Adam/lr/Initializer/initial_value*
_class
loc:@Adam/lr*
dtype0
w
Adam/lr/Read/ReadVariableOpReadVariableOpAdam/lr*
_class
loc:@Adam/lr*
dtype0*
_output_shapes
: 

%Adam/beta_1/Initializer/initial_valueConst*
_class
loc:@Adam/beta_1*
valueB
 *fff?*
dtype0*
_output_shapes
: 

Adam/beta_1VarHandleOp*
shared_nameAdam/beta_1*
_class
loc:@Adam/beta_1*
	container *
shape: *
dtype0*
_output_shapes
: 
g
,Adam/beta_1/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/beta_1*
_output_shapes
: 

Adam/beta_1/AssignAssignVariableOpAdam/beta_1%Adam/beta_1/Initializer/initial_value*
dtype0*
_class
loc:@Adam/beta_1

Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_class
loc:@Adam/beta_1*
dtype0*
_output_shapes
: 

%Adam/beta_2/Initializer/initial_valueConst*
_class
loc:@Adam/beta_2*
valueB
 *wž?*
dtype0*
_output_shapes
: 

Adam/beta_2VarHandleOp*
dtype0*
_output_shapes
: *
shared_nameAdam/beta_2*
_class
loc:@Adam/beta_2*
	container *
shape: 
g
,Adam/beta_2/IsInitialized/VarIsInitializedOpVarIsInitializedOpAdam/beta_2*
_output_shapes
: 

Adam/beta_2/AssignAssignVariableOpAdam/beta_2%Adam/beta_2/Initializer/initial_value*
dtype0*
_class
loc:@Adam/beta_2

Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_class
loc:@Adam/beta_2*
dtype0*
_output_shapes
: 

$Adam/decay/Initializer/initial_valueConst*
_class
loc:@Adam/decay*
valueB
 *    *
dtype0*
_output_shapes
: 


Adam/decayVarHandleOp*
shape: *
dtype0*
_output_shapes
: *
shared_name
Adam/decay*
_class
loc:@Adam/decay*
	container 
e
+Adam/decay/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Adam/decay*
_output_shapes
: 

Adam/decay/AssignAssignVariableOp
Adam/decay$Adam/decay/Initializer/initial_value*
_class
loc:@Adam/decay*
dtype0

Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_class
loc:@Adam/decay*
dtype0*
_output_shapes
: 
v
total/Initializer/zerosConst*
_class

loc:@total*
valueB
 *    *
dtype0*
_output_shapes
: 

totalVarHandleOp*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_nametotal*
_class

loc:@total
[
&total/IsInitialized/VarIsInitializedOpVarIsInitializedOptotal*
_output_shapes
: 
g
total/AssignAssignVariableOptotaltotal/Initializer/zeros*
dtype0*
_class

loc:@total
q
total/Read/ReadVariableOpReadVariableOptotal*
dtype0*
_output_shapes
: *
_class

loc:@total
z
count_1/Initializer/zerosConst*
_class
loc:@count_1*
valueB
 *    *
dtype0*
_output_shapes
: 

count_1VarHandleOp*
shape: *
dtype0*
_output_shapes
: *
shared_name	count_1*
_class
loc:@count_1*
	container 
_
(count_1/IsInitialized/VarIsInitializedOpVarIsInitializedOpcount_1*
_output_shapes
: 
o
count_1/AssignAssignVariableOpcount_1count_1/Initializer/zeros*
_class
loc:@count_1*
dtype0
w
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_class
loc:@count_1*
dtype0*
_output_shapes
: 
g
metrics/acc/ArgMax/dimensionConst*
dtype0*
_output_shapes
: *
valueB :
˙˙˙˙˙˙˙˙˙

metrics/acc/ArgMaxArgMaxdense_1/Softmaxmetrics/acc/ArgMax/dimension*
output_type0	*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tidx0*
T0
y
metrics/acc/CastCastmetrics/acc/ArgMax*

SrcT0	*
Truncate( *

DstT0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
b
metrics/acc/EqualEqualCast_1metrics/acc/Cast*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
z
metrics/acc/Cast_1Castmetrics/acc/Equal*

SrcT0
*
Truncate( *

DstT0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
[
metrics/acc/ConstConst*
valueB: *
dtype0*
_output_shapes
:
{
metrics/acc/SumSummetrics/acc/Cast_1metrics/acc/Const*
T0*
_output_shapes
: *

Tidx0*
	keep_dims( 
[
metrics/acc/AssignAddVariableOpAssignAddVariableOptotalmetrics/acc/Sum*
dtype0

metrics/acc/ReadVariableOpReadVariableOptotal ^metrics/acc/AssignAddVariableOp^metrics/acc/Sum*
dtype0*
_output_shapes
: 
]
metrics/acc/SizeSizemetrics/acc/Cast_1*
T0*
out_type0*
_output_shapes
: 
l
metrics/acc/Cast_2Castmetrics/acc/Size*

SrcT0*
Truncate( *

DstT0*
_output_shapes
: 

!metrics/acc/AssignAddVariableOp_1AssignAddVariableOpcount_1metrics/acc/Cast_2 ^metrics/acc/AssignAddVariableOp*
dtype0
˘
metrics/acc/ReadVariableOp_1ReadVariableOpcount_1 ^metrics/acc/AssignAddVariableOp"^metrics/acc/AssignAddVariableOp_1*
dtype0*
_output_shapes
: 

%metrics/acc/div_no_nan/ReadVariableOpReadVariableOptotal"^metrics/acc/AssignAddVariableOp_1*
dtype0*
_output_shapes
: 

'metrics/acc/div_no_nan/ReadVariableOp_1ReadVariableOpcount_1"^metrics/acc/AssignAddVariableOp_1*
dtype0*
_output_shapes
: 

metrics/acc/div_no_nanDivNoNan%metrics/acc/div_no_nan/ReadVariableOp'metrics/acc/div_no_nan/ReadVariableOp_1*
_output_shapes
: *
T0
Y
metrics/acc/IdentityIdentitymetrics/acc/div_no_nan*
T0*
_output_shapes
: 
r
loss/dense_1_loss/Reshape/shapeConst*
valueB:
˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes
:

loss/dense_1_loss/ReshapeReshapeCast_1loss/dense_1_loss/Reshape/shape*
T0*
Tshape0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙

loss/dense_1_loss/CastCastloss/dense_1_loss/Reshape*
Truncate( *

DstT0	*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

SrcT0
r
!loss/dense_1_loss/Reshape_1/shapeConst*
valueB"˙˙˙˙
   *
dtype0*
_output_shapes
:

loss/dense_1_loss/Reshape_1Reshapedense_1/BiasAdd!loss/dense_1_loss/Reshape_1/shape*
T0*
Tshape0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙


;loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/ShapeShapeloss/dense_1_loss/Cast*
T0	*
out_type0*
_output_shapes
:

Yloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits#SparseSoftmaxCrossEntropyWithLogitsloss/dense_1_loss/Reshape_1loss/dense_1_loss/Cast*
T0*
Tlabels0	*6
_output_shapes$
":˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

j
%loss/dense_1_loss/weighted_loss/ConstConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 

Tloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/shapeConst*
valueB *
dtype0*
_output_shapes
: 

Sloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/rankConst*
value	B : *
dtype0*
_output_shapes
: 
ě
Sloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/shapeShapeYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
_output_shapes
:*
T0*
out_type0

Rloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/rankConst*
value	B :*
dtype0*
_output_shapes
: 
j
bloss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOp
ż
Aloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/ShapeShapeYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogitsc^loss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success*
T0*
out_type0*
_output_shapes
:
ë
Aloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/ConstConstc^loss/dense_1_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success*
valueB
 *  ?*
dtype0*
_output_shapes
: 

;loss/dense_1_loss/weighted_loss/broadcast_weights/ones_likeFillAloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/ShapeAloss/dense_1_loss/weighted_loss/broadcast_weights/ones_like/Const*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*

index_type0
Ę
1loss/dense_1_loss/weighted_loss/broadcast_weightsMul%loss/dense_1_loss/weighted_loss/Const;loss/dense_1_loss/weighted_loss/broadcast_weights/ones_like*
T0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
ć
#loss/dense_1_loss/weighted_loss/MulMulYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits1loss/dense_1_loss/weighted_loss/broadcast_weights*
T0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
a
loss/dense_1_loss/ConstConst*
valueB: *
dtype0*
_output_shapes
:

loss/dense_1_loss/SumSum#loss/dense_1_loss/weighted_loss/Mulloss/dense_1_loss/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
|
loss/dense_1_loss/num_elementsSize#loss/dense_1_loss/weighted_loss/Mul*
_output_shapes
: *
T0*
out_type0

#loss/dense_1_loss/num_elements/CastCastloss/dense_1_loss/num_elements*
Truncate( *

DstT0*
_output_shapes
: *

SrcT0
\
loss/dense_1_loss/Const_1Const*
dtype0*
_output_shapes
: *
valueB 

loss/dense_1_loss/Sum_1Sumloss/dense_1_loss/Sumloss/dense_1_loss/Const_1*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 

loss/dense_1_loss/valueDivNoNanloss/dense_1_loss/Sum_1#loss/dense_1_loss/num_elements/Cast*
T0*
_output_shapes
: 
O

loss/mul/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
U
loss/mulMul
loss/mul/xloss/dense_1_loss/value*
T0*
_output_shapes
: 
x
training/gradients/ShapeConst*
_class
loc:@loss/mul*
valueB *
dtype0*
_output_shapes
: 
~
training/gradients/grad_ys_0Const*
_class
loc:@loss/mul*
valueB
 *  ?*
dtype0*
_output_shapes
: 
§
training/gradients/FillFilltraining/gradients/Shapetraining/gradients/grad_ys_0*
T0*
_class
loc:@loss/mul*

index_type0*
_output_shapes
: 

$training/gradients/loss/mul_grad/MulMultraining/gradients/Fillloss/dense_1_loss/value*
T0*
_class
loc:@loss/mul*
_output_shapes
: 

&training/gradients/loss/mul_grad/Mul_1Multraining/gradients/Fill
loss/mul/x*
T0*
_class
loc:@loss/mul*
_output_shapes
: 
¤
5training/gradients/loss/dense_1_loss/value_grad/ShapeConst*
dtype0*
_output_shapes
: **
_class 
loc:@loss/dense_1_loss/value*
valueB 
Ś
7training/gradients/loss/dense_1_loss/value_grad/Shape_1Const**
_class 
loc:@loss/dense_1_loss/value*
valueB *
dtype0*
_output_shapes
: 
ˇ
Etraining/gradients/loss/dense_1_loss/value_grad/BroadcastGradientArgsBroadcastGradientArgs5training/gradients/loss/dense_1_loss/value_grad/Shape7training/gradients/loss/dense_1_loss/value_grad/Shape_1*
T0**
_class 
loc:@loss/dense_1_loss/value*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
ŕ
:training/gradients/loss/dense_1_loss/value_grad/div_no_nanDivNoNan&training/gradients/loss/mul_grad/Mul_1#loss/dense_1_loss/num_elements/Cast*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
§
3training/gradients/loss/dense_1_loss/value_grad/SumSum:training/gradients/loss/dense_1_loss/value_grad/div_no_nanEtraining/gradients/loss/dense_1_loss/value_grad/BroadcastGradientArgs*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: *
	keep_dims( *

Tidx0

7training/gradients/loss/dense_1_loss/value_grad/ReshapeReshape3training/gradients/loss/dense_1_loss/value_grad/Sum5training/gradients/loss/dense_1_loss/value_grad/Shape*
T0**
_class 
loc:@loss/dense_1_loss/value*
Tshape0*
_output_shapes
: 
 
3training/gradients/loss/dense_1_loss/value_grad/NegNegloss/dense_1_loss/Sum_1*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
ď
<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_1DivNoNan3training/gradients/loss/dense_1_loss/value_grad/Neg#loss/dense_1_loss/num_elements/Cast*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
ř
<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_2DivNoNan<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_1#loss/dense_1_loss/num_elements/Cast*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
í
3training/gradients/loss/dense_1_loss/value_grad/mulMul&training/gradients/loss/mul_grad/Mul_1<training/gradients/loss/dense_1_loss/value_grad/div_no_nan_2*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 
¤
5training/gradients/loss/dense_1_loss/value_grad/Sum_1Sum3training/gradients/loss/dense_1_loss/value_grad/mulGtraining/gradients/loss/dense_1_loss/value_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0**
_class 
loc:@loss/dense_1_loss/value*
_output_shapes
: 

9training/gradients/loss/dense_1_loss/value_grad/Reshape_1Reshape5training/gradients/loss/dense_1_loss/value_grad/Sum_17training/gradients/loss/dense_1_loss/value_grad/Shape_1*
T0**
_class 
loc:@loss/dense_1_loss/value*
Tshape0*
_output_shapes
: 
Ź
=training/gradients/loss/dense_1_loss/Sum_1_grad/Reshape/shapeConst**
_class 
loc:@loss/dense_1_loss/Sum_1*
valueB *
dtype0*
_output_shapes
: 

7training/gradients/loss/dense_1_loss/Sum_1_grad/ReshapeReshape7training/gradients/loss/dense_1_loss/value_grad/Reshape=training/gradients/loss/dense_1_loss/Sum_1_grad/Reshape/shape*
_output_shapes
: *
T0**
_class 
loc:@loss/dense_1_loss/Sum_1*
Tshape0
¤
5training/gradients/loss/dense_1_loss/Sum_1_grad/ConstConst**
_class 
loc:@loss/dense_1_loss/Sum_1*
valueB *
dtype0*
_output_shapes
: 

4training/gradients/loss/dense_1_loss/Sum_1_grad/TileTile7training/gradients/loss/dense_1_loss/Sum_1_grad/Reshape5training/gradients/loss/dense_1_loss/Sum_1_grad/Const*

Tmultiples0*
T0**
_class 
loc:@loss/dense_1_loss/Sum_1*
_output_shapes
: 
Ż
;training/gradients/loss/dense_1_loss/Sum_grad/Reshape/shapeConst*(
_class
loc:@loss/dense_1_loss/Sum*
valueB:*
dtype0*
_output_shapes
:

5training/gradients/loss/dense_1_loss/Sum_grad/ReshapeReshape4training/gradients/loss/dense_1_loss/Sum_1_grad/Tile;training/gradients/loss/dense_1_loss/Sum_grad/Reshape/shape*
T0*(
_class
loc:@loss/dense_1_loss/Sum*
Tshape0*
_output_shapes
:
Ŕ
3training/gradients/loss/dense_1_loss/Sum_grad/ShapeShape#loss/dense_1_loss/weighted_loss/Mul*
_output_shapes
:*
T0*(
_class
loc:@loss/dense_1_loss/Sum*
out_type0

2training/gradients/loss/dense_1_loss/Sum_grad/TileTile5training/gradients/loss/dense_1_loss/Sum_grad/Reshape3training/gradients/loss/dense_1_loss/Sum_grad/Shape*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tmultiples0*
T0*(
_class
loc:@loss/dense_1_loss/Sum

Atraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/ShapeShapeYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
out_type0*
_output_shapes
:
ě
Ctraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape_1Shape1loss/dense_1_loss/weighted_loss/broadcast_weights*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
out_type0*
_output_shapes
:
ç
Qtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/ShapeCtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape_1*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙

?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/MulMul2training/gradients/loss/dense_1_loss/Sum_grad/Tile1loss/dense_1_loss/weighted_loss/broadcast_weights*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ň
?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/SumSum?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/MulQtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul
Ć
Ctraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/ReshapeReshape?training/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/SumAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
Tshape0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
˝
Atraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Mul_1MulYloss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits2training/gradients/loss/dense_1_loss/Sum_grad/Tile*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ř
Atraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Sum_1SumAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Mul_1Straining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul
Ě
Etraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Reshape_1ReshapeAtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Sum_1Ctraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Shape_1*
T0*6
_class,
*(loc:@loss/dense_1_loss/weighted_loss/Mul*
Tshape0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
§
training/gradients/zeros_like	ZerosLike[loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

É
training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradientPreventGradient[loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits:1*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*´
message¨ĽCurrently there is no way to take the second derivative of sparse_softmax_cross_entropy_with_logits due to the fused implementation's interaction with tf.gradients()*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits
ş
training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dimConst*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*
valueB :
˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes
: 
ţ
|training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims
ExpandDimsCtraining/gradients/loss/dense_1_loss/weighted_loss/Mul_grad/Reshapetraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDims/dim*

Tdim0*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

utraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mulMul|training/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/ExpandDimstraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/PreventGradient*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
*
T0*l
_classb
`^loc:@loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits
¸
9training/gradients/loss/dense_1_loss/Reshape_1_grad/ShapeShapedense_1/BiasAdd*
T0*.
_class$
" loc:@loss/dense_1_loss/Reshape_1*
out_type0*
_output_shapes
:
č
;training/gradients/loss/dense_1_loss/Reshape_1_grad/ReshapeReshapeutraining/gradients/loss/dense_1_loss/SparseSoftmaxCrossEntropyWithLogits/SparseSoftmaxCrossEntropyWithLogits_grad/mul9training/gradients/loss/dense_1_loss/Reshape_1_grad/Shape*
T0*.
_class$
" loc:@loss/dense_1_loss/Reshape_1*
Tshape0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

ß
3training/gradients/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad;training/gradients/loss/dense_1_loss/Reshape_1_grad/Reshape*
T0*"
_class
loc:@dense_1/BiasAdd*
data_formatNHWC*
_output_shapes
:


-training/gradients/dense_1/MatMul_grad/MatMulMatMul;training/gradients/loss/dense_1_loss/Reshape_1_grad/Reshapedense_1/MatMul/ReadVariableOp*
T0*!
_class
loc:@dense_1/MatMul*
transpose_a( *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_b(

/training/gradients/dense_1/MatMul_grad/MatMul_1MatMuldropout/dropout/mul_1;training/gradients/loss/dense_1_loss/Reshape_1_grad/Reshape*
T0*!
_class
loc:@dense_1/MatMul*
transpose_a(*
_output_shapes
:	
*
transpose_b( 
°
3training/gradients/dropout/dropout/mul_1_grad/ShapeShapedropout/dropout/mul*
T0*(
_class
loc:@dropout/dropout/mul_1*
out_type0*
_output_shapes
:
ł
5training/gradients/dropout/dropout/mul_1_grad/Shape_1Shapedropout/dropout/Cast*
T0*(
_class
loc:@dropout/dropout/mul_1*
out_type0*
_output_shapes
:
Ż
Ctraining/gradients/dropout/dropout/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgs3training/gradients/dropout/dropout/mul_1_grad/Shape5training/gradients/dropout/dropout/mul_1_grad/Shape_1*
T0*(
_class
loc:@dropout/dropout/mul_1*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Ú
1training/gradients/dropout/dropout/mul_1_grad/MulMul-training/gradients/dense_1/MatMul_grad/MatMuldropout/dropout/Cast*
T0*(
_class
loc:@dropout/dropout/mul_1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

1training/gradients/dropout/dropout/mul_1_grad/SumSum1training/gradients/dropout/dropout/mul_1_grad/MulCtraining/gradients/dropout/dropout/mul_1_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*(
_class
loc:@dropout/dropout/mul_1*
_output_shapes
:

5training/gradients/dropout/dropout/mul_1_grad/ReshapeReshape1training/gradients/dropout/dropout/mul_1_grad/Sum3training/gradients/dropout/dropout/mul_1_grad/Shape*
T0*(
_class
loc:@dropout/dropout/mul_1*
Tshape0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ű
3training/gradients/dropout/dropout/mul_1_grad/Mul_1Muldropout/dropout/mul-training/gradients/dense_1/MatMul_grad/MatMul*
T0*(
_class
loc:@dropout/dropout/mul_1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
 
3training/gradients/dropout/dropout/mul_1_grad/Sum_1Sum3training/gradients/dropout/dropout/mul_1_grad/Mul_1Etraining/gradients/dropout/dropout/mul_1_grad/BroadcastGradientArgs:1*
T0*(
_class
loc:@dropout/dropout/mul_1*
_output_shapes
:*
	keep_dims( *

Tidx0

7training/gradients/dropout/dropout/mul_1_grad/Reshape_1Reshape3training/gradients/dropout/dropout/mul_1_grad/Sum_15training/gradients/dropout/dropout/mul_1_grad/Shape_1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*(
_class
loc:@dropout/dropout/mul_1*
Tshape0
Ł
1training/gradients/dropout/dropout/mul_grad/ShapeShape
dense/Relu*
T0*&
_class
loc:@dropout/dropout/mul*
out_type0*
_output_shapes
:

3training/gradients/dropout/dropout/mul_grad/Shape_1Const*
dtype0*
_output_shapes
: *&
_class
loc:@dropout/dropout/mul*
valueB 
§
Atraining/gradients/dropout/dropout/mul_grad/BroadcastGradientArgsBroadcastGradientArgs1training/gradients/dropout/dropout/mul_grad/Shape3training/gradients/dropout/dropout/mul_grad/Shape_1*
T0*&
_class
loc:@dropout/dropout/mul*2
_output_shapes 
:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
á
/training/gradients/dropout/dropout/mul_grad/MulMul5training/gradients/dropout/dropout/mul_1_grad/Reshapedropout/dropout/truediv*
T0*&
_class
loc:@dropout/dropout/mul*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

/training/gradients/dropout/dropout/mul_grad/SumSum/training/gradients/dropout/dropout/mul_grad/MulAtraining/gradients/dropout/dropout/mul_grad/BroadcastGradientArgs*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0*&
_class
loc:@dropout/dropout/mul

3training/gradients/dropout/dropout/mul_grad/ReshapeReshape/training/gradients/dropout/dropout/mul_grad/Sum1training/gradients/dropout/dropout/mul_grad/Shape*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*&
_class
loc:@dropout/dropout/mul*
Tshape0
Ö
1training/gradients/dropout/dropout/mul_grad/Mul_1Mul
dense/Relu5training/gradients/dropout/dropout/mul_1_grad/Reshape*
T0*&
_class
loc:@dropout/dropout/mul*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

1training/gradients/dropout/dropout/mul_grad/Sum_1Sum1training/gradients/dropout/dropout/mul_grad/Mul_1Ctraining/gradients/dropout/dropout/mul_grad/BroadcastGradientArgs:1*
_output_shapes
:*
	keep_dims( *

Tidx0*
T0*&
_class
loc:@dropout/dropout/mul
˙
5training/gradients/dropout/dropout/mul_grad/Reshape_1Reshape1training/gradients/dropout/dropout/mul_grad/Sum_13training/gradients/dropout/dropout/mul_grad/Shape_1*
T0*&
_class
loc:@dropout/dropout/mul*
Tshape0*
_output_shapes
: 
Ę
+training/gradients/dense/Relu_grad/ReluGradReluGrad3training/gradients/dropout/dropout/mul_grad/Reshape
dense/Relu*
T0*
_class
loc:@dense/Relu*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ě
1training/gradients/dense/BiasAdd_grad/BiasAddGradBiasAddGrad+training/gradients/dense/Relu_grad/ReluGrad*
T0* 
_class
loc:@dense/BiasAdd*
data_formatNHWC*
_output_shapes	
:
ů
+training/gradients/dense/MatMul_grad/MatMulMatMul+training/gradients/dense/Relu_grad/ReluGraddense/MatMul/ReadVariableOp*
transpose_b(*
T0*
_class
loc:@dense/MatMul*
transpose_a( *(
_output_shapes
:˙˙˙˙˙˙˙˙˙Ŕ
ç
-training/gradients/dense/MatMul_grad/MatMul_1MatMulflatten/Reshape+training/gradients/dense/Relu_grad/ReluGrad*
T0*
_class
loc:@dense/MatMul*
transpose_a(* 
_output_shapes
:
Ŕ*
transpose_b( 
¨
-training/gradients/flatten/Reshape_grad/ShapeShapemax_pooling2d_1/MaxPool*
T0*"
_class
loc:@flatten/Reshape*
out_type0*
_output_shapes
:

/training/gradients/flatten/Reshape_grad/ReshapeReshape+training/gradients/dense/MatMul_grad/MatMul-training/gradients/flatten/Reshape_grad/Shape*
T0*"
_class
loc:@flatten/Reshape*
Tshape0*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
Ü
;training/gradients/max_pooling2d_1/MaxPool_grad/MaxPoolGradMaxPoolGradconv2d_1/Relumax_pooling2d_1/MaxPool/training/gradients/flatten/Reshape_grad/Reshape*
T0**
_class 
loc:@max_pooling2d_1/MaxPool*
data_formatNHWC*
strides
*
ksize
*
paddingVALID*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
â
.training/gradients/conv2d_1/Relu_grad/ReluGradReluGrad;training/gradients/max_pooling2d_1/MaxPool_grad/MaxPoolGradconv2d_1/Relu*
T0* 
_class
loc:@conv2d_1/Relu*/
_output_shapes
:˙˙˙˙˙˙˙˙˙@
Ô
4training/gradients/conv2d_1/BiasAdd_grad/BiasAddGradBiasAddGrad.training/gradients/conv2d_1/Relu_grad/ReluGrad*
T0*#
_class
loc:@conv2d_1/BiasAdd*
data_formatNHWC*
_output_shapes
:@
×
.training/gradients/conv2d_1/Conv2D_grad/ShapeNShapeNmax_pooling2d/MaxPoolconv2d_1/Conv2D/ReadVariableOp*
T0*"
_class
loc:@conv2d_1/Conv2D*
out_type0*
N* 
_output_shapes
::
ˇ
;training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput.training/gradients/conv2d_1/Conv2D_grad/ShapeNconv2d_1/Conv2D/ReadVariableOp.training/gradients/conv2d_1/Relu_grad/ReluGrad*
strides
*
data_formatNHWC*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ *
	dilations
*
T0*"
_class
loc:@conv2d_1/Conv2D
Š
<training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFiltermax_pooling2d/MaxPool0training/gradients/conv2d_1/Conv2D_grad/ShapeN:1.training/gradients/conv2d_1/Relu_grad/ReluGrad*
	dilations
*
T0*"
_class
loc:@conv2d_1/Conv2D*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
explicit_paddings
 *
paddingSAME*&
_output_shapes
: @
ŕ
9training/gradients/max_pooling2d/MaxPool_grad/MaxPoolGradMaxPoolGradconv2d/Relumax_pooling2d/MaxPool;training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropInput*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ *
T0*(
_class
loc:@max_pooling2d/MaxPool*
strides
*
data_formatNHWC*
ksize
*
paddingVALID
Ú
,training/gradients/conv2d/Relu_grad/ReluGradReluGrad9training/gradients/max_pooling2d/MaxPool_grad/MaxPoolGradconv2d/Relu*
T0*
_class
loc:@conv2d/Relu*/
_output_shapes
:˙˙˙˙˙˙˙˙˙ 
Î
2training/gradients/conv2d/BiasAdd_grad/BiasAddGradBiasAddGrad,training/gradients/conv2d/Relu_grad/ReluGrad*
T0*!
_class
loc:@conv2d/BiasAdd*
data_formatNHWC*
_output_shapes
: 
Ŕ
,training/gradients/conv2d/Conv2D_grad/ShapeNShapeNCastconv2d/Conv2D/ReadVariableOp*
T0* 
_class
loc:@conv2d/Conv2D*
out_type0*
N* 
_output_shapes
::
­
9training/gradients/conv2d/Conv2D_grad/Conv2DBackpropInputConv2DBackpropInput,training/gradients/conv2d/Conv2D_grad/ShapeNconv2d/Conv2D/ReadVariableOp,training/gradients/conv2d/Relu_grad/ReluGrad*
paddingSAME*/
_output_shapes
:˙˙˙˙˙˙˙˙˙*
	dilations
*
T0* 
_class
loc:@conv2d/Conv2D*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
explicit_paddings
 

:training/gradients/conv2d/Conv2D_grad/Conv2DBackpropFilterConv2DBackpropFilterCast.training/gradients/conv2d/Conv2D_grad/ShapeN:1,training/gradients/conv2d/Relu_grad/ReluGrad*&
_output_shapes
: *
	dilations
*
T0* 
_class
loc:@conv2d/Conv2D*
data_formatNHWC*
strides
*
explicit_paddings
 *
use_cudnn_on_gpu(*
paddingSAME
Z
training/AssignAdd/valueConst*
value	B	 R*
dtype0	*
_output_shapes
: 

training/AssignAdd	AssignAddglobal_steptraining/AssignAdd/value*
use_locking( *
T0	*
_class
loc:@global_step*
_output_shapes
: 
|
training/CastCastglobal_step/read^training/AssignAdd*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
: 
_
training/Pow/ReadVariableOpReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
`
training/PowPowtraining/Pow/ReadVariableOptraining/Cast*
T0*
_output_shapes
: 
S
training/sub/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
R
training/subSubtraining/sub/xtraining/Pow*
T0*
_output_shapes
: 
S
training/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
U
training/Const_1Const*
valueB
 *  *
dtype0*
_output_shapes
: 
j
training/clip_by_value/MinimumMinimumtraining/subtraining/Const_1*
T0*
_output_shapes
: 
r
training/clip_by_valueMaximumtraining/clip_by_value/Minimumtraining/Const*
T0*
_output_shapes
: 
N
training/SqrtSqrttraining/clip_by_value*
_output_shapes
: *
T0
a
training/Pow_1/ReadVariableOpReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
d
training/Pow_1Powtraining/Pow_1/ReadVariableOptraining/Cast*
_output_shapes
: *
T0
U
training/sub_1/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
X
training/sub_1Subtraining/sub_1/xtraining/Pow_1*
_output_shapes
: *
T0
[
training/truedivRealDivtraining/Sqrttraining/sub_1*
T0*
_output_shapes
: 
W
training/ReadVariableOpReadVariableOpAdam/lr*
dtype0*
_output_shapes
: 
_
training/mulMultraining/ReadVariableOptraining/truediv*
_output_shapes
: *
T0
s
training/zerosConst*%
valueB *    *
dtype0*&
_output_shapes
: 
˝
training/VariableVarHandleOp*
dtype0*
_output_shapes
: *"
shared_nametraining/Variable*$
_class
loc:@training/Variable*
	container *
shape: 
s
2training/Variable/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable*
_output_shapes
: 

training/Variable/AssignAssignVariableOptraining/Variabletraining/zeros*
dtype0*$
_class
loc:@training/Variable
Ľ
%training/Variable/Read/ReadVariableOpReadVariableOptraining/Variable*$
_class
loc:@training/Variable*
dtype0*&
_output_shapes
: 
]
training/zeros_1Const*
valueB *    *
dtype0*
_output_shapes
: 
ˇ
training/Variable_1VarHandleOp*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_1*&
_class
loc:@training/Variable_1*
	container *
shape: 
w
4training/Variable_1/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_1*
_output_shapes
: 

training/Variable_1/AssignAssignVariableOptraining/Variable_1training/zeros_1*&
_class
loc:@training/Variable_1*
dtype0

'training/Variable_1/Read/ReadVariableOpReadVariableOptraining/Variable_1*&
_class
loc:@training/Variable_1*
dtype0*
_output_shapes
: 
y
 training/zeros_2/shape_as_tensorConst*%
valueB"          @   *
dtype0*
_output_shapes
:
[
training/zeros_2/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_2Fill training/zeros_2/shape_as_tensortraining/zeros_2/Const*
T0*

index_type0*&
_output_shapes
: @
Ă
training/Variable_2VarHandleOp*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_2*&
_class
loc:@training/Variable_2*
	container *
shape: @
w
4training/Variable_2/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_2*
_output_shapes
: 

training/Variable_2/AssignAssignVariableOptraining/Variable_2training/zeros_2*&
_class
loc:@training/Variable_2*
dtype0
Ť
'training/Variable_2/Read/ReadVariableOpReadVariableOptraining/Variable_2*&
_class
loc:@training/Variable_2*
dtype0*&
_output_shapes
: @
]
training/zeros_3Const*
dtype0*
_output_shapes
:@*
valueB@*    
ˇ
training/Variable_3VarHandleOp*
shape:@*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_3*&
_class
loc:@training/Variable_3*
	container 
w
4training/Variable_3/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_3*
_output_shapes
: 

training/Variable_3/AssignAssignVariableOptraining/Variable_3training/zeros_3*
dtype0*&
_class
loc:@training/Variable_3

'training/Variable_3/Read/ReadVariableOpReadVariableOptraining/Variable_3*&
_class
loc:@training/Variable_3*
dtype0*
_output_shapes
:@
q
 training/zeros_4/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB"@     
[
training/zeros_4/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_4Fill training/zeros_4/shape_as_tensortraining/zeros_4/Const*
T0*

index_type0* 
_output_shapes
:
Ŕ
˝
training/Variable_4VarHandleOp*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_4*&
_class
loc:@training/Variable_4*
	container *
shape:
Ŕ
w
4training/Variable_4/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_4*
_output_shapes
: 

training/Variable_4/AssignAssignVariableOptraining/Variable_4training/zeros_4*&
_class
loc:@training/Variable_4*
dtype0
Ľ
'training/Variable_4/Read/ReadVariableOpReadVariableOptraining/Variable_4*&
_class
loc:@training/Variable_4*
dtype0* 
_output_shapes
:
Ŕ
k
 training/zeros_5/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
[
training/zeros_5/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_5Fill training/zeros_5/shape_as_tensortraining/zeros_5/Const*
T0*

index_type0*
_output_shapes	
:
¸
training/Variable_5VarHandleOp*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_5*&
_class
loc:@training/Variable_5*
	container *
shape:
w
4training/Variable_5/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_5*
_output_shapes
: 

training/Variable_5/AssignAssignVariableOptraining/Variable_5training/zeros_5*&
_class
loc:@training/Variable_5*
dtype0
 
'training/Variable_5/Read/ReadVariableOpReadVariableOptraining/Variable_5*
dtype0*
_output_shapes	
:*&
_class
loc:@training/Variable_5
q
 training/zeros_6/shape_as_tensorConst*
valueB"   
   *
dtype0*
_output_shapes
:
[
training/zeros_6/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_6Fill training/zeros_6/shape_as_tensortraining/zeros_6/Const*
T0*

index_type0*
_output_shapes
:	

ź
training/Variable_6VarHandleOp*$
shared_nametraining/Variable_6*&
_class
loc:@training/Variable_6*
	container *
shape:	
*
dtype0*
_output_shapes
: 
w
4training/Variable_6/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_6*
_output_shapes
: 

training/Variable_6/AssignAssignVariableOptraining/Variable_6training/zeros_6*
dtype0*&
_class
loc:@training/Variable_6
¤
'training/Variable_6/Read/ReadVariableOpReadVariableOptraining/Variable_6*&
_class
loc:@training/Variable_6*
dtype0*
_output_shapes
:	

]
training/zeros_7Const*
valueB
*    *
dtype0*
_output_shapes
:

ˇ
training/Variable_7VarHandleOp*$
shared_nametraining/Variable_7*&
_class
loc:@training/Variable_7*
	container *
shape:
*
dtype0*
_output_shapes
: 
w
4training/Variable_7/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_7*
_output_shapes
: 

training/Variable_7/AssignAssignVariableOptraining/Variable_7training/zeros_7*&
_class
loc:@training/Variable_7*
dtype0

'training/Variable_7/Read/ReadVariableOpReadVariableOptraining/Variable_7*&
_class
loc:@training/Variable_7*
dtype0*
_output_shapes
:

u
training/zeros_8Const*%
valueB *    *
dtype0*&
_output_shapes
: 
Ă
training/Variable_8VarHandleOp*
dtype0*
_output_shapes
: *$
shared_nametraining/Variable_8*&
_class
loc:@training/Variable_8*
	container *
shape: 
w
4training/Variable_8/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_8*
_output_shapes
: 

training/Variable_8/AssignAssignVariableOptraining/Variable_8training/zeros_8*
dtype0*&
_class
loc:@training/Variable_8
Ť
'training/Variable_8/Read/ReadVariableOpReadVariableOptraining/Variable_8*&
_class
loc:@training/Variable_8*
dtype0*&
_output_shapes
: 
]
training/zeros_9Const*
valueB *    *
dtype0*
_output_shapes
: 
ˇ
training/Variable_9VarHandleOp*$
shared_nametraining/Variable_9*&
_class
loc:@training/Variable_9*
	container *
shape: *
dtype0*
_output_shapes
: 
w
4training/Variable_9/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_9*
_output_shapes
: 

training/Variable_9/AssignAssignVariableOptraining/Variable_9training/zeros_9*&
_class
loc:@training/Variable_9*
dtype0

'training/Variable_9/Read/ReadVariableOpReadVariableOptraining/Variable_9*
dtype0*
_output_shapes
: *&
_class
loc:@training/Variable_9
z
!training/zeros_10/shape_as_tensorConst*
dtype0*
_output_shapes
:*%
valueB"          @   
\
training/zeros_10/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_10Fill!training/zeros_10/shape_as_tensortraining/zeros_10/Const*
T0*

index_type0*&
_output_shapes
: @
Ć
training/Variable_10VarHandleOp*
	container *
shape: @*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_10*'
_class
loc:@training/Variable_10
y
5training/Variable_10/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_10*
_output_shapes
: 

training/Variable_10/AssignAssignVariableOptraining/Variable_10training/zeros_10*'
_class
loc:@training/Variable_10*
dtype0
Ž
(training/Variable_10/Read/ReadVariableOpReadVariableOptraining/Variable_10*'
_class
loc:@training/Variable_10*
dtype0*&
_output_shapes
: @
^
training/zeros_11Const*
valueB@*    *
dtype0*
_output_shapes
:@
ş
training/Variable_11VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_11*'
_class
loc:@training/Variable_11*
	container *
shape:@
y
5training/Variable_11/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_11*
_output_shapes
: 

training/Variable_11/AssignAssignVariableOptraining/Variable_11training/zeros_11*
dtype0*'
_class
loc:@training/Variable_11
˘
(training/Variable_11/Read/ReadVariableOpReadVariableOptraining/Variable_11*'
_class
loc:@training/Variable_11*
dtype0*
_output_shapes
:@
r
!training/zeros_12/shape_as_tensorConst*
valueB"@     *
dtype0*
_output_shapes
:
\
training/zeros_12/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_12Fill!training/zeros_12/shape_as_tensortraining/zeros_12/Const*
T0*

index_type0* 
_output_shapes
:
Ŕ
Ŕ
training/Variable_12VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_12*'
_class
loc:@training/Variable_12*
	container *
shape:
Ŕ
y
5training/Variable_12/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_12*
_output_shapes
: 

training/Variable_12/AssignAssignVariableOptraining/Variable_12training/zeros_12*'
_class
loc:@training/Variable_12*
dtype0
¨
(training/Variable_12/Read/ReadVariableOpReadVariableOptraining/Variable_12*'
_class
loc:@training/Variable_12*
dtype0* 
_output_shapes
:
Ŕ
l
!training/zeros_13/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_13/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_13Fill!training/zeros_13/shape_as_tensortraining/zeros_13/Const*
T0*

index_type0*
_output_shapes	
:
ť
training/Variable_13VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_13*'
_class
loc:@training/Variable_13*
	container *
shape:
y
5training/Variable_13/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_13*
_output_shapes
: 

training/Variable_13/AssignAssignVariableOptraining/Variable_13training/zeros_13*'
_class
loc:@training/Variable_13*
dtype0
Ł
(training/Variable_13/Read/ReadVariableOpReadVariableOptraining/Variable_13*'
_class
loc:@training/Variable_13*
dtype0*
_output_shapes	
:
r
!training/zeros_14/shape_as_tensorConst*
valueB"   
   *
dtype0*
_output_shapes
:
\
training/zeros_14/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_14Fill!training/zeros_14/shape_as_tensortraining/zeros_14/Const*
T0*

index_type0*
_output_shapes
:	

ż
training/Variable_14VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_14*'
_class
loc:@training/Variable_14*
	container *
shape:	

y
5training/Variable_14/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_14*
_output_shapes
: 

training/Variable_14/AssignAssignVariableOptraining/Variable_14training/zeros_14*'
_class
loc:@training/Variable_14*
dtype0
§
(training/Variable_14/Read/ReadVariableOpReadVariableOptraining/Variable_14*'
_class
loc:@training/Variable_14*
dtype0*
_output_shapes
:	

^
training/zeros_15Const*
valueB
*    *
dtype0*
_output_shapes
:

ş
training/Variable_15VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_15*'
_class
loc:@training/Variable_15*
	container *
shape:

y
5training/Variable_15/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_15*
_output_shapes
: 

training/Variable_15/AssignAssignVariableOptraining/Variable_15training/zeros_15*
dtype0*'
_class
loc:@training/Variable_15
˘
(training/Variable_15/Read/ReadVariableOpReadVariableOptraining/Variable_15*'
_class
loc:@training/Variable_15*
dtype0*
_output_shapes
:

k
!training/zeros_16/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_16/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_16Fill!training/zeros_16/shape_as_tensortraining/zeros_16/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_16VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_16*'
_class
loc:@training/Variable_16*
	container *
shape:
y
5training/Variable_16/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_16*
_output_shapes
: 

training/Variable_16/AssignAssignVariableOptraining/Variable_16training/zeros_16*
dtype0*'
_class
loc:@training/Variable_16
˘
(training/Variable_16/Read/ReadVariableOpReadVariableOptraining/Variable_16*'
_class
loc:@training/Variable_16*
dtype0*
_output_shapes
:
k
!training/zeros_17/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_17/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_17Fill!training/zeros_17/shape_as_tensortraining/zeros_17/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_17VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_17*'
_class
loc:@training/Variable_17*
	container *
shape:
y
5training/Variable_17/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_17*
_output_shapes
: 

training/Variable_17/AssignAssignVariableOptraining/Variable_17training/zeros_17*'
_class
loc:@training/Variable_17*
dtype0
˘
(training/Variable_17/Read/ReadVariableOpReadVariableOptraining/Variable_17*'
_class
loc:@training/Variable_17*
dtype0*
_output_shapes
:
k
!training/zeros_18/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_18/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_18Fill!training/zeros_18/shape_as_tensortraining/zeros_18/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_18VarHandleOp*'
_class
loc:@training/Variable_18*
	container *
shape:*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_18
y
5training/Variable_18/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_18*
_output_shapes
: 

training/Variable_18/AssignAssignVariableOptraining/Variable_18training/zeros_18*'
_class
loc:@training/Variable_18*
dtype0
˘
(training/Variable_18/Read/ReadVariableOpReadVariableOptraining/Variable_18*'
_class
loc:@training/Variable_18*
dtype0*
_output_shapes
:
k
!training/zeros_19/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_19/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_19Fill!training/zeros_19/shape_as_tensortraining/zeros_19/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_19VarHandleOp*%
shared_nametraining/Variable_19*'
_class
loc:@training/Variable_19*
	container *
shape:*
dtype0*
_output_shapes
: 
y
5training/Variable_19/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_19*
_output_shapes
: 

training/Variable_19/AssignAssignVariableOptraining/Variable_19training/zeros_19*'
_class
loc:@training/Variable_19*
dtype0
˘
(training/Variable_19/Read/ReadVariableOpReadVariableOptraining/Variable_19*'
_class
loc:@training/Variable_19*
dtype0*
_output_shapes
:
k
!training/zeros_20/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB:
\
training/zeros_20/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_20Fill!training/zeros_20/shape_as_tensortraining/zeros_20/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_20VarHandleOp*'
_class
loc:@training/Variable_20*
	container *
shape:*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_20
y
5training/Variable_20/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_20*
_output_shapes
: 

training/Variable_20/AssignAssignVariableOptraining/Variable_20training/zeros_20*'
_class
loc:@training/Variable_20*
dtype0
˘
(training/Variable_20/Read/ReadVariableOpReadVariableOptraining/Variable_20*'
_class
loc:@training/Variable_20*
dtype0*
_output_shapes
:
k
!training/zeros_21/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_21/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

training/zeros_21Fill!training/zeros_21/shape_as_tensortraining/zeros_21/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_21VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_21*'
_class
loc:@training/Variable_21*
	container *
shape:
y
5training/Variable_21/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_21*
_output_shapes
: 

training/Variable_21/AssignAssignVariableOptraining/Variable_21training/zeros_21*'
_class
loc:@training/Variable_21*
dtype0
˘
(training/Variable_21/Read/ReadVariableOpReadVariableOptraining/Variable_21*
dtype0*
_output_shapes
:*'
_class
loc:@training/Variable_21
k
!training/zeros_22/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
\
training/zeros_22/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_22Fill!training/zeros_22/shape_as_tensortraining/zeros_22/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_22VarHandleOp*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_22*'
_class
loc:@training/Variable_22*
	container *
shape:
y
5training/Variable_22/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_22*
_output_shapes
: 

training/Variable_22/AssignAssignVariableOptraining/Variable_22training/zeros_22*'
_class
loc:@training/Variable_22*
dtype0
˘
(training/Variable_22/Read/ReadVariableOpReadVariableOptraining/Variable_22*'
_class
loc:@training/Variable_22*
dtype0*
_output_shapes
:
k
!training/zeros_23/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB:
\
training/zeros_23/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

training/zeros_23Fill!training/zeros_23/shape_as_tensortraining/zeros_23/Const*
T0*

index_type0*
_output_shapes
:
ş
training/Variable_23VarHandleOp*
	container *
shape:*
dtype0*
_output_shapes
: *%
shared_nametraining/Variable_23*'
_class
loc:@training/Variable_23
y
5training/Variable_23/IsInitialized/VarIsInitializedOpVarIsInitializedOptraining/Variable_23*
_output_shapes
: 

training/Variable_23/AssignAssignVariableOptraining/Variable_23training/zeros_23*'
_class
loc:@training/Variable_23*
dtype0
˘
(training/Variable_23/Read/ReadVariableOpReadVariableOptraining/Variable_23*'
_class
loc:@training/Variable_23*
dtype0*
_output_shapes
:
]
training/ReadVariableOp_1ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
w
training/mul_1/ReadVariableOpReadVariableOptraining/Variable*
dtype0*&
_output_shapes
: 

training/mul_1Multraining/ReadVariableOp_1training/mul_1/ReadVariableOp*
T0*&
_output_shapes
: 
]
training/ReadVariableOp_2ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
U
training/sub_2/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
c
training/sub_2Subtraining/sub_2/xtraining/ReadVariableOp_2*
T0*
_output_shapes
: 

training/mul_2Multraining/sub_2:training/gradients/conv2d/Conv2D_grad/Conv2DBackpropFilter*
T0*&
_output_shapes
: 
d
training/addAddtraining/mul_1training/mul_2*
T0*&
_output_shapes
: 
]
training/ReadVariableOp_3ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
y
training/mul_3/ReadVariableOpReadVariableOptraining/Variable_8*
dtype0*&
_output_shapes
: 

training/mul_3Multraining/ReadVariableOp_3training/mul_3/ReadVariableOp*
T0*&
_output_shapes
: 
]
training/ReadVariableOp_4ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
U
training/sub_3/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
c
training/sub_3Subtraining/sub_3/xtraining/ReadVariableOp_4*
_output_shapes
: *
T0

training/SquareSquare:training/gradients/conv2d/Conv2D_grad/Conv2DBackpropFilter*&
_output_shapes
: *
T0
g
training/mul_4Multraining/sub_3training/Square*
T0*&
_output_shapes
: 
f
training/add_1Addtraining/mul_3training/mul_4*
T0*&
_output_shapes
: 
b
training/mul_5Multraining/multraining/add*
T0*&
_output_shapes
: 
U
training/Const_2Const*
valueB
 *    *
dtype0*
_output_shapes
: 
U
training/Const_3Const*
valueB
 *  *
dtype0*
_output_shapes
: 
~
 training/clip_by_value_1/MinimumMinimumtraining/add_1training/Const_3*&
_output_shapes
: *
T0

training/clip_by_value_1Maximum training/clip_by_value_1/Minimumtraining/Const_2*&
_output_shapes
: *
T0
b
training/Sqrt_1Sqrttraining/clip_by_value_1*&
_output_shapes
: *
T0
U
training/add_2/yConst*
dtype0*
_output_shapes
: *
valueB
 *żÖ3
i
training/add_2Addtraining/Sqrt_1training/add_2/y*
T0*&
_output_shapes
: 
n
training/truediv_1RealDivtraining/mul_5training/add_2*
T0*&
_output_shapes
: 
o
training/ReadVariableOp_5ReadVariableOpconv2d/kernel*
dtype0*&
_output_shapes
: 
u
training/sub_4Subtraining/ReadVariableOp_5training/truediv_1*
T0*&
_output_shapes
: 
[
training/AssignVariableOpAssignVariableOptraining/Variabletraining/add*
dtype0

training/ReadVariableOp_6ReadVariableOptraining/Variable^training/AssignVariableOp*
dtype0*&
_output_shapes
: 
a
training/AssignVariableOp_1AssignVariableOptraining/Variable_8training/add_1*
dtype0

training/ReadVariableOp_7ReadVariableOptraining/Variable_8^training/AssignVariableOp_1*
dtype0*&
_output_shapes
: 
[
training/AssignVariableOp_2AssignVariableOpconv2d/kerneltraining/sub_4*
dtype0

training/ReadVariableOp_8ReadVariableOpconv2d/kernel^training/AssignVariableOp_2*
dtype0*&
_output_shapes
: 
]
training/ReadVariableOp_9ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
m
training/mul_6/ReadVariableOpReadVariableOptraining/Variable_1*
dtype0*
_output_shapes
: 
t
training/mul_6Multraining/ReadVariableOp_9training/mul_6/ReadVariableOp*
T0*
_output_shapes
: 
^
training/ReadVariableOp_10ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
U
training/sub_5/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
d
training/sub_5Subtraining/sub_5/xtraining/ReadVariableOp_10*
_output_shapes
: *
T0
~
training/mul_7Multraining/sub_52training/gradients/conv2d/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
: 
Z
training/add_3Addtraining/mul_6training/mul_7*
T0*
_output_shapes
: 
^
training/ReadVariableOp_11ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
m
training/mul_8/ReadVariableOpReadVariableOptraining/Variable_9*
dtype0*
_output_shapes
: 
u
training/mul_8Multraining/ReadVariableOp_11training/mul_8/ReadVariableOp*
T0*
_output_shapes
: 
^
training/ReadVariableOp_12ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
U
training/sub_6/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
d
training/sub_6Subtraining/sub_6/xtraining/ReadVariableOp_12*
_output_shapes
: *
T0
t
training/Square_1Square2training/gradients/conv2d/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
: 
]
training/mul_9Multraining/sub_6training/Square_1*
T0*
_output_shapes
: 
Z
training/add_4Addtraining/mul_8training/mul_9*
T0*
_output_shapes
: 
Y
training/mul_10Multraining/multraining/add_3*
T0*
_output_shapes
: 
U
training/Const_4Const*
dtype0*
_output_shapes
: *
valueB
 *    
U
training/Const_5Const*
valueB
 *  *
dtype0*
_output_shapes
: 
r
 training/clip_by_value_2/MinimumMinimumtraining/add_4training/Const_5*
_output_shapes
: *
T0
|
training/clip_by_value_2Maximum training/clip_by_value_2/Minimumtraining/Const_4*
T0*
_output_shapes
: 
V
training/Sqrt_2Sqrttraining/clip_by_value_2*
T0*
_output_shapes
: 
U
training/add_5/yConst*
dtype0*
_output_shapes
: *
valueB
 *żÖ3
]
training/add_5Addtraining/Sqrt_2training/add_5/y*
_output_shapes
: *
T0
c
training/truediv_2RealDivtraining/mul_10training/add_5*
T0*
_output_shapes
: 
b
training/ReadVariableOp_13ReadVariableOpconv2d/bias*
dtype0*
_output_shapes
: 
j
training/sub_7Subtraining/ReadVariableOp_13training/truediv_2*
T0*
_output_shapes
: 
a
training/AssignVariableOp_3AssignVariableOptraining/Variable_1training/add_3*
dtype0

training/ReadVariableOp_14ReadVariableOptraining/Variable_1^training/AssignVariableOp_3*
dtype0*
_output_shapes
: 
a
training/AssignVariableOp_4AssignVariableOptraining/Variable_9training/add_4*
dtype0

training/ReadVariableOp_15ReadVariableOptraining/Variable_9^training/AssignVariableOp_4*
dtype0*
_output_shapes
: 
Y
training/AssignVariableOp_5AssignVariableOpconv2d/biastraining/sub_7*
dtype0

training/ReadVariableOp_16ReadVariableOpconv2d/bias^training/AssignVariableOp_5*
dtype0*
_output_shapes
: 
^
training/ReadVariableOp_17ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
z
training/mul_11/ReadVariableOpReadVariableOptraining/Variable_2*
dtype0*&
_output_shapes
: @

training/mul_11Multraining/ReadVariableOp_17training/mul_11/ReadVariableOp*&
_output_shapes
: @*
T0
^
training/ReadVariableOp_18ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
U
training/sub_8/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
d
training/sub_8Subtraining/sub_8/xtraining/ReadVariableOp_18*
T0*
_output_shapes
: 

training/mul_12Multraining/sub_8<training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropFilter*
T0*&
_output_shapes
: @
h
training/add_6Addtraining/mul_11training/mul_12*
T0*&
_output_shapes
: @
^
training/ReadVariableOp_19ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
{
training/mul_13/ReadVariableOpReadVariableOptraining/Variable_10*
dtype0*&
_output_shapes
: @

training/mul_13Multraining/ReadVariableOp_19training/mul_13/ReadVariableOp*&
_output_shapes
: @*
T0
^
training/ReadVariableOp_20ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
U
training/sub_9/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
d
training/sub_9Subtraining/sub_9/xtraining/ReadVariableOp_20*
T0*
_output_shapes
: 

training/Square_2Square<training/gradients/conv2d_1/Conv2D_grad/Conv2DBackpropFilter*
T0*&
_output_shapes
: @
j
training/mul_14Multraining/sub_9training/Square_2*
T0*&
_output_shapes
: @
h
training/add_7Addtraining/mul_13training/mul_14*
T0*&
_output_shapes
: @
e
training/mul_15Multraining/multraining/add_6*&
_output_shapes
: @*
T0
U
training/Const_6Const*
dtype0*
_output_shapes
: *
valueB
 *    
U
training/Const_7Const*
valueB
 *  *
dtype0*
_output_shapes
: 
~
 training/clip_by_value_3/MinimumMinimumtraining/add_7training/Const_7*
T0*&
_output_shapes
: @

training/clip_by_value_3Maximum training/clip_by_value_3/Minimumtraining/Const_6*
T0*&
_output_shapes
: @
b
training/Sqrt_3Sqrttraining/clip_by_value_3*&
_output_shapes
: @*
T0
U
training/add_8/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
i
training/add_8Addtraining/Sqrt_3training/add_8/y*
T0*&
_output_shapes
: @
o
training/truediv_3RealDivtraining/mul_15training/add_8*
T0*&
_output_shapes
: @
r
training/ReadVariableOp_21ReadVariableOpconv2d_1/kernel*
dtype0*&
_output_shapes
: @
w
training/sub_10Subtraining/ReadVariableOp_21training/truediv_3*
T0*&
_output_shapes
: @
a
training/AssignVariableOp_6AssignVariableOptraining/Variable_2training/add_6*
dtype0

training/ReadVariableOp_22ReadVariableOptraining/Variable_2^training/AssignVariableOp_6*
dtype0*&
_output_shapes
: @
b
training/AssignVariableOp_7AssignVariableOptraining/Variable_10training/add_7*
dtype0

training/ReadVariableOp_23ReadVariableOptraining/Variable_10^training/AssignVariableOp_7*
dtype0*&
_output_shapes
: @
^
training/AssignVariableOp_8AssignVariableOpconv2d_1/kerneltraining/sub_10*
dtype0

training/ReadVariableOp_24ReadVariableOpconv2d_1/kernel^training/AssignVariableOp_8*
dtype0*&
_output_shapes
: @
^
training/ReadVariableOp_25ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
n
training/mul_16/ReadVariableOpReadVariableOptraining/Variable_3*
dtype0*
_output_shapes
:@
w
training/mul_16Multraining/ReadVariableOp_25training/mul_16/ReadVariableOp*
T0*
_output_shapes
:@
^
training/ReadVariableOp_26ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_11/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
f
training/sub_11Subtraining/sub_11/xtraining/ReadVariableOp_26*
T0*
_output_shapes
: 

training/mul_17Multraining/sub_114training/gradients/conv2d_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:@
\
training/add_9Addtraining/mul_16training/mul_17*
_output_shapes
:@*
T0
^
training/ReadVariableOp_27ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
o
training/mul_18/ReadVariableOpReadVariableOptraining/Variable_11*
dtype0*
_output_shapes
:@
w
training/mul_18Multraining/ReadVariableOp_27training/mul_18/ReadVariableOp*
T0*
_output_shapes
:@
^
training/ReadVariableOp_28ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_12/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_12Subtraining/sub_12/xtraining/ReadVariableOp_28*
T0*
_output_shapes
: 
v
training/Square_3Square4training/gradients/conv2d_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:@
_
training/mul_19Multraining/sub_12training/Square_3*
_output_shapes
:@*
T0
]
training/add_10Addtraining/mul_18training/mul_19*
_output_shapes
:@*
T0
Y
training/mul_20Multraining/multraining/add_9*
T0*
_output_shapes
:@
U
training/Const_8Const*
valueB
 *    *
dtype0*
_output_shapes
: 
U
training/Const_9Const*
dtype0*
_output_shapes
: *
valueB
 *  
s
 training/clip_by_value_4/MinimumMinimumtraining/add_10training/Const_9*
T0*
_output_shapes
:@
|
training/clip_by_value_4Maximum training/clip_by_value_4/Minimumtraining/Const_8*
T0*
_output_shapes
:@
V
training/Sqrt_4Sqrttraining/clip_by_value_4*
_output_shapes
:@*
T0
V
training/add_11/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
_
training/add_11Addtraining/Sqrt_4training/add_11/y*
T0*
_output_shapes
:@
d
training/truediv_4RealDivtraining/mul_20training/add_11*
_output_shapes
:@*
T0
d
training/ReadVariableOp_29ReadVariableOpconv2d_1/bias*
dtype0*
_output_shapes
:@
k
training/sub_13Subtraining/ReadVariableOp_29training/truediv_4*
T0*
_output_shapes
:@
a
training/AssignVariableOp_9AssignVariableOptraining/Variable_3training/add_9*
dtype0

training/ReadVariableOp_30ReadVariableOptraining/Variable_3^training/AssignVariableOp_9*
dtype0*
_output_shapes
:@
d
training/AssignVariableOp_10AssignVariableOptraining/Variable_11training/add_10*
dtype0

training/ReadVariableOp_31ReadVariableOptraining/Variable_11^training/AssignVariableOp_10*
dtype0*
_output_shapes
:@
]
training/AssignVariableOp_11AssignVariableOpconv2d_1/biastraining/sub_13*
dtype0

training/ReadVariableOp_32ReadVariableOpconv2d_1/bias^training/AssignVariableOp_11*
dtype0*
_output_shapes
:@
^
training/ReadVariableOp_33ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
t
training/mul_21/ReadVariableOpReadVariableOptraining/Variable_4*
dtype0* 
_output_shapes
:
Ŕ
}
training/mul_21Multraining/ReadVariableOp_33training/mul_21/ReadVariableOp*
T0* 
_output_shapes
:
Ŕ
^
training/ReadVariableOp_34ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_14/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_14Subtraining/sub_14/xtraining/ReadVariableOp_34*
T0*
_output_shapes
: 

training/mul_22Multraining/sub_14-training/gradients/dense/MatMul_grad/MatMul_1*
T0* 
_output_shapes
:
Ŕ
c
training/add_12Addtraining/mul_21training/mul_22* 
_output_shapes
:
Ŕ*
T0
^
training/ReadVariableOp_35ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
u
training/mul_23/ReadVariableOpReadVariableOptraining/Variable_12*
dtype0* 
_output_shapes
:
Ŕ
}
training/mul_23Multraining/ReadVariableOp_35training/mul_23/ReadVariableOp*
T0* 
_output_shapes
:
Ŕ
^
training/ReadVariableOp_36ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_15/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_15Subtraining/sub_15/xtraining/ReadVariableOp_36*
T0*
_output_shapes
: 
u
training/Square_4Square-training/gradients/dense/MatMul_grad/MatMul_1*
T0* 
_output_shapes
:
Ŕ
e
training/mul_24Multraining/sub_15training/Square_4*
T0* 
_output_shapes
:
Ŕ
c
training/add_13Addtraining/mul_23training/mul_24*
T0* 
_output_shapes
:
Ŕ
`
training/mul_25Multraining/multraining/add_12*
T0* 
_output_shapes
:
Ŕ
V
training/Const_10Const*
valueB
 *    *
dtype0*
_output_shapes
: 
V
training/Const_11Const*
dtype0*
_output_shapes
: *
valueB
 *  
z
 training/clip_by_value_5/MinimumMinimumtraining/add_13training/Const_11*
T0* 
_output_shapes
:
Ŕ

training/clip_by_value_5Maximum training/clip_by_value_5/Minimumtraining/Const_10*
T0* 
_output_shapes
:
Ŕ
\
training/Sqrt_5Sqrttraining/clip_by_value_5*
T0* 
_output_shapes
:
Ŕ
V
training/add_14/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
e
training/add_14Addtraining/Sqrt_5training/add_14/y* 
_output_shapes
:
Ŕ*
T0
j
training/truediv_5RealDivtraining/mul_25training/add_14*
T0* 
_output_shapes
:
Ŕ
i
training/ReadVariableOp_37ReadVariableOpdense/kernel*
dtype0* 
_output_shapes
:
Ŕ
q
training/sub_16Subtraining/ReadVariableOp_37training/truediv_5*
T0* 
_output_shapes
:
Ŕ
c
training/AssignVariableOp_12AssignVariableOptraining/Variable_4training/add_12*
dtype0

training/ReadVariableOp_38ReadVariableOptraining/Variable_4^training/AssignVariableOp_12*
dtype0* 
_output_shapes
:
Ŕ
d
training/AssignVariableOp_13AssignVariableOptraining/Variable_12training/add_13*
dtype0

training/ReadVariableOp_39ReadVariableOptraining/Variable_12^training/AssignVariableOp_13*
dtype0* 
_output_shapes
:
Ŕ
\
training/AssignVariableOp_14AssignVariableOpdense/kerneltraining/sub_16*
dtype0

training/ReadVariableOp_40ReadVariableOpdense/kernel^training/AssignVariableOp_14*
dtype0* 
_output_shapes
:
Ŕ
^
training/ReadVariableOp_41ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
o
training/mul_26/ReadVariableOpReadVariableOptraining/Variable_5*
dtype0*
_output_shapes	
:
x
training/mul_26Multraining/ReadVariableOp_41training/mul_26/ReadVariableOp*
T0*
_output_shapes	
:
^
training/ReadVariableOp_42ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_17/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
f
training/sub_17Subtraining/sub_17/xtraining/ReadVariableOp_42*
T0*
_output_shapes
: 

training/mul_27Multraining/sub_171training/gradients/dense/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:
^
training/add_15Addtraining/mul_26training/mul_27*
_output_shapes	
:*
T0
^
training/ReadVariableOp_43ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
p
training/mul_28/ReadVariableOpReadVariableOptraining/Variable_13*
dtype0*
_output_shapes	
:
x
training/mul_28Multraining/ReadVariableOp_43training/mul_28/ReadVariableOp*
T0*
_output_shapes	
:
^
training/ReadVariableOp_44ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_18/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
f
training/sub_18Subtraining/sub_18/xtraining/ReadVariableOp_44*
T0*
_output_shapes
: 
t
training/Square_5Square1training/gradients/dense/BiasAdd_grad/BiasAddGrad*
_output_shapes	
:*
T0
`
training/mul_29Multraining/sub_18training/Square_5*
T0*
_output_shapes	
:
^
training/add_16Addtraining/mul_28training/mul_29*
T0*
_output_shapes	
:
[
training/mul_30Multraining/multraining/add_15*
T0*
_output_shapes	
:
V
training/Const_12Const*
valueB
 *    *
dtype0*
_output_shapes
: 
V
training/Const_13Const*
valueB
 *  *
dtype0*
_output_shapes
: 
u
 training/clip_by_value_6/MinimumMinimumtraining/add_16training/Const_13*
T0*
_output_shapes	
:
~
training/clip_by_value_6Maximum training/clip_by_value_6/Minimumtraining/Const_12*
_output_shapes	
:*
T0
W
training/Sqrt_6Sqrttraining/clip_by_value_6*
_output_shapes	
:*
T0
V
training/add_17/yConst*
dtype0*
_output_shapes
: *
valueB
 *żÖ3
`
training/add_17Addtraining/Sqrt_6training/add_17/y*
T0*
_output_shapes	
:
e
training/truediv_6RealDivtraining/mul_30training/add_17*
T0*
_output_shapes	
:
b
training/ReadVariableOp_45ReadVariableOp
dense/bias*
dtype0*
_output_shapes	
:
l
training/sub_19Subtraining/ReadVariableOp_45training/truediv_6*
T0*
_output_shapes	
:
c
training/AssignVariableOp_15AssignVariableOptraining/Variable_5training/add_15*
dtype0

training/ReadVariableOp_46ReadVariableOptraining/Variable_5^training/AssignVariableOp_15*
dtype0*
_output_shapes	
:
d
training/AssignVariableOp_16AssignVariableOptraining/Variable_13training/add_16*
dtype0

training/ReadVariableOp_47ReadVariableOptraining/Variable_13^training/AssignVariableOp_16*
dtype0*
_output_shapes	
:
Z
training/AssignVariableOp_17AssignVariableOp
dense/biastraining/sub_19*
dtype0

training/ReadVariableOp_48ReadVariableOp
dense/bias^training/AssignVariableOp_17*
dtype0*
_output_shapes	
:
^
training/ReadVariableOp_49ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
s
training/mul_31/ReadVariableOpReadVariableOptraining/Variable_6*
dtype0*
_output_shapes
:	

|
training/mul_31Multraining/ReadVariableOp_49training/mul_31/ReadVariableOp*
T0*
_output_shapes
:	

^
training/ReadVariableOp_50ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_20/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_20Subtraining/sub_20/xtraining/ReadVariableOp_50*
T0*
_output_shapes
: 

training/mul_32Multraining/sub_20/training/gradients/dense_1/MatMul_grad/MatMul_1*
T0*
_output_shapes
:	

b
training/add_18Addtraining/mul_31training/mul_32*
T0*
_output_shapes
:	

^
training/ReadVariableOp_51ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
t
training/mul_33/ReadVariableOpReadVariableOptraining/Variable_14*
dtype0*
_output_shapes
:	

|
training/mul_33Multraining/ReadVariableOp_51training/mul_33/ReadVariableOp*
T0*
_output_shapes
:	

^
training/ReadVariableOp_52ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_21/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_21Subtraining/sub_21/xtraining/ReadVariableOp_52*
T0*
_output_shapes
: 
v
training/Square_6Square/training/gradients/dense_1/MatMul_grad/MatMul_1*
T0*
_output_shapes
:	

d
training/mul_34Multraining/sub_21training/Square_6*
T0*
_output_shapes
:	

b
training/add_19Addtraining/mul_33training/mul_34*
T0*
_output_shapes
:	

_
training/mul_35Multraining/multraining/add_18*
_output_shapes
:	
*
T0
V
training/Const_14Const*
valueB
 *    *
dtype0*
_output_shapes
: 
V
training/Const_15Const*
valueB
 *  *
dtype0*
_output_shapes
: 
y
 training/clip_by_value_7/MinimumMinimumtraining/add_19training/Const_15*
_output_shapes
:	
*
T0

training/clip_by_value_7Maximum training/clip_by_value_7/Minimumtraining/Const_14*
_output_shapes
:	
*
T0
[
training/Sqrt_7Sqrttraining/clip_by_value_7*
_output_shapes
:	
*
T0
V
training/add_20/yConst*
valueB
 *żÖ3*
dtype0*
_output_shapes
: 
d
training/add_20Addtraining/Sqrt_7training/add_20/y*
T0*
_output_shapes
:	

i
training/truediv_7RealDivtraining/mul_35training/add_20*
_output_shapes
:	
*
T0
j
training/ReadVariableOp_53ReadVariableOpdense_1/kernel*
dtype0*
_output_shapes
:	

p
training/sub_22Subtraining/ReadVariableOp_53training/truediv_7*
T0*
_output_shapes
:	

c
training/AssignVariableOp_18AssignVariableOptraining/Variable_6training/add_18*
dtype0

training/ReadVariableOp_54ReadVariableOptraining/Variable_6^training/AssignVariableOp_18*
dtype0*
_output_shapes
:	

d
training/AssignVariableOp_19AssignVariableOptraining/Variable_14training/add_19*
dtype0

training/ReadVariableOp_55ReadVariableOptraining/Variable_14^training/AssignVariableOp_19*
dtype0*
_output_shapes
:	

^
training/AssignVariableOp_20AssignVariableOpdense_1/kerneltraining/sub_22*
dtype0

training/ReadVariableOp_56ReadVariableOpdense_1/kernel^training/AssignVariableOp_20*
dtype0*
_output_shapes
:	

^
training/ReadVariableOp_57ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
n
training/mul_36/ReadVariableOpReadVariableOptraining/Variable_7*
dtype0*
_output_shapes
:

w
training/mul_36Multraining/ReadVariableOp_57training/mul_36/ReadVariableOp*
T0*
_output_shapes
:

^
training/ReadVariableOp_58ReadVariableOpAdam/beta_1*
dtype0*
_output_shapes
: 
V
training/sub_23/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_23Subtraining/sub_23/xtraining/ReadVariableOp_58*
T0*
_output_shapes
: 

training/mul_37Multraining/sub_233training/gradients/dense_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:

]
training/add_21Addtraining/mul_36training/mul_37*
T0*
_output_shapes
:

^
training/ReadVariableOp_59ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
o
training/mul_38/ReadVariableOpReadVariableOptraining/Variable_15*
dtype0*
_output_shapes
:

w
training/mul_38Multraining/ReadVariableOp_59training/mul_38/ReadVariableOp*
T0*
_output_shapes
:

^
training/ReadVariableOp_60ReadVariableOpAdam/beta_2*
dtype0*
_output_shapes
: 
V
training/sub_24/xConst*
valueB
 *  ?*
dtype0*
_output_shapes
: 
f
training/sub_24Subtraining/sub_24/xtraining/ReadVariableOp_60*
T0*
_output_shapes
: 
u
training/Square_7Square3training/gradients/dense_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:

_
training/mul_39Multraining/sub_24training/Square_7*
T0*
_output_shapes
:

]
training/add_22Addtraining/mul_38training/mul_39*
T0*
_output_shapes
:

Z
training/mul_40Multraining/multraining/add_21*
T0*
_output_shapes
:

V
training/Const_16Const*
valueB
 *    *
dtype0*
_output_shapes
: 
V
training/Const_17Const*
valueB
 *  *
dtype0*
_output_shapes
: 
t
 training/clip_by_value_8/MinimumMinimumtraining/add_22training/Const_17*
T0*
_output_shapes
:

}
training/clip_by_value_8Maximum training/clip_by_value_8/Minimumtraining/Const_16*
T0*
_output_shapes
:

V
training/Sqrt_8Sqrttraining/clip_by_value_8*
T0*
_output_shapes
:

V
training/add_23/yConst*
dtype0*
_output_shapes
: *
valueB
 *żÖ3
_
training/add_23Addtraining/Sqrt_8training/add_23/y*
_output_shapes
:
*
T0
d
training/truediv_8RealDivtraining/mul_40training/add_23*
T0*
_output_shapes
:

c
training/ReadVariableOp_61ReadVariableOpdense_1/bias*
dtype0*
_output_shapes
:

k
training/sub_25Subtraining/ReadVariableOp_61training/truediv_8*
T0*
_output_shapes
:

c
training/AssignVariableOp_21AssignVariableOptraining/Variable_7training/add_21*
dtype0

training/ReadVariableOp_62ReadVariableOptraining/Variable_7^training/AssignVariableOp_21*
dtype0*
_output_shapes
:

d
training/AssignVariableOp_22AssignVariableOptraining/Variable_15training/add_22*
dtype0

training/ReadVariableOp_63ReadVariableOptraining/Variable_15^training/AssignVariableOp_22*
dtype0*
_output_shapes
:

\
training/AssignVariableOp_23AssignVariableOpdense_1/biastraining/sub_25*
dtype0

training/ReadVariableOp_64ReadVariableOpdense_1/bias^training/AssignVariableOp_23*
dtype0*
_output_shapes
:


training_1/group_depsNoOp	^loss/mul^training/AssignVariableOp^training/AssignVariableOp_1^training/AssignVariableOp_10^training/AssignVariableOp_11^training/AssignVariableOp_12^training/AssignVariableOp_13^training/AssignVariableOp_14^training/AssignVariableOp_15^training/AssignVariableOp_16^training/AssignVariableOp_17^training/AssignVariableOp_18^training/AssignVariableOp_19^training/AssignVariableOp_2^training/AssignVariableOp_20^training/AssignVariableOp_21^training/AssignVariableOp_22^training/AssignVariableOp_23^training/AssignVariableOp_3^training/AssignVariableOp_4^training/AssignVariableOp_5^training/AssignVariableOp_6^training/AssignVariableOp_7^training/AssignVariableOp_8^training/AssignVariableOp_9
W
div_no_nan/ReadVariableOpReadVariableOptotal*
dtype0*
_output_shapes
: 
[
div_no_nan/ReadVariableOp_1ReadVariableOpcount_1*
dtype0*
_output_shapes
: 
o

div_no_nanDivNoNandiv_no_nan/ReadVariableOpdiv_no_nan/ReadVariableOp_1*
_output_shapes
: *
T0
A
IdentityIdentity
div_no_nan*
T0*
_output_shapes
: 
Y
div_no_nan_1/ReadVariableOpReadVariableOptotal*
dtype0*
_output_shapes
: 
]
div_no_nan_1/ReadVariableOp_1ReadVariableOpcount_1*
dtype0*
_output_shapes
: 
u
div_no_nan_1DivNoNandiv_no_nan_1/ReadVariableOpdiv_no_nan_1/ReadVariableOp_1*
_output_shapes
: *
T0
E

Identity_1Identitydiv_no_nan_1*
_output_shapes
: *
T0

checkpoint_initializer/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

#checkpoint_initializer/tensor_namesConst"/device:CPU:0* 
valueBBAdam/beta_1*
dtype0*
_output_shapes
:

'checkpoint_initializer/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Č
checkpoint_initializer	RestoreV2checkpoint_initializer/prefix#checkpoint_initializer/tensor_names'checkpoint_initializer/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
Q

Identity_2Identitycheckpoint_initializer*
T0*
_output_shapes
:
J
AssignVariableOpAssignVariableOpAdam/beta_1
Identity_2*
dtype0

checkpoint_initializer_1/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_1/tensor_namesConst"/device:CPU:0* 
valueBBAdam/beta_2*
dtype0*
_output_shapes
:

)checkpoint_initializer_1/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Đ
checkpoint_initializer_1	RestoreV2checkpoint_initializer_1/prefix%checkpoint_initializer_1/tensor_names)checkpoint_initializer_1/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
S

Identity_3Identitycheckpoint_initializer_1*
T0*
_output_shapes
:
L
AssignVariableOp_1AssignVariableOpAdam/beta_2
Identity_3*
dtype0

checkpoint_initializer_2/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_2/tensor_namesConst"/device:CPU:0*
valueBB
Adam/decay*
dtype0*
_output_shapes
:

)checkpoint_initializer_2/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Đ
checkpoint_initializer_2	RestoreV2checkpoint_initializer_2/prefix%checkpoint_initializer_2/tensor_names)checkpoint_initializer_2/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
S

Identity_4Identitycheckpoint_initializer_2*
_output_shapes
:*
T0
K
AssignVariableOp_2AssignVariableOp
Adam/decay
Identity_4*
dtype0

checkpoint_initializer_3/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_3/tensor_namesConst"/device:CPU:0*$
valueBBAdam/iterations*
dtype0*
_output_shapes
:

)checkpoint_initializer_3/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Đ
checkpoint_initializer_3	RestoreV2checkpoint_initializer_3/prefix%checkpoint_initializer_3/tensor_names)checkpoint_initializer_3/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2	
S

Identity_5Identitycheckpoint_initializer_3*
_output_shapes
:*
T0	
P
AssignVariableOp_3AssignVariableOpAdam/iterations
Identity_5*
dtype0	

checkpoint_initializer_4/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_4/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueBBAdam/lr

)checkpoint_initializer_4/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Đ
checkpoint_initializer_4	RestoreV2checkpoint_initializer_4/prefix%checkpoint_initializer_4/tensor_names)checkpoint_initializer_4/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
: 
S

Identity_6Identitycheckpoint_initializer_4*
T0*
_output_shapes
:
H
AssignVariableOp_4AssignVariableOpAdam/lr
Identity_6*
dtype0

checkpoint_initializer_5/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_5/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:* 
valueBBconv2d/bias

)checkpoint_initializer_5/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ô
checkpoint_initializer_5	RestoreV2checkpoint_initializer_5/prefix%checkpoint_initializer_5/tensor_names)checkpoint_initializer_5/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
S

Identity_7Identitycheckpoint_initializer_5*
_output_shapes
:*
T0
L
AssignVariableOp_5AssignVariableOpconv2d/bias
Identity_7*
dtype0

checkpoint_initializer_6/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_6/tensor_namesConst"/device:CPU:0*"
valueBBconv2d/kernel*
dtype0*
_output_shapes
:

)checkpoint_initializer_6/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ŕ
checkpoint_initializer_6	RestoreV2checkpoint_initializer_6/prefix%checkpoint_initializer_6/tensor_names)checkpoint_initializer_6/shape_and_slices"/device:CPU:0*
dtypes
2*&
_output_shapes
: 
S

Identity_8Identitycheckpoint_initializer_6*
_output_shapes
:*
T0
N
AssignVariableOp_6AssignVariableOpconv2d/kernel
Identity_8*
dtype0

checkpoint_initializer_7/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_7/tensor_namesConst"/device:CPU:0*"
valueBBconv2d_1/bias*
dtype0*
_output_shapes
:

)checkpoint_initializer_7/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ô
checkpoint_initializer_7	RestoreV2checkpoint_initializer_7/prefix%checkpoint_initializer_7/tensor_names)checkpoint_initializer_7/shape_and_slices"/device:CPU:0*
_output_shapes
:@*
dtypes
2
S

Identity_9Identitycheckpoint_initializer_7*
_output_shapes
:*
T0
N
AssignVariableOp_7AssignVariableOpconv2d_1/bias
Identity_9*
dtype0

checkpoint_initializer_8/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_8/tensor_namesConst"/device:CPU:0*$
valueBBconv2d_1/kernel*
dtype0*
_output_shapes
:

)checkpoint_initializer_8/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ŕ
checkpoint_initializer_8	RestoreV2checkpoint_initializer_8/prefix%checkpoint_initializer_8/tensor_names)checkpoint_initializer_8/shape_and_slices"/device:CPU:0*
dtypes
2*&
_output_shapes
: @
T
Identity_10Identitycheckpoint_initializer_8*
_output_shapes
:*
T0
Q
AssignVariableOp_8AssignVariableOpconv2d_1/kernelIdentity_10*
dtype0

checkpoint_initializer_9/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

%checkpoint_initializer_9/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueBB
dense/bias

)checkpoint_initializer_9/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ő
checkpoint_initializer_9	RestoreV2checkpoint_initializer_9/prefix%checkpoint_initializer_9/tensor_names)checkpoint_initializer_9/shape_and_slices"/device:CPU:0*
_output_shapes	
:*
dtypes
2
T
Identity_11Identitycheckpoint_initializer_9*
T0*
_output_shapes
:
L
AssignVariableOp_9AssignVariableOp
dense/biasIdentity_11*
dtype0

 checkpoint_initializer_10/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_10/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*!
valueBBdense/kernel

*checkpoint_initializer_10/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ţ
checkpoint_initializer_10	RestoreV2 checkpoint_initializer_10/prefix&checkpoint_initializer_10/tensor_names*checkpoint_initializer_10/shape_and_slices"/device:CPU:0*
dtypes
2* 
_output_shapes
:
Ŕ
U
Identity_12Identitycheckpoint_initializer_10*
T0*
_output_shapes
:
O
AssignVariableOp_10AssignVariableOpdense/kernelIdentity_12*
dtype0

 checkpoint_initializer_11/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_11/tensor_namesConst"/device:CPU:0*!
valueBBdense_1/bias*
dtype0*
_output_shapes
:

*checkpoint_initializer_11/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_11	RestoreV2 checkpoint_initializer_11/prefix&checkpoint_initializer_11/tensor_names*checkpoint_initializer_11/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
:

U
Identity_13Identitycheckpoint_initializer_11*
T0*
_output_shapes
:
O
AssignVariableOp_11AssignVariableOpdense_1/biasIdentity_13*
dtype0

 checkpoint_initializer_12/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_12/tensor_namesConst"/device:CPU:0*#
valueBBdense_1/kernel*
dtype0*
_output_shapes
:

*checkpoint_initializer_12/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ý
checkpoint_initializer_12	RestoreV2 checkpoint_initializer_12/prefix&checkpoint_initializer_12/tensor_names*checkpoint_initializer_12/shape_and_slices"/device:CPU:0*
_output_shapes
:	
*
dtypes
2
U
Identity_14Identitycheckpoint_initializer_12*
T0*
_output_shapes
:
Q
AssignVariableOp_12AssignVariableOpdense_1/kernelIdentity_14*
dtype0

 checkpoint_initializer_13/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_13/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*&
valueBBtraining/Variable

*checkpoint_initializer_13/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ä
checkpoint_initializer_13	RestoreV2 checkpoint_initializer_13/prefix&checkpoint_initializer_13/tensor_names*checkpoint_initializer_13/shape_and_slices"/device:CPU:0*&
_output_shapes
: *
dtypes
2
U
Identity_15Identitycheckpoint_initializer_13*
T0*
_output_shapes
:
T
AssignVariableOp_13AssignVariableOptraining/VariableIdentity_15*
dtype0

 checkpoint_initializer_14/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_14/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_1*
dtype0*
_output_shapes
:

*checkpoint_initializer_14/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_14	RestoreV2 checkpoint_initializer_14/prefix&checkpoint_initializer_14/tensor_names*checkpoint_initializer_14/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
: 
U
Identity_16Identitycheckpoint_initializer_14*
T0*
_output_shapes
:
V
AssignVariableOp_14AssignVariableOptraining/Variable_1Identity_16*
dtype0

 checkpoint_initializer_15/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_15/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_10*
dtype0*
_output_shapes
:

*checkpoint_initializer_15/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ä
checkpoint_initializer_15	RestoreV2 checkpoint_initializer_15/prefix&checkpoint_initializer_15/tensor_names*checkpoint_initializer_15/shape_and_slices"/device:CPU:0*&
_output_shapes
: @*
dtypes
2
U
Identity_17Identitycheckpoint_initializer_15*
_output_shapes
:*
T0
W
AssignVariableOp_15AssignVariableOptraining/Variable_10Identity_17*
dtype0

 checkpoint_initializer_16/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_16/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_11*
dtype0*
_output_shapes
:

*checkpoint_initializer_16/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ř
checkpoint_initializer_16	RestoreV2 checkpoint_initializer_16/prefix&checkpoint_initializer_16/tensor_names*checkpoint_initializer_16/shape_and_slices"/device:CPU:0*
_output_shapes
:@*
dtypes
2
U
Identity_18Identitycheckpoint_initializer_16*
T0*
_output_shapes
:
W
AssignVariableOp_16AssignVariableOptraining/Variable_11Identity_18*
dtype0

 checkpoint_initializer_17/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_17/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_12*
dtype0*
_output_shapes
:

*checkpoint_initializer_17/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ţ
checkpoint_initializer_17	RestoreV2 checkpoint_initializer_17/prefix&checkpoint_initializer_17/tensor_names*checkpoint_initializer_17/shape_and_slices"/device:CPU:0* 
_output_shapes
:
Ŕ*
dtypes
2
U
Identity_19Identitycheckpoint_initializer_17*
_output_shapes
:*
T0
W
AssignVariableOp_17AssignVariableOptraining/Variable_12Identity_19*
dtype0

 checkpoint_initializer_18/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_18/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_13*
dtype0*
_output_shapes
:

*checkpoint_initializer_18/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ů
checkpoint_initializer_18	RestoreV2 checkpoint_initializer_18/prefix&checkpoint_initializer_18/tensor_names*checkpoint_initializer_18/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes	
:
U
Identity_20Identitycheckpoint_initializer_18*
T0*
_output_shapes
:
W
AssignVariableOp_18AssignVariableOptraining/Variable_13Identity_20*
dtype0

 checkpoint_initializer_19/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_19/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_14*
dtype0*
_output_shapes
:

*checkpoint_initializer_19/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ý
checkpoint_initializer_19	RestoreV2 checkpoint_initializer_19/prefix&checkpoint_initializer_19/tensor_names*checkpoint_initializer_19/shape_and_slices"/device:CPU:0*
_output_shapes
:	
*
dtypes
2
U
Identity_21Identitycheckpoint_initializer_19*
T0*
_output_shapes
:
W
AssignVariableOp_19AssignVariableOptraining/Variable_14Identity_21*
dtype0

 checkpoint_initializer_20/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_20/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_15*
dtype0*
_output_shapes
:

*checkpoint_initializer_20/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_20	RestoreV2 checkpoint_initializer_20/prefix&checkpoint_initializer_20/tensor_names*checkpoint_initializer_20/shape_and_slices"/device:CPU:0*
_output_shapes
:
*
dtypes
2
U
Identity_22Identitycheckpoint_initializer_20*
T0*
_output_shapes
:
W
AssignVariableOp_20AssignVariableOptraining/Variable_15Identity_22*
dtype0

 checkpoint_initializer_21/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_21/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_16*
dtype0*
_output_shapes
:

*checkpoint_initializer_21/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_21	RestoreV2 checkpoint_initializer_21/prefix&checkpoint_initializer_21/tensor_names*checkpoint_initializer_21/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_23Identitycheckpoint_initializer_21*
_output_shapes
:*
T0
W
AssignVariableOp_21AssignVariableOptraining/Variable_16Identity_23*
dtype0

 checkpoint_initializer_22/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_22/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_17*
dtype0*
_output_shapes
:

*checkpoint_initializer_22/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_22	RestoreV2 checkpoint_initializer_22/prefix&checkpoint_initializer_22/tensor_names*checkpoint_initializer_22/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
:
U
Identity_24Identitycheckpoint_initializer_22*
T0*
_output_shapes
:
W
AssignVariableOp_22AssignVariableOptraining/Variable_17Identity_24*
dtype0

 checkpoint_initializer_23/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_23/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_18*
dtype0*
_output_shapes
:

*checkpoint_initializer_23/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_23	RestoreV2 checkpoint_initializer_23/prefix&checkpoint_initializer_23/tensor_names*checkpoint_initializer_23/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_25Identitycheckpoint_initializer_23*
T0*
_output_shapes
:
W
AssignVariableOp_23AssignVariableOptraining/Variable_18Identity_25*
dtype0

 checkpoint_initializer_24/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_24/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_19*
dtype0*
_output_shapes
:

*checkpoint_initializer_24/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_24	RestoreV2 checkpoint_initializer_24/prefix&checkpoint_initializer_24/tensor_names*checkpoint_initializer_24/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_26Identitycheckpoint_initializer_24*
T0*
_output_shapes
:
W
AssignVariableOp_24AssignVariableOptraining/Variable_19Identity_26*
dtype0

 checkpoint_initializer_25/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_25/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_2*
dtype0*
_output_shapes
:

*checkpoint_initializer_25/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
ä
checkpoint_initializer_25	RestoreV2 checkpoint_initializer_25/prefix&checkpoint_initializer_25/tensor_names*checkpoint_initializer_25/shape_and_slices"/device:CPU:0*&
_output_shapes
: @*
dtypes
2
U
Identity_27Identitycheckpoint_initializer_25*
T0*
_output_shapes
:
V
AssignVariableOp_25AssignVariableOptraining/Variable_2Identity_27*
dtype0

 checkpoint_initializer_26/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_26/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_20*
dtype0*
_output_shapes
:

*checkpoint_initializer_26/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ř
checkpoint_initializer_26	RestoreV2 checkpoint_initializer_26/prefix&checkpoint_initializer_26/tensor_names*checkpoint_initializer_26/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_28Identitycheckpoint_initializer_26*
_output_shapes
:*
T0
W
AssignVariableOp_26AssignVariableOptraining/Variable_20Identity_28*
dtype0

 checkpoint_initializer_27/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_27/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_21*
dtype0*
_output_shapes
:

*checkpoint_initializer_27/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_27	RestoreV2 checkpoint_initializer_27/prefix&checkpoint_initializer_27/tensor_names*checkpoint_initializer_27/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
:
U
Identity_29Identitycheckpoint_initializer_27*
T0*
_output_shapes
:
W
AssignVariableOp_27AssignVariableOptraining/Variable_21Identity_29*
dtype0

 checkpoint_initializer_28/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_28/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*)
value BBtraining/Variable_22

*checkpoint_initializer_28/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ř
checkpoint_initializer_28	RestoreV2 checkpoint_initializer_28/prefix&checkpoint_initializer_28/tensor_names*checkpoint_initializer_28/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_30Identitycheckpoint_initializer_28*
T0*
_output_shapes
:
W
AssignVariableOp_28AssignVariableOptraining/Variable_22Identity_30*
dtype0

 checkpoint_initializer_29/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_29/tensor_namesConst"/device:CPU:0*)
value BBtraining/Variable_23*
dtype0*
_output_shapes
:

*checkpoint_initializer_29/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_29	RestoreV2 checkpoint_initializer_29/prefix&checkpoint_initializer_29/tensor_names*checkpoint_initializer_29/shape_and_slices"/device:CPU:0*
_output_shapes
:*
dtypes
2
U
Identity_31Identitycheckpoint_initializer_29*
T0*
_output_shapes
:
W
AssignVariableOp_29AssignVariableOptraining/Variable_23Identity_31*
dtype0

 checkpoint_initializer_30/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_30/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_3*
dtype0*
_output_shapes
:

*checkpoint_initializer_30/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ř
checkpoint_initializer_30	RestoreV2 checkpoint_initializer_30/prefix&checkpoint_initializer_30/tensor_names*checkpoint_initializer_30/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
:@
U
Identity_32Identitycheckpoint_initializer_30*
_output_shapes
:*
T0
V
AssignVariableOp_30AssignVariableOptraining/Variable_3Identity_32*
dtype0

 checkpoint_initializer_31/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_31/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*(
valueBBtraining/Variable_4

*checkpoint_initializer_31/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ţ
checkpoint_initializer_31	RestoreV2 checkpoint_initializer_31/prefix&checkpoint_initializer_31/tensor_names*checkpoint_initializer_31/shape_and_slices"/device:CPU:0*
dtypes
2* 
_output_shapes
:
Ŕ
U
Identity_33Identitycheckpoint_initializer_31*
T0*
_output_shapes
:
V
AssignVariableOp_31AssignVariableOptraining/Variable_4Identity_33*
dtype0

 checkpoint_initializer_32/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_32/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_5*
dtype0*
_output_shapes
:

*checkpoint_initializer_32/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
Ů
checkpoint_initializer_32	RestoreV2 checkpoint_initializer_32/prefix&checkpoint_initializer_32/tensor_names*checkpoint_initializer_32/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes	
:
U
Identity_34Identitycheckpoint_initializer_32*
T0*
_output_shapes
:
V
AssignVariableOp_32AssignVariableOptraining/Variable_5Identity_34*
dtype0

 checkpoint_initializer_33/prefixConst"/device:CPU:0*
dtype0*
_output_shapes
: *2
value)B' B!model_save/keras/keras_model.ckpt

&checkpoint_initializer_33/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_6*
dtype0*
_output_shapes
:

*checkpoint_initializer_33/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ý
checkpoint_initializer_33	RestoreV2 checkpoint_initializer_33/prefix&checkpoint_initializer_33/tensor_names*checkpoint_initializer_33/shape_and_slices"/device:CPU:0*
_output_shapes
:	
*
dtypes
2
U
Identity_35Identitycheckpoint_initializer_33*
_output_shapes
:*
T0
V
AssignVariableOp_33AssignVariableOptraining/Variable_6Identity_35*
dtype0

 checkpoint_initializer_34/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_34/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*(
valueBBtraining/Variable_7

*checkpoint_initializer_34/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_34	RestoreV2 checkpoint_initializer_34/prefix&checkpoint_initializer_34/tensor_names*checkpoint_initializer_34/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes
:

U
Identity_36Identitycheckpoint_initializer_34*
T0*
_output_shapes
:
V
AssignVariableOp_34AssignVariableOptraining/Variable_7Identity_36*
dtype0

 checkpoint_initializer_35/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_35/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_8*
dtype0*
_output_shapes
:

*checkpoint_initializer_35/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB
B 
ä
checkpoint_initializer_35	RestoreV2 checkpoint_initializer_35/prefix&checkpoint_initializer_35/tensor_names*checkpoint_initializer_35/shape_and_slices"/device:CPU:0*&
_output_shapes
: *
dtypes
2
U
Identity_37Identitycheckpoint_initializer_35*
T0*
_output_shapes
:
V
AssignVariableOp_35AssignVariableOptraining/Variable_8Identity_37*
dtype0

 checkpoint_initializer_36/prefixConst"/device:CPU:0*2
value)B' B!model_save/keras/keras_model.ckpt*
dtype0*
_output_shapes
: 

&checkpoint_initializer_36/tensor_namesConst"/device:CPU:0*(
valueBBtraining/Variable_9*
dtype0*
_output_shapes
:

*checkpoint_initializer_36/shape_and_slicesConst"/device:CPU:0*
valueB
B *
dtype0*
_output_shapes
:
Ř
checkpoint_initializer_36	RestoreV2 checkpoint_initializer_36/prefix&checkpoint_initializer_36/tensor_names*checkpoint_initializer_36/shape_and_slices"/device:CPU:0*
_output_shapes
: *
dtypes
2
U
Identity_38Identitycheckpoint_initializer_36*
T0*
_output_shapes
:
V
AssignVariableOp_36AssignVariableOptraining/Variable_9Identity_38*
dtype0
R
loss_1/tagsConst*
valueB Bloss_1*
dtype0*
_output_shapes
: 
O
loss_1ScalarSummaryloss_1/tagsloss/mul*
_output_shapes
: *
T0
Ă
initNoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^global_step/Assign

init_1NoOp
"

group_depsNoOp^init^init_1

4report_uninitialized_variables/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 
n
1report_uninitialized_variables/VarIsInitializedOpVarIsInitializedOpconv2d/kernel*
_output_shapes
: 
n
3report_uninitialized_variables/VarIsInitializedOp_1VarIsInitializedOpconv2d/bias*
_output_shapes
: 
r
3report_uninitialized_variables/VarIsInitializedOp_2VarIsInitializedOpconv2d_1/kernel*
_output_shapes
: 
p
3report_uninitialized_variables/VarIsInitializedOp_3VarIsInitializedOpconv2d_1/bias*
_output_shapes
: 
o
3report_uninitialized_variables/VarIsInitializedOp_4VarIsInitializedOpdense/kernel*
_output_shapes
: 
m
3report_uninitialized_variables/VarIsInitializedOp_5VarIsInitializedOp
dense/bias*
_output_shapes
: 
q
3report_uninitialized_variables/VarIsInitializedOp_6VarIsInitializedOpdense_1/kernel*
_output_shapes
: 
o
3report_uninitialized_variables/VarIsInitializedOp_7VarIsInitializedOpdense_1/bias*
_output_shapes
: 
r
3report_uninitialized_variables/VarIsInitializedOp_8VarIsInitializedOpAdam/iterations*
_output_shapes
: 
j
3report_uninitialized_variables/VarIsInitializedOp_9VarIsInitializedOpAdam/lr*
_output_shapes
: 
o
4report_uninitialized_variables/VarIsInitializedOp_10VarIsInitializedOpAdam/beta_1*
_output_shapes
: 
o
4report_uninitialized_variables/VarIsInitializedOp_11VarIsInitializedOpAdam/beta_2*
_output_shapes
: 
n
4report_uninitialized_variables/VarIsInitializedOp_12VarIsInitializedOp
Adam/decay*
_output_shapes
: 
u
4report_uninitialized_variables/VarIsInitializedOp_13VarIsInitializedOptraining/Variable*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_14VarIsInitializedOptraining/Variable_1*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_15VarIsInitializedOptraining/Variable_2*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_16VarIsInitializedOptraining/Variable_3*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_17VarIsInitializedOptraining/Variable_4*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_18VarIsInitializedOptraining/Variable_5*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_19VarIsInitializedOptraining/Variable_6*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_20VarIsInitializedOptraining/Variable_7*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_21VarIsInitializedOptraining/Variable_8*
_output_shapes
: 
w
4report_uninitialized_variables/VarIsInitializedOp_22VarIsInitializedOptraining/Variable_9*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_23VarIsInitializedOptraining/Variable_10*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_24VarIsInitializedOptraining/Variable_11*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_25VarIsInitializedOptraining/Variable_12*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_26VarIsInitializedOptraining/Variable_13*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_27VarIsInitializedOptraining/Variable_14*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_28VarIsInitializedOptraining/Variable_15*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_29VarIsInitializedOptraining/Variable_16*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_30VarIsInitializedOptraining/Variable_17*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_31VarIsInitializedOptraining/Variable_18*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_32VarIsInitializedOptraining/Variable_19*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_33VarIsInitializedOptraining/Variable_20*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_34VarIsInitializedOptraining/Variable_21*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_35VarIsInitializedOptraining/Variable_22*
_output_shapes
: 
x
4report_uninitialized_variables/VarIsInitializedOp_36VarIsInitializedOptraining/Variable_23*
_output_shapes
: 
k
4report_uninitialized_variables/VarIsInitializedOp_37VarIsInitializedOpcount_1*
_output_shapes
: 
i
4report_uninitialized_variables/VarIsInitializedOp_38VarIsInitializedOptotal*
_output_shapes
: 
Ů
$report_uninitialized_variables/stackPack4report_uninitialized_variables/IsVariableInitialized1report_uninitialized_variables/VarIsInitializedOp3report_uninitialized_variables/VarIsInitializedOp_13report_uninitialized_variables/VarIsInitializedOp_23report_uninitialized_variables/VarIsInitializedOp_33report_uninitialized_variables/VarIsInitializedOp_43report_uninitialized_variables/VarIsInitializedOp_53report_uninitialized_variables/VarIsInitializedOp_63report_uninitialized_variables/VarIsInitializedOp_73report_uninitialized_variables/VarIsInitializedOp_83report_uninitialized_variables/VarIsInitializedOp_94report_uninitialized_variables/VarIsInitializedOp_104report_uninitialized_variables/VarIsInitializedOp_114report_uninitialized_variables/VarIsInitializedOp_124report_uninitialized_variables/VarIsInitializedOp_134report_uninitialized_variables/VarIsInitializedOp_144report_uninitialized_variables/VarIsInitializedOp_154report_uninitialized_variables/VarIsInitializedOp_164report_uninitialized_variables/VarIsInitializedOp_174report_uninitialized_variables/VarIsInitializedOp_184report_uninitialized_variables/VarIsInitializedOp_194report_uninitialized_variables/VarIsInitializedOp_204report_uninitialized_variables/VarIsInitializedOp_214report_uninitialized_variables/VarIsInitializedOp_224report_uninitialized_variables/VarIsInitializedOp_234report_uninitialized_variables/VarIsInitializedOp_244report_uninitialized_variables/VarIsInitializedOp_254report_uninitialized_variables/VarIsInitializedOp_264report_uninitialized_variables/VarIsInitializedOp_274report_uninitialized_variables/VarIsInitializedOp_284report_uninitialized_variables/VarIsInitializedOp_294report_uninitialized_variables/VarIsInitializedOp_304report_uninitialized_variables/VarIsInitializedOp_314report_uninitialized_variables/VarIsInitializedOp_324report_uninitialized_variables/VarIsInitializedOp_334report_uninitialized_variables/VarIsInitializedOp_344report_uninitialized_variables/VarIsInitializedOp_354report_uninitialized_variables/VarIsInitializedOp_364report_uninitialized_variables/VarIsInitializedOp_374report_uninitialized_variables/VarIsInitializedOp_38"/device:CPU:0*
T0
*

axis *
N(*
_output_shapes
:(

)report_uninitialized_variables/LogicalNot
LogicalNot$report_uninitialized_variables/stack"/device:CPU:0*
_output_shapes
:(
Ň
$report_uninitialized_variables/ConstConst"/device:CPU:0*
dtype0*
_output_shapes
:(*ę
valueŕBÝ(Bglobal_stepBconv2d/kernelBconv2d/biasBconv2d_1/kernelBconv2d_1/biasBdense/kernelB
dense/biasBdense_1/kernelBdense_1/biasBAdam/iterationsBAdam/lrBAdam/beta_1BAdam/beta_2B
Adam/decayBtraining/VariableBtraining/Variable_1Btraining/Variable_2Btraining/Variable_3Btraining/Variable_4Btraining/Variable_5Btraining/Variable_6Btraining/Variable_7Btraining/Variable_8Btraining/Variable_9Btraining/Variable_10Btraining/Variable_11Btraining/Variable_12Btraining/Variable_13Btraining/Variable_14Btraining/Variable_15Btraining/Variable_16Btraining/Variable_17Btraining/Variable_18Btraining/Variable_19Btraining/Variable_20Btraining/Variable_21Btraining/Variable_22Btraining/Variable_23Bcount_1Btotal

1report_uninitialized_variables/boolean_mask/ShapeConst"/device:CPU:0*
valueB:(*
dtype0*
_output_shapes
:

?report_uninitialized_variables/boolean_mask/strided_slice/stackConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB: 

Areport_uninitialized_variables/boolean_mask/strided_slice/stack_1Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
č
9report_uninitialized_variables/boolean_mask/strided_sliceStridedSlice1report_uninitialized_variables/boolean_mask/Shape?report_uninitialized_variables/boolean_mask/strided_slice/stackAreport_uninitialized_variables/boolean_mask/strided_slice/stack_1Areport_uninitialized_variables/boolean_mask/strided_slice/stack_2"/device:CPU:0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
:*
Index0*
T0

Breport_uninitialized_variables/boolean_mask/Prod/reduction_indicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB: 

0report_uninitialized_variables/boolean_mask/ProdProd9report_uninitialized_variables/boolean_mask/strided_sliceBreport_uninitialized_variables/boolean_mask/Prod/reduction_indices"/device:CPU:0*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 

3report_uninitialized_variables/boolean_mask/Shape_1Const"/device:CPU:0*
valueB:(*
dtype0*
_output_shapes
:

Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
đ
;report_uninitialized_variables/boolean_mask/strided_slice_1StridedSlice3report_uninitialized_variables/boolean_mask/Shape_1Areport_uninitialized_variables/boolean_mask/strided_slice_1/stackCreport_uninitialized_variables/boolean_mask/strided_slice_1/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_1/stack_2"/device:CPU:0*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 

3report_uninitialized_variables/boolean_mask/Shape_2Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:(

Areport_uninitialized_variables/boolean_mask/strided_slice_2/stackConst"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
đ
;report_uninitialized_variables/boolean_mask/strided_slice_2StridedSlice3report_uninitialized_variables/boolean_mask/Shape_2Areport_uninitialized_variables/boolean_mask/strided_slice_2/stackCreport_uninitialized_variables/boolean_mask/strided_slice_2/stack_1Creport_uninitialized_variables/boolean_mask/strided_slice_2/stack_2"/device:CPU:0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask*
_output_shapes
: *
T0*
Index0
ž
;report_uninitialized_variables/boolean_mask/concat/values_1Pack0report_uninitialized_variables/boolean_mask/Prod"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:

7report_uninitialized_variables/boolean_mask/concat/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
÷
2report_uninitialized_variables/boolean_mask/concatConcatV2;report_uninitialized_variables/boolean_mask/strided_slice_1;report_uninitialized_variables/boolean_mask/concat/values_1;report_uninitialized_variables/boolean_mask/strided_slice_27report_uninitialized_variables/boolean_mask/concat/axis"/device:CPU:0*
N*
_output_shapes
:*

Tidx0*
T0
Ú
3report_uninitialized_variables/boolean_mask/ReshapeReshape$report_uninitialized_variables/Const2report_uninitialized_variables/boolean_mask/concat"/device:CPU:0*
_output_shapes
:(*
T0*
Tshape0

;report_uninitialized_variables/boolean_mask/Reshape_1/shapeConst"/device:CPU:0*
valueB:
˙˙˙˙˙˙˙˙˙*
dtype0*
_output_shapes
:
ę
5report_uninitialized_variables/boolean_mask/Reshape_1Reshape)report_uninitialized_variables/LogicalNot;report_uninitialized_variables/boolean_mask/Reshape_1/shape"/device:CPU:0*
T0
*
Tshape0*
_output_shapes
:(
˛
1report_uninitialized_variables/boolean_mask/WhereWhere5report_uninitialized_variables/boolean_mask/Reshape_1"/device:CPU:0*
T0
*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ĺ
3report_uninitialized_variables/boolean_mask/SqueezeSqueeze1report_uninitialized_variables/boolean_mask/Where"/device:CPU:0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
squeeze_dims
*
T0	

9report_uninitialized_variables/boolean_mask/GatherV2/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
×
4report_uninitialized_variables/boolean_mask/GatherV2GatherV23report_uninitialized_variables/boolean_mask/Reshape3report_uninitialized_variables/boolean_mask/Squeeze9report_uninitialized_variables/boolean_mask/GatherV2/axis"/device:CPU:0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
Taxis0*

batch_dims *
Tindices0	*
Tparams0
v
$report_uninitialized_resources/ConstConst"/device:CPU:0*
dtype0*
_output_shapes
: *
valueB 
M
concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
ž
concatConcatV24report_uninitialized_variables/boolean_mask/GatherV2$report_uninitialized_resources/Constconcat/axis*

Tidx0*
T0*
N*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ą
6report_uninitialized_variables_1/IsVariableInitializedIsVariableInitializedglobal_step*
_class
loc:@global_step*
dtype0	*
_output_shapes
: 
p
3report_uninitialized_variables_1/VarIsInitializedOpVarIsInitializedOpconv2d/kernel*
_output_shapes
: 
p
5report_uninitialized_variables_1/VarIsInitializedOp_1VarIsInitializedOpconv2d/bias*
_output_shapes
: 
t
5report_uninitialized_variables_1/VarIsInitializedOp_2VarIsInitializedOpconv2d_1/kernel*
_output_shapes
: 
r
5report_uninitialized_variables_1/VarIsInitializedOp_3VarIsInitializedOpconv2d_1/bias*
_output_shapes
: 
q
5report_uninitialized_variables_1/VarIsInitializedOp_4VarIsInitializedOpdense/kernel*
_output_shapes
: 
o
5report_uninitialized_variables_1/VarIsInitializedOp_5VarIsInitializedOp
dense/bias*
_output_shapes
: 
s
5report_uninitialized_variables_1/VarIsInitializedOp_6VarIsInitializedOpdense_1/kernel*
_output_shapes
: 
q
5report_uninitialized_variables_1/VarIsInitializedOp_7VarIsInitializedOpdense_1/bias*
_output_shapes
: 
t
5report_uninitialized_variables_1/VarIsInitializedOp_8VarIsInitializedOpAdam/iterations*
_output_shapes
: 
l
5report_uninitialized_variables_1/VarIsInitializedOp_9VarIsInitializedOpAdam/lr*
_output_shapes
: 
q
6report_uninitialized_variables_1/VarIsInitializedOp_10VarIsInitializedOpAdam/beta_1*
_output_shapes
: 
q
6report_uninitialized_variables_1/VarIsInitializedOp_11VarIsInitializedOpAdam/beta_2*
_output_shapes
: 
p
6report_uninitialized_variables_1/VarIsInitializedOp_12VarIsInitializedOp
Adam/decay*
_output_shapes
: 
w
6report_uninitialized_variables_1/VarIsInitializedOp_13VarIsInitializedOptraining/Variable*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_14VarIsInitializedOptraining/Variable_1*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_15VarIsInitializedOptraining/Variable_2*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_16VarIsInitializedOptraining/Variable_3*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_17VarIsInitializedOptraining/Variable_4*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_18VarIsInitializedOptraining/Variable_5*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_19VarIsInitializedOptraining/Variable_6*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_20VarIsInitializedOptraining/Variable_7*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_21VarIsInitializedOptraining/Variable_8*
_output_shapes
: 
y
6report_uninitialized_variables_1/VarIsInitializedOp_22VarIsInitializedOptraining/Variable_9*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_23VarIsInitializedOptraining/Variable_10*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_24VarIsInitializedOptraining/Variable_11*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_25VarIsInitializedOptraining/Variable_12*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_26VarIsInitializedOptraining/Variable_13*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_27VarIsInitializedOptraining/Variable_14*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_28VarIsInitializedOptraining/Variable_15*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_29VarIsInitializedOptraining/Variable_16*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_30VarIsInitializedOptraining/Variable_17*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_31VarIsInitializedOptraining/Variable_18*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_32VarIsInitializedOptraining/Variable_19*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_33VarIsInitializedOptraining/Variable_20*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_34VarIsInitializedOptraining/Variable_21*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_35VarIsInitializedOptraining/Variable_22*
_output_shapes
: 
z
6report_uninitialized_variables_1/VarIsInitializedOp_36VarIsInitializedOptraining/Variable_23*
_output_shapes
: 
ť
&report_uninitialized_variables_1/stackPack6report_uninitialized_variables_1/IsVariableInitialized3report_uninitialized_variables_1/VarIsInitializedOp5report_uninitialized_variables_1/VarIsInitializedOp_15report_uninitialized_variables_1/VarIsInitializedOp_25report_uninitialized_variables_1/VarIsInitializedOp_35report_uninitialized_variables_1/VarIsInitializedOp_45report_uninitialized_variables_1/VarIsInitializedOp_55report_uninitialized_variables_1/VarIsInitializedOp_65report_uninitialized_variables_1/VarIsInitializedOp_75report_uninitialized_variables_1/VarIsInitializedOp_85report_uninitialized_variables_1/VarIsInitializedOp_96report_uninitialized_variables_1/VarIsInitializedOp_106report_uninitialized_variables_1/VarIsInitializedOp_116report_uninitialized_variables_1/VarIsInitializedOp_126report_uninitialized_variables_1/VarIsInitializedOp_136report_uninitialized_variables_1/VarIsInitializedOp_146report_uninitialized_variables_1/VarIsInitializedOp_156report_uninitialized_variables_1/VarIsInitializedOp_166report_uninitialized_variables_1/VarIsInitializedOp_176report_uninitialized_variables_1/VarIsInitializedOp_186report_uninitialized_variables_1/VarIsInitializedOp_196report_uninitialized_variables_1/VarIsInitializedOp_206report_uninitialized_variables_1/VarIsInitializedOp_216report_uninitialized_variables_1/VarIsInitializedOp_226report_uninitialized_variables_1/VarIsInitializedOp_236report_uninitialized_variables_1/VarIsInitializedOp_246report_uninitialized_variables_1/VarIsInitializedOp_256report_uninitialized_variables_1/VarIsInitializedOp_266report_uninitialized_variables_1/VarIsInitializedOp_276report_uninitialized_variables_1/VarIsInitializedOp_286report_uninitialized_variables_1/VarIsInitializedOp_296report_uninitialized_variables_1/VarIsInitializedOp_306report_uninitialized_variables_1/VarIsInitializedOp_316report_uninitialized_variables_1/VarIsInitializedOp_326report_uninitialized_variables_1/VarIsInitializedOp_336report_uninitialized_variables_1/VarIsInitializedOp_346report_uninitialized_variables_1/VarIsInitializedOp_356report_uninitialized_variables_1/VarIsInitializedOp_36"/device:CPU:0*
T0
*

axis *
N&*
_output_shapes
:&

+report_uninitialized_variables_1/LogicalNot
LogicalNot&report_uninitialized_variables_1/stack"/device:CPU:0*
_output_shapes
:&
Ä
&report_uninitialized_variables_1/ConstConst"/device:CPU:0*Ú
valueĐBÍ&Bglobal_stepBconv2d/kernelBconv2d/biasBconv2d_1/kernelBconv2d_1/biasBdense/kernelB
dense/biasBdense_1/kernelBdense_1/biasBAdam/iterationsBAdam/lrBAdam/beta_1BAdam/beta_2B
Adam/decayBtraining/VariableBtraining/Variable_1Btraining/Variable_2Btraining/Variable_3Btraining/Variable_4Btraining/Variable_5Btraining/Variable_6Btraining/Variable_7Btraining/Variable_8Btraining/Variable_9Btraining/Variable_10Btraining/Variable_11Btraining/Variable_12Btraining/Variable_13Btraining/Variable_14Btraining/Variable_15Btraining/Variable_16Btraining/Variable_17Btraining/Variable_18Btraining/Variable_19Btraining/Variable_20Btraining/Variable_21Btraining/Variable_22Btraining/Variable_23*
dtype0*
_output_shapes
:&

3report_uninitialized_variables_1/boolean_mask/ShapeConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:&

Areport_uninitialized_variables_1/boolean_mask/strided_slice/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2Const"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
ň
;report_uninitialized_variables_1/boolean_mask/strided_sliceStridedSlice3report_uninitialized_variables_1/boolean_mask/ShapeAreport_uninitialized_variables_1/boolean_mask/strided_slice/stackCreport_uninitialized_variables_1/boolean_mask/strided_slice/stack_1Creport_uninitialized_variables_1/boolean_mask/strided_slice/stack_2"/device:CPU:0*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
:

Dreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indicesConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

2report_uninitialized_variables_1/boolean_mask/ProdProd;report_uninitialized_variables_1/boolean_mask/strided_sliceDreport_uninitialized_variables_1/boolean_mask/Prod/reduction_indices"/device:CPU:0*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0

5report_uninitialized_variables_1/boolean_mask/Shape_1Const"/device:CPU:0*
valueB:&*
dtype0*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackConst"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
ú
=report_uninitialized_variables_1/boolean_mask/strided_slice_1StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_1Creport_uninitialized_variables_1/boolean_mask/strided_slice_1/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_1/stack_2"/device:CPU:0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0

5report_uninitialized_variables_1/boolean_mask/Shape_2Const"/device:CPU:0*
valueB:&*
dtype0*
_output_shapes
:

Creport_uninitialized_variables_1/boolean_mask/strided_slice_2/stackConst"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_1Const"/device:CPU:0*
valueB: *
dtype0*
_output_shapes
:

Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_2Const"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
ú
=report_uninitialized_variables_1/boolean_mask/strided_slice_2StridedSlice5report_uninitialized_variables_1/boolean_mask/Shape_2Creport_uninitialized_variables_1/boolean_mask/strided_slice_2/stackEreport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_1Ereport_uninitialized_variables_1/boolean_mask/strided_slice_2/stack_2"/device:CPU:0*
T0*
Index0*
shrink_axis_mask *
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask*
_output_shapes
: 
Â
=report_uninitialized_variables_1/boolean_mask/concat/values_1Pack2report_uninitialized_variables_1/boolean_mask/Prod"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:

9report_uninitialized_variables_1/boolean_mask/concat/axisConst"/device:CPU:0*
dtype0*
_output_shapes
: *
value	B : 

4report_uninitialized_variables_1/boolean_mask/concatConcatV2=report_uninitialized_variables_1/boolean_mask/strided_slice_1=report_uninitialized_variables_1/boolean_mask/concat/values_1=report_uninitialized_variables_1/boolean_mask/strided_slice_29report_uninitialized_variables_1/boolean_mask/concat/axis"/device:CPU:0*

Tidx0*
T0*
N*
_output_shapes
:
ŕ
5report_uninitialized_variables_1/boolean_mask/ReshapeReshape&report_uninitialized_variables_1/Const4report_uninitialized_variables_1/boolean_mask/concat"/device:CPU:0*
T0*
Tshape0*
_output_shapes
:&

=report_uninitialized_variables_1/boolean_mask/Reshape_1/shapeConst"/device:CPU:0*
dtype0*
_output_shapes
:*
valueB:
˙˙˙˙˙˙˙˙˙
đ
7report_uninitialized_variables_1/boolean_mask/Reshape_1Reshape+report_uninitialized_variables_1/LogicalNot=report_uninitialized_variables_1/boolean_mask/Reshape_1/shape"/device:CPU:0*
T0
*
Tshape0*
_output_shapes
:&
ś
3report_uninitialized_variables_1/boolean_mask/WhereWhere7report_uninitialized_variables_1/boolean_mask/Reshape_1"/device:CPU:0*
T0
*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
É
5report_uninitialized_variables_1/boolean_mask/SqueezeSqueeze3report_uninitialized_variables_1/boolean_mask/Where"/device:CPU:0*
squeeze_dims
*
T0	*#
_output_shapes
:˙˙˙˙˙˙˙˙˙

;report_uninitialized_variables_1/boolean_mask/GatherV2/axisConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
ß
6report_uninitialized_variables_1/boolean_mask/GatherV2GatherV25report_uninitialized_variables_1/boolean_mask/Reshape5report_uninitialized_variables_1/boolean_mask/Squeeze;report_uninitialized_variables_1/boolean_mask/GatherV2/axis"/device:CPU:0*

batch_dims *
Tindices0	*
Tparams0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
Taxis0
x
&report_uninitialized_resources_1/ConstConst"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
O
concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
Ć
concat_1ConcatV26report_uninitialized_variables_1/boolean_mask/GatherV2&report_uninitialized_resources_1/Constconcat_1/axis*
N*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tidx0*
T0
.
init_2NoOp^count_1/Assign^total/Assign

init_all_tablesNoOp

init_3NoOp
8
group_deps_1NoOp^init_2^init_3^init_all_tables
K
Merge/MergeSummaryMergeSummaryloss_1*
N*
_output_shapes
: 
Y
save/filename/inputConst*
dtype0*
_output_shapes
: *
valueB Bmodel
n
save/filenamePlaceholderWithDefaultsave/filename/input*
shape: *
dtype0*
_output_shapes
: 
e

save/ConstPlaceholderWithDefaultsave/filename*
dtype0*
_output_shapes
: *
shape: 

save/StringJoin/inputs_1Const*
dtype0*
_output_shapes
: *<
value3B1 B+_temp_c27a82aab15a477c921e2cf5d734503e/part
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
dtype0*
_output_shapes
: *
value	B : 

save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
ś
save/SaveV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:&*Ú
valueĐBÍ&BAdam/beta_1BAdam/beta_2B
Adam/decayBAdam/iterationsBAdam/lrBconv2d/biasBconv2d/kernelBconv2d_1/biasBconv2d_1/kernelB
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelBglobal_stepBtraining/VariableBtraining/Variable_1Btraining/Variable_10Btraining/Variable_11Btraining/Variable_12Btraining/Variable_13Btraining/Variable_14Btraining/Variable_15Btraining/Variable_16Btraining/Variable_17Btraining/Variable_18Btraining/Variable_19Btraining/Variable_2Btraining/Variable_20Btraining/Variable_21Btraining/Variable_22Btraining/Variable_23Btraining/Variable_3Btraining/Variable_4Btraining/Variable_5Btraining/Variable_6Btraining/Variable_7Btraining/Variable_8Btraining/Variable_9
ž
save/SaveV2/shape_and_slicesConst"/device:CPU:0*_
valueVBT&B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:&
Ń
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp#Adam/iterations/Read/ReadVariableOpAdam/lr/Read/ReadVariableOpconv2d/bias/Read/ReadVariableOp!conv2d/kernel/Read/ReadVariableOp!conv2d_1/bias/Read/ReadVariableOp#conv2d_1/kernel/Read/ReadVariableOpdense/bias/Read/ReadVariableOp dense/kernel/Read/ReadVariableOp dense_1/bias/Read/ReadVariableOp"dense_1/kernel/Read/ReadVariableOpglobal_step%training/Variable/Read/ReadVariableOp'training/Variable_1/Read/ReadVariableOp(training/Variable_10/Read/ReadVariableOp(training/Variable_11/Read/ReadVariableOp(training/Variable_12/Read/ReadVariableOp(training/Variable_13/Read/ReadVariableOp(training/Variable_14/Read/ReadVariableOp(training/Variable_15/Read/ReadVariableOp(training/Variable_16/Read/ReadVariableOp(training/Variable_17/Read/ReadVariableOp(training/Variable_18/Read/ReadVariableOp(training/Variable_19/Read/ReadVariableOp'training/Variable_2/Read/ReadVariableOp(training/Variable_20/Read/ReadVariableOp(training/Variable_21/Read/ReadVariableOp(training/Variable_22/Read/ReadVariableOp(training/Variable_23/Read/ReadVariableOp'training/Variable_3/Read/ReadVariableOp'training/Variable_4/Read/ReadVariableOp'training/Variable_5/Read/ReadVariableOp'training/Variable_6/Read/ReadVariableOp'training/Variable_7/Read/ReadVariableOp'training/Variable_8/Read/ReadVariableOp'training/Variable_9/Read/ReadVariableOp"/device:CPU:0*4
dtypes*
(2&		
 
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
Ź
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:

save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(

save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 
š
save/RestoreV2/tensor_namesConst"/device:CPU:0*Ú
valueĐBÍ&BAdam/beta_1BAdam/beta_2B
Adam/decayBAdam/iterationsBAdam/lrBconv2d/biasBconv2d/kernelBconv2d_1/biasBconv2d_1/kernelB
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelBglobal_stepBtraining/VariableBtraining/Variable_1Btraining/Variable_10Btraining/Variable_11Btraining/Variable_12Btraining/Variable_13Btraining/Variable_14Btraining/Variable_15Btraining/Variable_16Btraining/Variable_17Btraining/Variable_18Btraining/Variable_19Btraining/Variable_2Btraining/Variable_20Btraining/Variable_21Btraining/Variable_22Btraining/Variable_23Btraining/Variable_3Btraining/Variable_4Btraining/Variable_5Btraining/Variable_6Btraining/Variable_7Btraining/Variable_8Btraining/Variable_9*
dtype0*
_output_shapes
:&
Á
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:&*_
valueVBT&B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 
Ű
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*Ž
_output_shapes
::::::::::::::::::::::::::::::::::::::*4
dtypes*
(2&		
N
save/Identity_1Identitysave/RestoreV2*
T0*
_output_shapes
:
T
save/AssignVariableOpAssignVariableOpAdam/beta_1save/Identity_1*
dtype0
P
save/Identity_2Identitysave/RestoreV2:1*
T0*
_output_shapes
:
V
save/AssignVariableOp_1AssignVariableOpAdam/beta_2save/Identity_2*
dtype0
P
save/Identity_3Identitysave/RestoreV2:2*
_output_shapes
:*
T0
U
save/AssignVariableOp_2AssignVariableOp
Adam/decaysave/Identity_3*
dtype0
P
save/Identity_4Identitysave/RestoreV2:3*
_output_shapes
:*
T0	
Z
save/AssignVariableOp_3AssignVariableOpAdam/iterationssave/Identity_4*
dtype0	
P
save/Identity_5Identitysave/RestoreV2:4*
T0*
_output_shapes
:
R
save/AssignVariableOp_4AssignVariableOpAdam/lrsave/Identity_5*
dtype0
P
save/Identity_6Identitysave/RestoreV2:5*
T0*
_output_shapes
:
V
save/AssignVariableOp_5AssignVariableOpconv2d/biassave/Identity_6*
dtype0
P
save/Identity_7Identitysave/RestoreV2:6*
T0*
_output_shapes
:
X
save/AssignVariableOp_6AssignVariableOpconv2d/kernelsave/Identity_7*
dtype0
P
save/Identity_8Identitysave/RestoreV2:7*
T0*
_output_shapes
:
X
save/AssignVariableOp_7AssignVariableOpconv2d_1/biassave/Identity_8*
dtype0
P
save/Identity_9Identitysave/RestoreV2:8*
T0*
_output_shapes
:
Z
save/AssignVariableOp_8AssignVariableOpconv2d_1/kernelsave/Identity_9*
dtype0
Q
save/Identity_10Identitysave/RestoreV2:9*
_output_shapes
:*
T0
V
save/AssignVariableOp_9AssignVariableOp
dense/biassave/Identity_10*
dtype0
R
save/Identity_11Identitysave/RestoreV2:10*
_output_shapes
:*
T0
Y
save/AssignVariableOp_10AssignVariableOpdense/kernelsave/Identity_11*
dtype0
R
save/Identity_12Identitysave/RestoreV2:11*
T0*
_output_shapes
:
Y
save/AssignVariableOp_11AssignVariableOpdense_1/biassave/Identity_12*
dtype0
R
save/Identity_13Identitysave/RestoreV2:12*
T0*
_output_shapes
:
[
save/AssignVariableOp_12AssignVariableOpdense_1/kernelsave/Identity_13*
dtype0

save/AssignAssignglobal_stepsave/RestoreV2:13*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
R
save/Identity_14Identitysave/RestoreV2:14*
T0*
_output_shapes
:
^
save/AssignVariableOp_13AssignVariableOptraining/Variablesave/Identity_14*
dtype0
R
save/Identity_15Identitysave/RestoreV2:15*
T0*
_output_shapes
:
`
save/AssignVariableOp_14AssignVariableOptraining/Variable_1save/Identity_15*
dtype0
R
save/Identity_16Identitysave/RestoreV2:16*
T0*
_output_shapes
:
a
save/AssignVariableOp_15AssignVariableOptraining/Variable_10save/Identity_16*
dtype0
R
save/Identity_17Identitysave/RestoreV2:17*
T0*
_output_shapes
:
a
save/AssignVariableOp_16AssignVariableOptraining/Variable_11save/Identity_17*
dtype0
R
save/Identity_18Identitysave/RestoreV2:18*
T0*
_output_shapes
:
a
save/AssignVariableOp_17AssignVariableOptraining/Variable_12save/Identity_18*
dtype0
R
save/Identity_19Identitysave/RestoreV2:19*
T0*
_output_shapes
:
a
save/AssignVariableOp_18AssignVariableOptraining/Variable_13save/Identity_19*
dtype0
R
save/Identity_20Identitysave/RestoreV2:20*
T0*
_output_shapes
:
a
save/AssignVariableOp_19AssignVariableOptraining/Variable_14save/Identity_20*
dtype0
R
save/Identity_21Identitysave/RestoreV2:21*
T0*
_output_shapes
:
a
save/AssignVariableOp_20AssignVariableOptraining/Variable_15save/Identity_21*
dtype0
R
save/Identity_22Identitysave/RestoreV2:22*
T0*
_output_shapes
:
a
save/AssignVariableOp_21AssignVariableOptraining/Variable_16save/Identity_22*
dtype0
R
save/Identity_23Identitysave/RestoreV2:23*
T0*
_output_shapes
:
a
save/AssignVariableOp_22AssignVariableOptraining/Variable_17save/Identity_23*
dtype0
R
save/Identity_24Identitysave/RestoreV2:24*
T0*
_output_shapes
:
a
save/AssignVariableOp_23AssignVariableOptraining/Variable_18save/Identity_24*
dtype0
R
save/Identity_25Identitysave/RestoreV2:25*
_output_shapes
:*
T0
a
save/AssignVariableOp_24AssignVariableOptraining/Variable_19save/Identity_25*
dtype0
R
save/Identity_26Identitysave/RestoreV2:26*
T0*
_output_shapes
:
`
save/AssignVariableOp_25AssignVariableOptraining/Variable_2save/Identity_26*
dtype0
R
save/Identity_27Identitysave/RestoreV2:27*
_output_shapes
:*
T0
a
save/AssignVariableOp_26AssignVariableOptraining/Variable_20save/Identity_27*
dtype0
R
save/Identity_28Identitysave/RestoreV2:28*
T0*
_output_shapes
:
a
save/AssignVariableOp_27AssignVariableOptraining/Variable_21save/Identity_28*
dtype0
R
save/Identity_29Identitysave/RestoreV2:29*
_output_shapes
:*
T0
a
save/AssignVariableOp_28AssignVariableOptraining/Variable_22save/Identity_29*
dtype0
R
save/Identity_30Identitysave/RestoreV2:30*
_output_shapes
:*
T0
a
save/AssignVariableOp_29AssignVariableOptraining/Variable_23save/Identity_30*
dtype0
R
save/Identity_31Identitysave/RestoreV2:31*
T0*
_output_shapes
:
`
save/AssignVariableOp_30AssignVariableOptraining/Variable_3save/Identity_31*
dtype0
R
save/Identity_32Identitysave/RestoreV2:32*
T0*
_output_shapes
:
`
save/AssignVariableOp_31AssignVariableOptraining/Variable_4save/Identity_32*
dtype0
R
save/Identity_33Identitysave/RestoreV2:33*
T0*
_output_shapes
:
`
save/AssignVariableOp_32AssignVariableOptraining/Variable_5save/Identity_33*
dtype0
R
save/Identity_34Identitysave/RestoreV2:34*
T0*
_output_shapes
:
`
save/AssignVariableOp_33AssignVariableOptraining/Variable_6save/Identity_34*
dtype0
R
save/Identity_35Identitysave/RestoreV2:35*
T0*
_output_shapes
:
`
save/AssignVariableOp_34AssignVariableOptraining/Variable_7save/Identity_35*
dtype0
R
save/Identity_36Identitysave/RestoreV2:36*
T0*
_output_shapes
:
`
save/AssignVariableOp_35AssignVariableOptraining/Variable_8save/Identity_36*
dtype0
R
save/Identity_37Identitysave/RestoreV2:37*
T0*
_output_shapes
:
`
save/AssignVariableOp_36AssignVariableOptraining/Variable_9save/Identity_37*
dtype0

save/restore_shardNoOp^save/Assign^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_10^save/AssignVariableOp_11^save/AssignVariableOp_12^save/AssignVariableOp_13^save/AssignVariableOp_14^save/AssignVariableOp_15^save/AssignVariableOp_16^save/AssignVariableOp_17^save/AssignVariableOp_18^save/AssignVariableOp_19^save/AssignVariableOp_2^save/AssignVariableOp_20^save/AssignVariableOp_21^save/AssignVariableOp_22^save/AssignVariableOp_23^save/AssignVariableOp_24^save/AssignVariableOp_25^save/AssignVariableOp_26^save/AssignVariableOp_27^save/AssignVariableOp_28^save/AssignVariableOp_29^save/AssignVariableOp_3^save/AssignVariableOp_30^save/AssignVariableOp_31^save/AssignVariableOp_32^save/AssignVariableOp_33^save/AssignVariableOp_34^save/AssignVariableOp_35^save/AssignVariableOp_36^save/AssignVariableOp_4^save/AssignVariableOp_5^save/AssignVariableOp_6^save/AssignVariableOp_7^save/AssignVariableOp_8^save/AssignVariableOp_9
-
save/restore_allNoOp^save/restore_shardˇ!
ŕ
`
/__inference_Dataset_flat_map_read_one_file_1028

args_0
identity˘TFRecordDatasetQ
compression_typeConst*
valueB B *
dtype0*
_output_shapes
: O
buffer_sizeConst*
dtype0	*
_output_shapes
: *
valueB		 Rs
TFRecordDatasetTFRecordDatasetargs_0compression_type:output:0buffer_size:output:0*
_output_shapes
: a
IdentityIdentityTFRecordDataset:handle:0^TFRecordDataset*
T0*
_output_shapes
: "
identityIdentity:output:0*
_input_shapes
: 2"
TFRecordDatasetTFRecordDataset:& "
 
_user_specified_nameargs_0
Ń
R
&__inference_Dataset_map__parse_fn_1061

args_0
identity

identity_1^
ParseSingleExample/key_depthConst*
value	B	 R *
dtype0	*
_output_shapes
: c
 ParseSingleExample/Reshape/shapeConst*
valueB *
dtype0*
_output_shapes
: Ś
ParseSingleExample/ReshapeReshape%ParseSingleExample/key_depth:output:0)ParseSingleExample/Reshape/shape:output:0*
_output_shapes
: *
T0	*
Tshape0_
ParseSingleExample/key_heightConst*
value	B	 R *
dtype0	*
_output_shapes
: e
"ParseSingleExample/Reshape_1/shapeConst*
valueB *
dtype0*
_output_shapes
: Ť
ParseSingleExample/Reshape_1Reshape&ParseSingleExample/key_height:output:0+ParseSingleExample/Reshape_1/shape:output:0*
T0	*
Tshape0*
_output_shapes
: a
 ParseSingleExample/key_image_rawConst*
valueB B *
dtype0*
_output_shapes
: e
"ParseSingleExample/Reshape_2/shapeConst*
valueB *
dtype0*
_output_shapes
: Ž
ParseSingleExample/Reshape_2Reshape)ParseSingleExample/key_image_raw:output:0+ParseSingleExample/Reshape_2/shape:output:0*
T0*
Tshape0*
_output_shapes
: ^
ParseSingleExample/key_labelConst*
value	B	 R *
dtype0	*
_output_shapes
: e
"ParseSingleExample/Reshape_3/shapeConst*
valueB *
dtype0*
_output_shapes
: Ş
ParseSingleExample/Reshape_3Reshape%ParseSingleExample/key_label:output:0+ParseSingleExample/Reshape_3/shape:output:0*
_output_shapes
: *
T0	*
Tshape0^
ParseSingleExample/key_widthConst*
dtype0	*
_output_shapes
: *
value	B	 R e
"ParseSingleExample/Reshape_4/shapeConst*
valueB *
dtype0*
_output_shapes
: Ş
ParseSingleExample/Reshape_4Reshape%ParseSingleExample/key_width:output:0+ParseSingleExample/Reshape_4/shape:output:0*
_output_shapes
: *
T0	*
Tshape0Ę
%ParseSingleExample/ParseSingleExampleParseSingleExampleargs_0#ParseSingleExample/Reshape:output:0%ParseSingleExample/Reshape_1:output:0%ParseSingleExample/Reshape_2:output:0%ParseSingleExample/Reshape_3:output:0%ParseSingleExample/Reshape_4:output:0*8

dense_keys*
(depthheight	image_rawlabelwidth*
_output_shapes

: : : : : *
sparse_types
 *
dense_shapes

: : : : : *
sparse_keys
 *
Tdense	
2				*

num_sparse 
	DecodeRaw	DecodeRaw4ParseSingleExample/ParseSingleExample:dense_values:2*
little_endian(*
out_type0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙
Reshape/CastCast4ParseSingleExample/ParseSingleExample:dense_values:1*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
: 
Reshape/Cast_1Cast4ParseSingleExample/ParseSingleExample:dense_values:4*
Truncate( *

DstT0*
_output_shapes
: *

SrcT0	
Reshape/Cast_2Cast4ParseSingleExample/ParseSingleExample:dense_values:0*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
: 
Reshape/shapePackReshape/Cast:y:0Reshape/Cast_1:y:0Reshape/Cast_2:y:0*
N*
_output_shapes
:*
T0*

axis y
ReshapeReshapeDecodeRaw:output:0Reshape/shape:output:0*
T0*
Tshape0*"
_output_shapes
:
CastCast4ParseSingleExample/ParseSingleExample:dense_values:3*

SrcT0	*
Truncate( *

DstT0*
_output_shapes
: S
IdentityIdentityReshape:output:0*"
_output_shapes
:*
T0A

Identity_1IdentityCast:y:0*
T0*
_output_shapes
: "
identityIdentity:output:0"!

identity_1Identity_1:output:0*
_input_shapes
: :& "
 
_user_specified_nameargs_0"&<
save/Const:0save/Identity:0save/restore_all (5 @F8"2
global_step_read_op_cache

global_step/add:0"m
global_step^\
Z
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0H"
	iterators

IteratorV2:0"&

summary_op

Merge/MergeSummary:0""
trainable_variablesë!č!
j
conv2d/kernel:0AssignVariableOp_6#conv2d/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_6:08
f
conv2d/bias:0AssignVariableOp_5!conv2d/bias/Read/ReadVariableOp:0(2checkpoint_initializer_5:08
n
conv2d_1/kernel:0AssignVariableOp_8%conv2d_1/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_8:08
j
conv2d_1/bias:0AssignVariableOp_7#conv2d_1/bias/Read/ReadVariableOp:0(2checkpoint_initializer_7:08
j
dense/kernel:0AssignVariableOp_10"dense/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_10:08
d
dense/bias:0AssignVariableOp_9 dense/bias/Read/ReadVariableOp:0(2checkpoint_initializer_9:08
n
dense_1/kernel:0AssignVariableOp_12$dense_1/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_12:08
j
dense_1/bias:0AssignVariableOp_11"dense_1/bias/Read/ReadVariableOp:0(2checkpoint_initializer_11:08
n
Adam/iterations:0AssignVariableOp_3%Adam/iterations/Read/ReadVariableOp:0(2checkpoint_initializer_3:08
^
	Adam/lr:0AssignVariableOp_4Adam/lr/Read/ReadVariableOp:0(2checkpoint_initializer_4:08
b
Adam/beta_1:0AssignVariableOp!Adam/beta_1/Read/ReadVariableOp:0(2checkpoint_initializer:08
f
Adam/beta_2:0AssignVariableOp_1!Adam/beta_2/Read/ReadVariableOp:0(2checkpoint_initializer_1:08
d
Adam/decay:0AssignVariableOp_2 Adam/decay/Read/ReadVariableOp:0(2checkpoint_initializer_2:08
t
training/Variable:0AssignVariableOp_13'training/Variable/Read/ReadVariableOp:0(2checkpoint_initializer_13:08
x
training/Variable_1:0AssignVariableOp_14)training/Variable_1/Read/ReadVariableOp:0(2checkpoint_initializer_14:08
x
training/Variable_2:0AssignVariableOp_25)training/Variable_2/Read/ReadVariableOp:0(2checkpoint_initializer_25:08
x
training/Variable_3:0AssignVariableOp_30)training/Variable_3/Read/ReadVariableOp:0(2checkpoint_initializer_30:08
x
training/Variable_4:0AssignVariableOp_31)training/Variable_4/Read/ReadVariableOp:0(2checkpoint_initializer_31:08
x
training/Variable_5:0AssignVariableOp_32)training/Variable_5/Read/ReadVariableOp:0(2checkpoint_initializer_32:08
x
training/Variable_6:0AssignVariableOp_33)training/Variable_6/Read/ReadVariableOp:0(2checkpoint_initializer_33:08
x
training/Variable_7:0AssignVariableOp_34)training/Variable_7/Read/ReadVariableOp:0(2checkpoint_initializer_34:08
x
training/Variable_8:0AssignVariableOp_35)training/Variable_8/Read/ReadVariableOp:0(2checkpoint_initializer_35:08
x
training/Variable_9:0AssignVariableOp_36)training/Variable_9/Read/ReadVariableOp:0(2checkpoint_initializer_36:08
z
training/Variable_10:0AssignVariableOp_15*training/Variable_10/Read/ReadVariableOp:0(2checkpoint_initializer_15:08
z
training/Variable_11:0AssignVariableOp_16*training/Variable_11/Read/ReadVariableOp:0(2checkpoint_initializer_16:08
z
training/Variable_12:0AssignVariableOp_17*training/Variable_12/Read/ReadVariableOp:0(2checkpoint_initializer_17:08
z
training/Variable_13:0AssignVariableOp_18*training/Variable_13/Read/ReadVariableOp:0(2checkpoint_initializer_18:08
z
training/Variable_14:0AssignVariableOp_19*training/Variable_14/Read/ReadVariableOp:0(2checkpoint_initializer_19:08
z
training/Variable_15:0AssignVariableOp_20*training/Variable_15/Read/ReadVariableOp:0(2checkpoint_initializer_20:08
z
training/Variable_16:0AssignVariableOp_21*training/Variable_16/Read/ReadVariableOp:0(2checkpoint_initializer_21:08
z
training/Variable_17:0AssignVariableOp_22*training/Variable_17/Read/ReadVariableOp:0(2checkpoint_initializer_22:08
z
training/Variable_18:0AssignVariableOp_23*training/Variable_18/Read/ReadVariableOp:0(2checkpoint_initializer_23:08
z
training/Variable_19:0AssignVariableOp_24*training/Variable_19/Read/ReadVariableOp:0(2checkpoint_initializer_24:08
z
training/Variable_20:0AssignVariableOp_26*training/Variable_20/Read/ReadVariableOp:0(2checkpoint_initializer_26:08
z
training/Variable_21:0AssignVariableOp_27*training/Variable_21/Read/ReadVariableOp:0(2checkpoint_initializer_27:08
z
training/Variable_22:0AssignVariableOp_28*training/Variable_22/Read/ReadVariableOp:0(2checkpoint_initializer_28:08
z
training/Variable_23:0AssignVariableOp_29*training/Variable_23/Read/ReadVariableOp:0(2checkpoint_initializer_29:08"
	summaries


loss_1:0")
ready_for_local_init_op


concat_1:0"
init_op


group_deps"Č
cond_contextˇ´
Ć
global_step/cond/cond_textglobal_step/cond/pred_id:0global_step/cond/switch_t:0 *ě
global_step/cond/pred_id:0
global_step/cond/read/Switch:1
global_step/cond/read:0
global_step/cond/switch_t:0
global_step:0/
global_step:0global_step/cond/read/Switch:18
global_step/cond/pred_id:0global_step/cond/pred_id:0
č
global_step/cond/cond_text_1global_step/cond/pred_id:0global_step/cond/switch_f:0*
global_step/Initializer/zeros:0
global_step/cond/Switch_1:0
global_step/cond/Switch_1:1
global_step/cond/pred_id:0
global_step/cond/switch_f:0>
global_step/Initializer/zeros:0global_step/cond/Switch_1:08
global_step/cond/pred_id:0global_step/cond/pred_id:0"Î
metric_variablesšś
]
	count_1:0count_1/Assigncount_1/Read/ReadVariableOp:0(2count_1/Initializer/zeros:0@H
U
total:0total/Assigntotal/Read/ReadVariableOp:0(2total/Initializer/zeros:0@H"Í
local_variablesšś
]
	count_1:0count_1/Assigncount_1/Read/ReadVariableOp:0(2count_1/Initializer/zeros:0@H
U
total:0total/Assigntotal/Read/ReadVariableOp:0(2total/Initializer/zeros:0@H"!
local_init_op

group_deps_1"Ő"
	variablesÇ"Ä"
Z
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0H
j
conv2d/kernel:0AssignVariableOp_6#conv2d/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_6:08
f
conv2d/bias:0AssignVariableOp_5!conv2d/bias/Read/ReadVariableOp:0(2checkpoint_initializer_5:08
n
conv2d_1/kernel:0AssignVariableOp_8%conv2d_1/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_8:08
j
conv2d_1/bias:0AssignVariableOp_7#conv2d_1/bias/Read/ReadVariableOp:0(2checkpoint_initializer_7:08
j
dense/kernel:0AssignVariableOp_10"dense/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_10:08
d
dense/bias:0AssignVariableOp_9 dense/bias/Read/ReadVariableOp:0(2checkpoint_initializer_9:08
n
dense_1/kernel:0AssignVariableOp_12$dense_1/kernel/Read/ReadVariableOp:0(2checkpoint_initializer_12:08
j
dense_1/bias:0AssignVariableOp_11"dense_1/bias/Read/ReadVariableOp:0(2checkpoint_initializer_11:08
n
Adam/iterations:0AssignVariableOp_3%Adam/iterations/Read/ReadVariableOp:0(2checkpoint_initializer_3:08
^
	Adam/lr:0AssignVariableOp_4Adam/lr/Read/ReadVariableOp:0(2checkpoint_initializer_4:08
b
Adam/beta_1:0AssignVariableOp!Adam/beta_1/Read/ReadVariableOp:0(2checkpoint_initializer:08
f
Adam/beta_2:0AssignVariableOp_1!Adam/beta_2/Read/ReadVariableOp:0(2checkpoint_initializer_1:08
d
Adam/decay:0AssignVariableOp_2 Adam/decay/Read/ReadVariableOp:0(2checkpoint_initializer_2:08
t
training/Variable:0AssignVariableOp_13'training/Variable/Read/ReadVariableOp:0(2checkpoint_initializer_13:08
x
training/Variable_1:0AssignVariableOp_14)training/Variable_1/Read/ReadVariableOp:0(2checkpoint_initializer_14:08
x
training/Variable_2:0AssignVariableOp_25)training/Variable_2/Read/ReadVariableOp:0(2checkpoint_initializer_25:08
x
training/Variable_3:0AssignVariableOp_30)training/Variable_3/Read/ReadVariableOp:0(2checkpoint_initializer_30:08
x
training/Variable_4:0AssignVariableOp_31)training/Variable_4/Read/ReadVariableOp:0(2checkpoint_initializer_31:08
x
training/Variable_5:0AssignVariableOp_32)training/Variable_5/Read/ReadVariableOp:0(2checkpoint_initializer_32:08
x
training/Variable_6:0AssignVariableOp_33)training/Variable_6/Read/ReadVariableOp:0(2checkpoint_initializer_33:08
x
training/Variable_7:0AssignVariableOp_34)training/Variable_7/Read/ReadVariableOp:0(2checkpoint_initializer_34:08
x
training/Variable_8:0AssignVariableOp_35)training/Variable_8/Read/ReadVariableOp:0(2checkpoint_initializer_35:08
x
training/Variable_9:0AssignVariableOp_36)training/Variable_9/Read/ReadVariableOp:0(2checkpoint_initializer_36:08
z
training/Variable_10:0AssignVariableOp_15*training/Variable_10/Read/ReadVariableOp:0(2checkpoint_initializer_15:08
z
training/Variable_11:0AssignVariableOp_16*training/Variable_11/Read/ReadVariableOp:0(2checkpoint_initializer_16:08
z
training/Variable_12:0AssignVariableOp_17*training/Variable_12/Read/ReadVariableOp:0(2checkpoint_initializer_17:08
z
training/Variable_13:0AssignVariableOp_18*training/Variable_13/Read/ReadVariableOp:0(2checkpoint_initializer_18:08
z
training/Variable_14:0AssignVariableOp_19*training/Variable_14/Read/ReadVariableOp:0(2checkpoint_initializer_19:08
z
training/Variable_15:0AssignVariableOp_20*training/Variable_15/Read/ReadVariableOp:0(2checkpoint_initializer_20:08
z
training/Variable_16:0AssignVariableOp_21*training/Variable_16/Read/ReadVariableOp:0(2checkpoint_initializer_21:08
z
training/Variable_17:0AssignVariableOp_22*training/Variable_17/Read/ReadVariableOp:0(2checkpoint_initializer_22:08
z
training/Variable_18:0AssignVariableOp_23*training/Variable_18/Read/ReadVariableOp:0(2checkpoint_initializer_23:08
z
training/Variable_19:0AssignVariableOp_24*training/Variable_19/Read/ReadVariableOp:0(2checkpoint_initializer_24:08
z
training/Variable_20:0AssignVariableOp_26*training/Variable_20/Read/ReadVariableOp:0(2checkpoint_initializer_26:08
z
training/Variable_21:0AssignVariableOp_27*training/Variable_21/Read/ReadVariableOp:0(2checkpoint_initializer_27:08
z
training/Variable_22:0AssignVariableOp_28*training/Variable_22/Read/ReadVariableOp:0(2checkpoint_initializer_28:08
z
training/Variable_23:0AssignVariableOp_29*training/Variable_23/Read/ReadVariableOp:0(2checkpoint_initializer_29:08"
ready_op


concat:0"J
savers@>
<
save/Const:0save/Identity:0save/restore_all (5 @F8"
losses


loss/mul:0űČ¸ž$       B+M	Ćjt¨íH×A:model_save/model.ckptíMśź       mS+		Ş.¨íH×A:`Dç       ČÁ	1¨íH×A*

loss_1CÁBkf&       sOă 	DJĎ¨íH×A
:model_save/model.ckptŰ:$