mutable struct MVector5{T} <: AbstractVector{T}
    a::T
    b::T
    c::T
    d::T
    e::T
end
MVector5{T}(::UndefInitializer) where T = MVector5{T}()
function MVector5{T}() where T
    v = zero(T)
    MVector5{T}(v, v, v, v, v)
end

Base.size(::MVector5) = (5,)
Base.IndexStyle(::Type{<: MVector5}) = IndexLinear()
Base.getindex(A::MVector5, i::Int) = 
    i == 1 ? A.a :
    i == 2 ? A.b :
    i == 3 ? A.c :
    i == 4 ? A.d :
    i == 5 ? A.e :
    throw(BoundsError(A, i))

Base.setindex!(A::MVector5, v, i::Int) =
    i == 1 ? A.a = v :
    i == 2 ? A.b = v :
    i == 3 ? A.c = v :
    i == 4 ? A.d = v :
    i == 5 ? A.e = v :
    throw(BoundsError(A, i))

@inline function Base.fill!(A::MVector5{T}, v::T) where T
    v = convert(T, v)
    A.a = v
    A.b = v
    A.c = v
    A.d = v
    A.e = v
    return A
end
