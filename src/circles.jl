struct Circle <: DrawingObject
    ctr::ComplexF64
    rad::Float64
    props::Dict{Symbol,Any}

    function Circle(z::Number, r::Real)
        if r <= 0
            throw(ArgumentError("Radius must be positive"))
        end
        new(z, r, _default_props())
    end
end


"""
    Circle(z::Number, r::Real)
    Circle(x::Real, y::Real, r::Real)

Create a circle centered at `z` [at `(x,y)`] with radius `r`.
"""
Circle(x::Real, y::Real, r::Real) = Circle(complex(x, y), r)



struct Arc <: DrawingObject
    ctr::ComplexF64
    rad::Float64
    α::Float64
    β::Float64
    props::Dict{Symbol,Any}

    function Arc(z::Number, r::Real, t1::Real, t2::Real)
        if r <= 0
            throw(ArgumentError("Radius must be positive"))
        end
        new(z, r, t1, t2, _default_props())
    end
end

Arc(x::Real, y::Real, r::Real, t1::Real, t2::Real) = Arc(complex(x, y), r, t1, t2)




struct Disk <: DrawingObject
    ctr::ComplexF64
    rad::Float64
    props::Dict{Symbol,Any}

    function Disk(z::Number, r::Real)
        if r < 0
            throw(ArgumentError("Radius may not be negative"))
        end
        d = _default_props()
        d[:color] = :white
        new(z, r, d)
    end
end

"""
    Disk(z::Number, r::Real)
    Disk(x::Real, y::Real, r::Real)

Create a disk, i.e., a filled circle with default fill color set to `:white`.

See: `set_fillcolor!`.
"""
Disk(x::Real, y::Real, r::Real) = Disk(complex(x, y), r)

Disc = Disk

"""
    set_fillcolor!(d::Disk, col = :white)

Change the fill color of a `Disk`. 
"""
set_fillcolor!(d::Disk, col = :white) = set_attribute!(d, :color, col)


function draw(c::Circle)
    draw_circle(c.ctr, c.rad; c.props...)
end

function draw(d::Disk)
    draw_disc(d.ctr, d.rad; d.props...)
end

function draw(a::Arc)
    draw_arc(real(a.ctr), imag(a.ctr), a.rad, a.α, a.β; a.props...)
end


function reverse(a::Arc)::Arc
    aa = Arc(a.ctr, a.rad, a.β, a.α)
    d = get_attributes!(a)
    for k in keys(d)
        set_attribute!(aa, k, d[k])
    end
    return aa
end


show(io::IO, c::Circle) = print(io, "Circle($(c.ctr), $(c.rad))")
show(io::IO, d::Disk) = print(io, "Disk($(d.ctr), $(d.rad))")
show(io::IO, a::Arc) = print(io, "Arc($(a.ctr), $(a.rad), $(a.α), $(a.β))")
