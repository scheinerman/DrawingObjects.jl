struct Segment <: DrawingObject
    a::Complex{Float64}
    b::Complex{Float64}
    props::Dict{Symbol,Any}

    function Segment(a::Number, b::Number)
        o = new(a, b, _blank_props())
        reset_attributes!(o)
        return o
    end
end

"""
    Segment(a::Number, b::Number)
    Segment(x::Real, y::Real, xx::Real, yy::Real)

Create a segment from point `a` to point `b` where `a` and `b` are complex numbers. 

In the second form, create a line segment from `x + y*im` to `xx + yy*im`.
"""
Segment(x::Real, y::Real, xx::Real, yy::Real) = Segment(complex(x, y), complex(xx, yy))

show(io::IO, s::Segment) = print(io, "Segment($(s.a), $(s.b))")

"""
    Arrow(a::Number, b::Number)::Segment
    Arrow(x::Real, y::Real, xx::Real, yy::Real)::Segment

Create a line segment with the added attribute of having an arrow head at `b` (at `(xx,yy)`).
"""
function Arrow(a::Number, b::Number)::Segment
    s = Segment(a, b)
    set_attribute!(s, :arrow, true)
    return s
end

Arrow(x::Real, y::Real, xx::Real, yy::Real)::Segment = Arrow(complex(x, y), complex(xx, yy))

function draw(s::Segment)
    return draw_segment(s.a, s.b; s.props...)
end
