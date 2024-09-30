struct PolygonalPath <: SimpleDrawingObject
    pts::Vector{ComplexF64}
    props::Dict{Symbol,Any}

    function PolygonalPath(plist::Vector{T}) where {T<:Number}
        if length(plist) < 2
            throw(ArgumentError("PolygonalPath must have at least 2 vertices."))
        end
        o = new(plist, _blank_props())
        reset_attributes!(o)
        return o
    end
end

"""
    PolygonalPath(plist::Vector{T}) where {T<:Number}
    PolygonalPath(xs::Vector{S}, ys::Vector{T}) where {S,T<:Real}

Create a polygonal path through the specified points. 
"""
PolygonalPath(xs::Vector{S}, ys::Vector{T}) where {S,T<:Real} = PolygonalPath(_mush(xs, ys))
PolygonalPath(zs...) = PolygonalPath(collect(zs))


draw(p::PolygonalPath) = plot!(real(p.pts), imag(p.pts); p.props...)
show(io::IO, ::PolygonalPath) = print(io, "PolygonalPath")
