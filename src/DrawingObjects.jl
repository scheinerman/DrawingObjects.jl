module DrawingObjects
using SimpleDrawing

import SimpleDrawing: draw, reverse
import Base: show

export DrawingObject,
    Arc,
    Arrow,
    Circle,
    ClosedCurve,
    Disc,
    Disk,
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

end # module DrawingObjects
