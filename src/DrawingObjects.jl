module DrawingObjects
using SimpleDrawing

import SimpleDrawing: draw, reverse
import Base: show

export DrawingObject,
    Arrow,
    Segment,
    get_attributes!,
    reset_attributes!,
    set_attribute!,
    set_linecolor!,
    set_linestyle!,
    set_width!


abstract type DrawingObject end

include("properties.jl")
include("segments.jl")


end # module DrawingObjects
