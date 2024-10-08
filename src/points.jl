const _default_point_size = 3

struct Point <: FilledObject
    a::Complex{Float64}
    props::Dict{Symbol,Any}

    function Point(a::Number)
        d = _blank_props()
        d[:marker] = _default_point_size
        p = new(a, d)
        reset_attributes!(p)
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
