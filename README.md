# DrawingObjects

Collection of shapes that can be drawn with [SimpleDrawing](https://github.com/scheinerman/SimpleDrawing.jl).


## Common Methods

The following functions apply to all the geometric objects defined in this module. First and foremost is `draw` which causes the object to be drawn on the screen.

Each geometric object has attributes that affect how it is drawn. The following methods are provided for setting object attributes:
* `set_linecolor!(o, c)` assigns the color `c` to `o`. Default: `:black`
* `set_linewidth!(o, w)` sets the thickness of the lines drawn to be `w`. Default: `1`. 
* `set_linestyle!(o, style)` sets the line style of `o` to `style`. Default: `solid`. 

More generally, use `set_attribute!(o, attr, val)` to set `o`'s attribute `attr` to the value `val`. 

Use `reset_attributes!(o)` to return `o` to its "factory default" attributes. Specifically, this clears all atrributes except the line color, which is set to `:black`. 

The function `get_attributes(o)` returns a view into `o`'s attribute dictionary which can then be directly manipulated (if you dare).

More information on object attributes can be found in the [Plots](https://docs.juliaplots.org/stable/generated/attributes_series/) documentation. 


## Line Segments

Create a new line segment using one of these:
* `Segment(a, b)` where `a` and `b` are complex numbers.
* `Segment(x, y, xx, yy)` where the arguments are real numbers; this creates a segment from `(x,y)` to `(xx,yy)`.

The following functions only pertain to line segments.
* `Arrow(a, b)` creates a line segment from `a` to `b` with an arrowhead at `b`. This is equivalent to:
    * `s = Segment(a, b)`
    * `set_attribute!(s, :arrow, true)`
* `reverse(s)` creates a new line segment with the same end points as `s` but in reverse order. The attributes of `s` are copied to the new segment.

## Polygons

Polygons are created from a list of complex numbers. Either use `Polygon([a, b, c])` or `Polygon(a,b,c)`.

The convenience function `Rectangle` creates an axis-parallel rectangle. 
* `Rectangle(a, b)` creates a rectangle with opposite corners at `a` and `b` (as complex numbers).
* `Rectangle(x, y, xx, yy)` creates a rectangle with opposite corners `(x,y)` and `(xx,yy)`. 

## Circles

Circles are created from a center and a radius:
* `Circle(z, r)` is the circle centered at (complex) `z` with radius `r`. 
* `Circle(x, y, r)` is the circle centered at `(x,y)` with radius `r`. 

Disks are filled circles. That is, their interior is an opaque color. Like circles, create with one of these:
* `Disk(z, r)`
* `Disk(x, y, r)`

The function `set_fillcolor!` can be used to change the interior color of the disk. 

The symbol `Disc` is a synonmy for `Disk`.