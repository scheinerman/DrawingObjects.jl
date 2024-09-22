# DrawingObjects

Collection of shapes that can be drawn with [SimpleDrawing](https://github.com/scheinerman/SimpleDrawing.jl).

The objects that can be viewed are as follows:
* Line Segments
    * `Segment` 
    * `Arrow` (a `Segment` with an arrow at one end)
* Polygons
    * `Polygon`
    * `Rectangle` (convenience for axis-parallel rectangle)
* Circles
    * `Circle` (empty interior)
    * `Disk` (filled interior)
    * `Arc` (arc of a circle)
* Spline Curves
    * `OpenCurve` 
    * `ClosedCurve`
* Points
    * `Point`


## Common Methods

### Drawing

The following functions apply to all the geometric objects defined in this module. First and foremost is `draw` which causes the object to be drawn on the screen. The `draw` function may be applied to a list of objects in which case each object in the list is drawn in the order presented.

### Object attributes

Each `DrawingObject` has attributes that affect how it is drawn. The following methods are provided for setting object attributes:
* `set_linecolor!(o, c)` assigns the line color `c` to `o`. Default: `:black`
* `set_linewidth!(o, w)` sets the line thickness of the lines drawn to be `w`. Default: `1`. 
* `set_linestyle!(o, style)` sets the line style of `o` to `style`. Default: `solid`. 
* `set_pointsize!(p, sz)` pertains only to `Point`s and sets the size of the `Point`. Default: `2`.
* `set_pointcolor!(p, col)` pertains only to `Point`s and sets the color of the `Point`. Defaut: `:black`. 

More generally, use `set_attribute!(o, attr, val)` to set `o`'s attribute `attr` to the value `val`. Use with caution. 

Use `reset_attributes!(o)` to return `o` to its "factory default" attributes. 

The function `get_attributes(o)` returns a view into `o`'s attribute dictionary which can then be directly manipulated (if you dare).


More information on object attributes can be found in the [Plots](https://docs.juliaplots.org/stable/generated/attributes_series/) documentation. 


## Line Segments

Create a new line segment using one of these:
* `Segment(a, b)` where `a` and `b` are complex numbers.
* `Segment(x, y, xx, yy)` where the arguments are real numbers; this creates a segment from `(x,y)` to `(xx,yy)`.

* `Arrow(a, b)` creates a line segment from `a` to `b` with an arrowhead at `b`. This is equivalent to:
    * `s = Segment(a, b)`
    * `set_attribute!(s, :arrow, true)`

## Polygons

Polygons are created from a list of complex numbers. Either use `Polygon([a, b, c])` or `Polygon(a,b,c)`.

The convenience function `Rectangle` creates an axis-parallel rectangle. 
* `Rectangle(a, b)` creates a rectangle with opposite corners at `a` and `b` (as complex numbers).
* `Rectangle(x, y, xx, yy)` creates a rectangle with opposite corners `(x,y)` and `(xx,yy)`. 

## Circles

Circles are created from a center and a radius:
* `Circle(z, r)` is the circle centered at (complex) `z` with radius `r`. 
* `Circle(x, y, r)` is the circle centered at `(x,y)` with radius `r`. 


### Disks

Disks are filled circles. That is, their interior is an opaque color. Like circles, create with one of these:
* `Disk(z, r)`
* `Disk(x, y, r)`

The function `set_fillcolor!` can be used to change the interior color of the disk. 

The symbol `Disc` is a synonmy for `Disk`.

### Arcs

Arcs of circles are created thus with `Arc(ctr, rad, t1, t2, t3)` where:
* `ctr` is (complex) the center of the circle,
* `rad` is the radius of the circle,
* `t1` is the starting angle for the arc,
* `t2` is an angle for a point inside the arc, and
* `t3` is the ending angle for the arc.

We require the intermediante angle `t2` because simply specifying the end points of the arc does not determine which piece of the circle we are considering. 

The center can also be specified as two real numbers: `Arc(x, y, rad, t1, t2, t3)`.


## Spline Curves

The functions `ClosedCurve` and `OpenCurve` create curves from a list of points (just like `Polygon`). 
The curves are cubic splines through those points. 

## Points

Points in the plane are created with `Point(z)` or `Point(x,y)`. They are rendered as a small dot. These two functions determine the appearance of points:
* `set_pointsize!(p, sz = 2)` sets the size of the point.
* `set_pointcolor!(p, col = :black)` sets the color of the point. 

To illustrate a point whose interior color is different from its boundary, use a `Disk`. 