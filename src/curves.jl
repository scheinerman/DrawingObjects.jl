struct OpenCurve <: DrawingObject
    pts::Vector{ComplexF64}
    props::Dict{Symbol,Any}

    function OpenCurve(plist::Vector{T}) where {T<:Number}
        if length(plist) < 3
            throw(ArgumentError("OpenCurve must have at least 3 vertices."))
        end
        new(plist, _default_props())
    end
end


struct ClosedCurve <: DrawingObject
    pts::Vector{ComplexF64}
    props::Dict{Symbol,Any}

    function ClosedCurve(plist::Vector{T}) where {T<:Number}
        if length(plist) < 4
            throw(ArgumentError("ClosedCurve must have at least 4 vertices."))
        end
        new(plist, _default_props())
    end
end


"""
    ClosedCurve(plist::Vector{T}) where {T<:Number}
    ClosedCurve(zs...)

Draw a closed curve using the given points using a cubic spline. 
"""
ClosedCurve(zs...) = ClosedCurve(collect(zs))

"""
    OpenCurve(plist::Vector{T}) where {T<:Number}
    OpenCurve(zs...)

Draw an open curve using the given points using a cubic spline. 
"""
OpenCurve(zs...) = OpenCurve(collect(zs))


show(io::IO, ::OpenCurve) = print(io, "OpenCurve")
show(io::IO, ::ClosedCurve) = print(io, "ClosedCurve")


draw(c::ClosedCurve) = draw_curve(c.pts; c.props...)
draw(c::OpenCurve) = draw_curve(c.pts, false; c.props...)
