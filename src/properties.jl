# Commonly used functions to set properties of DrawingObjects

function _default_props()
    d = Dict{Symbol,Any}()
    d[:linecolor] = :black
    return d
end

"""
    reset_attributes!(o::DrawingObject)

Clear all attributes from `o`, except keep color set to `:black`.
"""
function reset_attributes!(o::DrawingObject)
    for k in keys(o.props)
        delete!(o.props, k)
    end
    set_linecolor!(o)
    nothing
end

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
set_width!(o::DrawingObject, w = 1) = set_attribute!(o, :width, w)


"""
    set_linestyle!(o::DrawingObject, s = :solid)

Assign `s` to be the line style of this object. 
"""
set_linestyle!(o::DrawingObject, s = :solid) = set_attribute!(o, :linestyle, s)
