
macro constant_table(name, values)
    @assert(values.head === :block)
    const_decls = map(values.args) do x
        if isa(x,Expr) && x.head === :(=)
            quote
                $(Expr(:const, esc(x)))
                $(esc(name))[$(esc(x.args[1]))] = $(QuoteNode(x.args[1]))
            end
        else
            x
        end
    end
    quote
        $(esc(name)) = Dict{Int,Symbol}()
        $(const_decls...)
    end
end

@constant_table Ops begin
    OpNop = 0
    OpUndef = 1
    OpSourceContinued = 2
    OpSource = 3
    OpSourceExtension = 4
    OpName = 5
    OpMemberName = 6
    OpString = 7
    OpLine = 8
    OpExtension = 10
    OpExtInstImport = 11
    OpExtInst = 12
    OpMemoryModel = 14
    OpEntryPoint = 15
    OpExecutionMode = 16
    OpCapability = 17
    OpTypeVoid = 19
    OpTypeBool = 20
    OpTypeInt = 21
    OpTypeFloat = 22
    OpTypeVector = 23
    OpTypeMatrix = 24
    OpTypeImage = 25
    OpTypeSampler = 26
    OpTypeSampledImage = 27
    OpTypeArray = 28
    OpTypeRuntimeArray = 29
    OpTypeStruct = 30
    OpTypeOpaque = 31
    OpTypePointer = 32
    OpTypeFunction = 33
    OpTypeEvent = 34
    OpTypeDeviceEvent = 35
    OpTypeReserveId = 36
    OpTypeQueue = 37
    OpTypePipe = 38
    OpTypeForwardPointer = 39
    OpConstantTrue = 41
    OpConstantFalse = 42
    OpConstant = 43
    OpConstantComposite = 44
    OpConstantSampler = 45
    OpConstantNull = 46
    OpSpecConstantTrue = 48
    OpSpecConstantFalse = 49
    OpSpecConstant = 50
    OpSpecConstantComposite = 51
    OpSpecConstantOp = 52
    OpFunction = 54
    OpFunctionParameter = 55
    OpFunctionEnd = 56
    OpFunctionCall = 57
    OpVariable = 59
    OpImageTexelPointer = 60
    OpLoad = 61
    OpStore = 62
    OpCopyMemory = 63
    OpCopyMemorySized = 64
    OpAccessChain = 65
    OpInBoundsAccessChain = 66
    OpPtrAccessChain = 67
    OpArrayLength = 68
    OpGenericPtrMemSemantics = 69
    OpInBoundsPtrAccessChain = 70
    OpDecorate = 71
    OpMemberDecorate = 72
    OpDecorationGroup = 73
    OpGroupDecorate = 74
    OpGroupMemberDecorate = 75
    OpVectorExtractDynamic = 77
    OpVectorInsertDynamic = 78
    OpVectorShuffle = 79
    OpCompositeConstruct = 80
    OpCompositeExtract = 81
    OpCompositeInsert = 82
    OpCopyObject = 83
    OpTranspose = 84
    OpSampledImage = 86
    OpImageSampleImplicitLod = 87
    OpImageSampleExplicitLod = 88
    OpImageSampleDrefImplicitLod = 89
    OpImageSampleDrefExplicitLod = 90
    OpImageSampleProjImplicitLod = 91
    OpImageSampleProjExplicitLod = 92
    OpImageSampleProjDrefImplicitLod = 93
    OpImageSampleProjDrefExplicitLod = 94
    OpImageFetch = 95
    OpImageGather = 96
    OpImageDrefGather = 97
    OpImageRead = 98
    OpImageWrite = 99
    OpImage = 100
    OpImageQueryFormat = 101
    OpImageQueryOrder = 102
    OpImageQuerySizeLod = 103
    OpImageQuerySize = 104
    OpImageQueryLod = 105
    OpImageQueryLevels = 106
    OpImageQuerySamples = 107
    OpConvertFToU = 109
    OpConvertFToS = 110
    OpConvertSToF = 111
    OpConvertUToF = 112
    OpUConvert = 113
    OpSConvert = 114
    OpFConvert = 115
    OpQuantizeToF16 = 116
    OpConvertPtrToU = 117
    OpSatConvertSToU = 118
    OpSatConvertUToS = 119
    OpConvertUToPtr = 120
    OpPtrCastToGeneric = 121
    OpGenericCastToPtr = 122
    OpGenericCastToPtrExplicit = 123
    OpBitcast = 124
    OpSNegate = 126
    OpFNegate = 127
    OpIAdd = 128
    OpFAdd = 129
    OpISub = 130
    OpFSub = 131
    OpIMul = 132
    OpFMul = 133
    OpUDiv = 134
    OpSDiv = 135
    OpFDiv = 136
    OpUMod = 137
    OpSRem = 138
    OpSMod = 139
    OpFRem = 140
    OpFMod = 141
    OpVectorTimesScalar = 142
    OpMatrixTimesScalar = 143
    OpVectorTimesMatrix = 144
    OpMatrixTimesVector = 145
    OpMatrixTimesMatrix = 146
    OpOuterProduct = 147
    OpDot = 148
    OpIAddCarry = 149
    OpISubBorrow = 150
    OpUMulExtended = 151
    OpSMulExtended = 152
    OpAny = 154
    OpAll = 155
    OpIsNan = 156
    OpIsInf = 157
    OpIsFinite = 158
    OpIsNormal = 159
    OpSignBitSet = 160
    OpLessOrGreater = 161
    OpOrdered = 162
    OpUnordered = 163
    OpLogicalEqual = 164
    OpLogicalNotEqual = 165
    OpLogicalOr = 166
    OpLogicalAnd = 167
    OpLogicalNot = 168
    OpSelect = 169
    OpIEqual = 170
    OpINotEqual = 171
    OpUGreaterThan = 172
    OpSGreaterThan = 173
    OpUGreaterThanEqual = 174
    OpSGreaterThanEqual = 175
    OpULessThan = 176
    OpSLessThan = 177
    OpULessThanEqual = 178
    OpSLessThanEqual = 179
    OpFOrdEqual = 180
    OpFUnordEqual = 181
    OpFOrdNotEqual = 182
    OpFUnordNotEqual = 183
    OpFOrdLessThan = 184
    OpFUnordLessThan = 185
    OpFOrdGreaterThan = 186
    OpFUnordGreaterThan = 187
    OpFOrdLessThanEqual = 188
    OpFUnordLessThanEqual = 189
    OpFOrdGreaterThanEqual = 190
    OpFUnordGreaterThanEqual = 191
    OpShiftRightLogical = 194
    OpShiftRightArithmetic = 195
    OpShiftLeftLogical = 196
    OpBitwiseOr = 197
    OpBitwiseXor = 198
    OpBitwiseAnd = 199
    OpNot = 200
    OpBitFieldInsert = 201
    OpBitFieldSExtract = 202
    OpBitFieldUExtract = 203
    OpBitReverse = 204
    OpBitCount = 205
    OpDPdx = 207
    OpDPdy = 208
    OpFwidth = 209
    OpDPdxFine = 210
    OpDPdyFine = 211
    OpFwidthFine = 212
    OpDPdxCoarse = 213
    OpDPdyCoarse = 214
    OpFwidthCoarse = 215
    OpEmitVertex = 218
    OpEndPrimitive = 219
    OpEmitStreamVertex = 220
    OpEndStreamPrimitive = 221
    OpControlBarrier = 224
    OpMemoryBarrier = 225
    OpAtomicLoad = 227
    OpAtomicStore = 228
    OpAtomicExchange = 229
    OpAtomicCompareExchange = 230
    OpAtomicCompareExchangeWeak = 231
    OpAtomicIIncrement = 232
    OpAtomicIDecrement = 233
    OpAtomicIAdd = 234
    OpAtomicISub = 235
    OpAtomicSMin = 236
    OpAtomicUMin = 237
    OpAtomicSMax = 238
    OpAtomicUMax = 239
    OpAtomicAnd = 240
    OpAtomicOr = 241
    OpAtomicXor = 242
    OpPhi = 245
    OpLoopMerge = 246
    OpSelectionMerge = 247
    OpLabel = 248
    OpBranch = 249
    OpBranchConditional = 250
    OpSwitch = 251
    OpKill = 252
    OpReturn = 253
    OpReturnValue = 254
    OpUnreachable = 255
    OpLifetimeStart = 256
    OpLifetimeStop = 257
    OpGroupAsyncCopy = 259
    OpGroupWaitEvents = 260
    OpGroupAll = 261
    OpGroupAny = 262
    OpGroupBroadcast = 263
    OpGroupIAdd = 264
    OpGroupFAdd = 265
    OpGroupFMin = 266
    OpGroupUMin = 267
    OpGroupSMin = 268
    OpGroupFMax = 269
    OpGroupUMax = 270
    OpGroupSMax = 271
    OpReadPipe = 274
    OpWritePipe = 275
    OpReservedReadPipe = 276
    OpReservedWritePipe = 277
    OpReserveReadPipePackets = 278
    OpReserveWritePipePackets = 279
    OpCommitReadPipe = 280
    OpCommitWritePipe = 281
    OpIsValidReserveId = 282
    OpGetNumPipePackets = 283
    OpGetMaxPipePackets = 284
    OpGroupReserveReadPipePackets = 285
    OpGroupReserveWritePipePackets = 286
    OpGroupCommitReadPipe = 287
    OpGroupCommitWritePipe = 288
    OpEnqueueMarker = 291
    OpEnqueueKernel = 292
    OpGetKernelNDrangeSubGroupCount = 293
    OpGetKernelNDrangeMaxSubGroupSize = 294
    OpGetKernelWorkGroupSize = 295
    OpGetKernelPreferredWorkGroupSizeMultiple = 296
    OpRetainEvent = 297
    OpReleaseEvent = 298
    OpCreateUserEvent = 299
    OpIsValidEvent = 300
    OpSetUserEventStatus = 301
    OpCaptureEventProfilingInfo = 302
    OpGetDefaultQueue = 303
    OpBuildNDRange = 304
    OpImageSparseSampleImplicitLod = 305
    OpImageSparseSampleExplicitLod = 306
    OpImageSparseSampleDrefImplicitLod = 307
    OpImageSparseSampleDrefExplicitLod = 308
    OpImageSparseSampleProjImplicitLod = 309
    OpImageSparseSampleProjExplicitLod = 310
    OpImageSparseSampleProjDrefImplicitLod = 311
    OpImageSparseSampleProjDrefExplicitLod = 312
    OpImageSparseFetch = 313
    OpImageSparseGather = 314
    OpImageSparseDrefGather = 315
    OpImageSparseTexelsResident = 316
    OpNoLine = 317
    OpAtomicFlagTestAndSet = 318
    OpAtomicFlagClear = 319
    OpImageSparseRead = 320
end