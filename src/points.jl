struct Point <: DrawingObject
    a::Complex{Float64}
    props::Dict{Symbol,Any}

    function Point(a::Number)
        d = _default_props()
        d[:marker] = 2
        p = new(a, d)
        set_pointcolor!(p)
        return p
    end
end

"""
    Point(a::Number)
    Point(x::Real, y::Real)

Create a point at location `a` [or `(x,y)`].
"""
Point(x::Real, y::Real) = Point(complex(x, y))


draw(p::Point) = draw_point(p.a; p.props...)
show(io::IO, p::Point) = print(io, "Point($(p.a))")
