module DrawingObjects
using SimpleDrawing

import SimpleDrawing: draw

export DrawingObject, Segment, set_color!, set_width!

abstract type DrawingObject end


struct Segment <: DrawingObject
    a::Complex{Float64}
    b::Complex{Float64}
    props::Dict{Symbol, Any}
    
    function Segment(a::Number, b::Number)
        new(a, b, _default_props())
    end
end

function draw(s::Segment)
    draw_segment(s.a, s.b; s.props...)
end

include("properties.jl")

end # module DrawingObjects
