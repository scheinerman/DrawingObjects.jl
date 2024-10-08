_blank_props() = Dict{Symbol,Any}()

"""
    reset_attributes!(o::SimpleDrawingObject)

Reset `o`'s attributes to factory defaults. 
"""
function reset_attributes!(o::SimpleDrawingObject)
    d = get_attributes(o)
    for k in keys(d)
        delete!(d, k)
    end

    set_linecolor!(o)
    set_fillcolor!(o)
    set_fillalpha!(o)
    set_linewidth!(o)
    set_pointcolor!(o)
    set_pointsize!(o)
    return nothing
end

"""
    get_attributes(o::SimpleDrawingObject)::Dict

Give access to the attributes dictionary for `o`.
"""
get_attributes(o::SimpleDrawingObject)::Dict = o.props

"""
    set_attribute!(o::SimpleDrawingObject, attr::Symbol, val)

Assign the value `val` to the object's attribute `attr`.
"""
function set_attribute!(o::SimpleDrawingObject, attr::Symbol, val)
    return o.props[attr] = val
end

"""
    set_linecolor!(o::SimpleDrawingObject, c=:black)

Assign color `c` to the lines in this object.
"""
set_linecolor!(o::SimpleDrawingObject, c = :black) = set_attribute!(o, :linecolor, c)

"""
    set_linewidth!(o::SimpleDrawingObject, w=1)

Assign line width `w` to this object. 
"""
set_linewidth!(o::SimpleDrawingObject, w = 1) = set_attribute!(o, :width, w)

"""
    set_linestyle!(o::SimpleDrawingObject, s=:solid)

Assign `s` to be the line style of this object. 
"""
set_linestyle!(o::SimpleDrawingObject, s = :solid) = set_attribute!(o, :linestyle, s)

"""
    set_fillcolor!(o::FilledObject, col=:white)

Change the fill color (for `FilledObject`s)
"""
set_fillcolor!(o::FilledObject, col = :white) = set_attribute!(o, :color, col)
set_fillcolor!(::SimpleDrawingObject, col = :white) = nothing




# properties for Points are handled differently

"""
    set_pointsize!(p::Point, sz = _default_point_size)

Set the size at which a `Point` is drawn.
"""
function set_pointsize!(p::Point, sz = _default_point_size)
    if sz <= 0
        throw(ArgumentError("Point size must be positive"))
    end
    return set_attribute!(p, :marker, sz)
end
set_pointsize!(::SimpleDrawingObject, sz = 2) = nothing

"""
    set_pointcolor!(p::Point, col = :black)

Set the color to draw a `Point`. The functions `set_fillcolor!` and `set_linecolor!` don't apply. 
"""
function set_pointcolor!(p::Point, col = :black)
    set_attribute!(p, :markercolor, col)
    return set_attribute!(p, :markerstrokecolor, col)
end
set_pointcolor!(::SimpleDrawingObject, col = :black) = nothing


set_fillcolor!(p::Point, col = :black) = set_attribute!(p, :markercolor, col)
set_linecolor!(p::Point, col = :black) = set_attribute!(p, :markerstrokecolor, col)



"""
    set_fillalpha!(o::FilledObject, α=1.0)

Set the transparency of `o` to `α` with 1.0 being completely opaque and 0.0 being fully transparent.
"""
function set_fillalpha!(o::FilledObject, α = 1.0)
    if α < 0 || α > 1
        throw(ArgumentError("α must satisfy 0 ≤ α ≤ 1"))
    end

    return set_attribute!(o, :alpha, α)
end

set_fillalpha!(::SimpleDrawingObject, α = 1) = nothing
