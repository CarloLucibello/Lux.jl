"""
    batched_matmul(x, y)

Computes the batched matrix multiplication of `x` and `y`.  For more details see the NNlib
documentation on `NNlib.batched_mul`. This function is mostly a wrapper around `batched_mul`
but attempts to be faster on CPUs.
"""
function batched_matmul(x::AbstractMatrix, y::AbstractArray{<:Number, 3})
    return batched_matmul(get_utils(:expand_batchdim)(x), y)
end

function batched_matmul(x::AbstractArray{<:Number, 3}, y::AbstractMatrix)
    return batched_matmul(x, get_utils(:expand_batchdim)(y))
end

function batched_matmul(x::AbstractArray{<:Number, 3}, y::AbstractArray{<:Number, 3})
    return get_impl(:batched_matmul)(x, y)
end
