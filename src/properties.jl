# Commonly used functions to set properties of DrawingObjects

function _default_props() 
    d = Dict{Symbol, Any}()
    d[:color]=:black
    return d
end

set_color!(o::DrawingObject, the_color = :black) = o.props[:color] = the_color
set_width!(o::DrawingObject, the_width = 1) = o.props[:width] = the_width