module DrawingObjects
using SimpleDrawing

import SimpleDrawing: draw, reverse
import Base: show

export DrawingObject,
    Arrow,
    Circle,
    Disc,
    Disk,
    Polygon,
    Rectangle,
    Segment,
    get_attributes!,
    reset_attributes!,
    set_attribute!,
    set_fillcolor!,
    set_linecolor!,
    set_linestyle!,
    set_linewidth!


abstract type DrawingObject end

include("properties.jl")
include("segments.jl")
include("polygons.jl")
include("circles.jl")


end # module DrawingObjects
