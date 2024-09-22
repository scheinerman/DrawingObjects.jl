_blank_props() = Dict{Symbol,Any}()

"""
    reset_attributes!(o::DrawingObject)

Reset all attributes to factory defaults. 
"""
function reset_attributes!(o::DrawingObject)
    set_linecolor!(o)
    set_fillcolor!(o)
    set_linewidth!(o)
    set_pointcolor!(o)
    set_pointsize!(o)
end


# function reset_attributes!(o::DrawingObject)
#     for k in keys(o.props)
#         delete!(o.props, k)
#     end
#     set_default_attributes!(o)

#     d = _default_props()
#     for k in keys(d)
#         o.props[k] = d[k]
#     end

#     nothing
# end

"""
    get_attributes!(o::DrawingObject)

Give access to the attributes dictionary for `o`.
"""
get_attributes!(o::DrawingObject)::Dict = o.props


"""
    set_attribute!(o::DrawingObject, attr::Symbol, val)

Assign the value `val` to the object's attribute `attr`.
"""
function set_attribute!(o::DrawingObject, attr::Symbol, val)
    o.props[attr] = val
end

"""
    set_color!(o::DrawingObject, c = :black)

Assign color `c` to this object.
"""
set_linecolor!(o::DrawingObject, c = :black) = set_attribute!(o, :linecolor, c)


"""
    set_width!(o::DrawingObject, w = 1)

Assign line width `w` to this object. 
"""
set_linewidth!(o::DrawingObject, w = 1) = set_attribute!(o, :width, w)


"""
    set_linestyle!(o::DrawingObject, s = :solid)

Assign `s` to be the line style of this object. 
"""
set_linestyle!(o::DrawingObject, s = :solid) = set_attribute!(o, :linestyle, s)


"""
    set_fillcolor!(d::DrawingObject, col = :white)

Change the fill color. Only applies to `Disk`s.
"""
set_fillcolor!(o::DrawingObject, col = :white) = set_attribute!(o, :color, col)




# properties for Points are handled differently

"""
    set_pointsize!(p::Point, sz = 2)

Set the size at which a `Point` is drawn.
"""
function set_pointsize!(p::Point, sz = 2)
    if sz <= 0
        throw(ArgumentError("Point size must be positive"))
    end
    set_attribute!(p, :marker, sz)
end
set_pointsize!(::DrawingObject, sz = 2) = nothing

"""
    set_pointcolor!(p::Point, col = :black)

Set the color to draw a `Point`. The functions `set_fillcolor!` and `set_linecolor!` don't apply. 
"""
function set_pointcolor!(p::Point, col = :black)
    set_attribute!(p, :markercolor, col)
    set_attribute!(p, :markerstrokecolor, col)
end
set_pointcolor!(::DrawingObject, col = :black) = nothing
