struct Ellipse <: SimpleDrawingObject
    ctr::ComplexF64
    rx::Float64
    ry::Float64
    props::Dict{Symbol,Any}

    function Ellipse(z::Number, rx::Real, ry::Real)
        if rx <= 0 || ry <= 0
            throw(ArgumentError("Radii must be positive"))
        end
        o = new(z, rx, ry, _blank_props())
        reset_attributes!(o)
        return o
    end
end

"""
    Ellipse(x::Real, y::Real, rx::Real, ry::Real)
    Ellipse(x::Real, y::Real, rx::Real, ry::Real)

Create an ellipse centered at `z` [at `(x,y)`] with radii `rx` and `ry`.
"""
Ellipse(x::Real, y::Real, rx::Real, ry::Real) = Ellipse(complex(x, y), rx, ry)

struct FilledEllipse <: FilledObject
    ctr::ComplexF64
    rx::Float64
    ry::Float64
    props::Dict{Symbol,Any}

    function FilledEllipse(z::Number, rx::Real, ry::Real)
        if rx <= 0 || ry <= 0
            throw(ArgumentError("Radii must be positive"))
        end
        o = new(z, rx, ry, _blank_props())
        reset_attributes!(o)
        return o
    end
end

"""
    FilledEllipse(x::Real, y::Real, rx::Real, ry::Real)
    FilledEllipse(x::Real, y::Real, rx::Real, ry::Real)

Create a filled ellipse centered at `z` [at `(x,y)`] with radii `rx` and `ry`.
"""
FilledEllipse(x::Real, y::Real, rx::Real, ry::Real) = FilledEllipse(complex(x, y), rx, ry)

function draw(e::Ellipse)
    return draw_ellipse(e.ctr, e.rx, e.ry; e.props...)
end

function draw(e::FilledEllipse)
    return draw_ellipse(e.ctr, e.rx, e.ry; seriestype=[:shape], e.props...)
end

show(io::IO, e::Ellipse) = print(io, "Ellipse($(e.ctr), $(e.rx), $(e.ry))")
show(io::IO, e::FilledEllipse) = print(io, "FilledEllipse($(e.ctr), $(e.rx), $(e.ry))")
