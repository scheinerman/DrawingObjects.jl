module DrawingObjects
using SimpleDrawing, Plots

import SimpleDrawing: draw
import Base: show

export DrawingObject,
    Arc,
    Arrow,
    Circle,
    ClosedCurve,
    Disc,
    Disk,
    FilledPolygon,
    FilledRectangle,
    OpenCurve,
    Point,
    Polygon,
    Rectangle,
    Segment,
    get_attributes!,
    reset_attributes!,
    set_attribute!,
    set_fillcolor!,
    set_linecolor!,
    set_linestyle!,
    set_linewidth!,
    set_pointcolor!,
    set_pointsize!

abstract type DrawingObject end

include("segments.jl")
include("polygons.jl")
include("circles.jl")
include("arcs.jl")
include("curves.jl")
include("points.jl")
include("properties.jl")

function draw(os::Vector{T}) where {T<:DrawingObject}
    if length(os) == 0
        finish()
        return nothing
    end
    for o in os
        draw(o)
    end
    return finish()
end

end # module DrawingObjects
