struct Polygon <: SimpleDrawingObject
    pts::Vector{ComplexF64}
    props::Dict{Symbol,Any}

    function Polygon(plist::Vector{T}) where {T<:Number}
        if length(plist) < 3
            throw(ArgumentError("Polygon must have at least 3 vertices."))
        end
        o = new(plist, _blank_props())
        reset_attributes!(o)
        return o
    end
end

struct FilledPolygon <: SimpleDrawingObject
    pts::Vector{ComplexF64}
    props::Dict{Symbol,Any}

    function FilledPolygon(plist::Vector{T}) where {T<:Number}
        if length(plist) < 3
            throw(ArgumentError("Polygon must have at least 3 vertices."))
        end
        o = new(plist, _blank_props())
        reset_attributes!(o)
        return o
    end
end

"""
    Polygon(plist::Vector{T}) where {T<:Number}
    Polygon(zs...)

Create a polygon from a list of complex numbers. `Polygon([0, 2im, 4])` can also 
be created using `Polygon(0, 2im, 4)`.
"""
Polygon(zs...) = Polygon(collect(zs))

"""
    FilledPolygon(plist::Vector{T}) where {T<:Number}
    FilledPolygon(zs...)

Create a filled-in polygon from a list of complex numbers. `FilledPolygon([0, 2im, 4])` can also 
be created using `FilledPolygon(0, 2im, 4)`.
"""
FilledPolygon(zs...) = FilledPolygon(collect(zs))

Polygon(xs::Vector{S}, ys::Vector{T}) where {S,T<:Real} = Polygon(_mush(xs, ys))
FilledPolygon(xs::Vector{S}, ys::Vector{T}) where {S,T<:Real} = FilledPolygon(_mush(xs, ys))

"""
    Rectangle(a::Number, b::Number)::Polygon
    Rectangle(x::Real, y::Real, xx::Real, yy::Real)::Polygon

Create a rectangle with opposite corners `a` and `b` [or `(x,y)` and `(xx,yy)`].
"""
function Rectangle(x::Real, y::Real, xx::Real, yy::Real)::Polygon
    a = complex(x, y)
    b = complex(xx, y)
    c = complex(xx, yy)
    d = complex(x, yy)
    return Polygon(a, b, c, d)
end
Rectangle(a::Number, b::Number)::Polygon = Rectangle(real(a), imag(a), real(b), imag(b))

"""
    FilledRectangle(a::Number, b::Number)::FilledPolygon
    FilledRectangle(x::Real, y::Real, xx::Real, yy::Real)::FilledPolygon

Create a rectangle with opposite corners `a` and `b` [or `(x,y)` and `(xx,yy)`].
"""
function FilledRectangle(x::Real, y::Real, xx::Real, yy::Real)::FilledPolygon
    a = complex(x, y)
    b = complex(xx, y)
    c = complex(xx, yy)
    d = complex(x, yy)
    return FilledPolygon(a, b, c, d)
end
FilledRectangle(a::Number, b::Number)::FilledPolygon =
    FilledRectangle(real(a), imag(a), real(b), imag(b))

show(io::IO, p::Polygon) = print(io, "Polygon with $(length(p.pts)) vertices")
show(io::IO, p::FilledPolygon) = print(io, "FilledPolygon with $(length(p.pts)) vertices")

function draw(p::Polygon)
    n = length(p.pts)
    for k in 1:(n - 1)
        draw_segment(p.pts[k], p.pts[k + 1]; p.props...)
    end
    return draw_segment(p.pts[n], p.pts[1]; p.props...)
end

function draw(p::FilledPolygon)
    x = real.(p.pts)
    y = imag.(p.pts)
    plot!(Shape(x, y); p.props...)
    return finish()
end
