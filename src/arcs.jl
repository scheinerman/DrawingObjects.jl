struct Arc <: DrawingObject
    ctr::ComplexF64
    rad::Float64
    t1::Float64
    t2::Float64
    t3::Float64
    props::Dict{Symbol,Any}

    function Arc(z::Number, r::Real, t1::Real, t2::Real, t3::Real)
        if r <= 0
            throw(ArgumentError("radius must be positive"))
        end
        new(z, r, t1, t2, t3, _default_props())
    end
end
"""
    Arc(z::Number, r::Real, t1::Real, t2::Real, t3::Real)
    Arc(x::Real, y::Real, r::Real, t1::Real, t2::Real, t3::Real)

Create an arc centered at `z` [at `(x,y)`] with radius `r` starting at angle `t1`, 
continuing through angle `t2`, and ending at angle `t3`.
"""
Arc(x::Real, y::Real, r::Real, t1::Real, t2::Real, t3::Real) =
    Arc(complex(x, y), r, t1, t2, t3)



function draw(a::Arc)
    mark(t::Real) = a.ctr + a.rad * exp(im * t)
    draw_arc(mark(a.t1), mark(a.t2), mark(a.t3); a.props...)
end


show(io::IO, a::Arc) = print(io, "Arc($(a.ctr), $(a.rad), $(a.t1), $(a.t2), $(a.t3))")
