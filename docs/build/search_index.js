var documenterSearchIndex = {"docs":
[{"location":"#DrawingObjects","page":"DrawingObjects","title":"DrawingObjects","text":"","category":"section"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"Collection of shapes that can be drawn with SimpleDrawing.","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"The objects that can be viewed are as follows:","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"Line Segments\nSegment \nArrow (a Segment with an arrow at one end)\nPolygons\nPolygon\nRectangle (convenience for axis-parallel rectangle)\nCircles\nCircle (empty interior)\nDisk (filled interior)\nArc (arc of a circle)\nSpline Curves\nOpenCurve \nClosedCurve\nPoints\nPoint","category":"page"},{"location":"#Common-Methods","page":"DrawingObjects","title":"Common Methods","text":"","category":"section"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"The following functions apply to all the geometric objects defined in this module. First and foremost is draw which causes the object to be drawn on the screen.","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"Each DrawingObject has attributes that affect how it is drawn. The following methods are provided for setting object attributes:","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"set_linecolor!(o, c) assigns the line color c to o. Default: :black\nset_linewidth!(o, w) sets the line thickness of the lines drawn to be w. Default: 1. \nset_linestyle!(o, style) sets the line style of o to style. Default: solid. \nset_pointsize!(p, sz) pertains only to Points and sets the size of the Point. Default: 2.\nset_pointcolor!(p, col) pertains only to Points and sets the color of the Point. Defaut: :black. ","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"More generally, use set_attribute!(o, attr, val) to set o's attribute attr to the value val. Use with caution. ","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"Use reset_attributes!(o) to return o to its \"factory default\" attributes. ","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"The function get_attributes(o) returns a view into o's attribute dictionary which can then be directly manipulated (if you dare).","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"More information on object attributes can be found in the Plots documentation. ","category":"page"},{"location":"#Line-Segments","page":"DrawingObjects","title":"Line Segments","text":"","category":"section"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"Create a new line segment using one of these:","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"Segment(a, b) where a and b are complex numbers.\nSegment(x, y, xx, yy) where the arguments are real numbers; this creates a segment from (x,y) to (xx,yy).\nArrow(a, b) creates a line segment from a to b with an arrowhead at b. This is equivalent to:\ns = Segment(a, b)\nset_attribute!(s, :arrow, true)","category":"page"},{"location":"#Polygons","page":"DrawingObjects","title":"Polygons","text":"","category":"section"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"Polygons are created from a list of complex numbers. Either use Polygon([a, b, c]) or Polygon(a,b,c).","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"The convenience function Rectangle creates an axis-parallel rectangle. ","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"Rectangle(a, b) creates a rectangle with opposite corners at a and b (as complex numbers).\nRectangle(x, y, xx, yy) creates a rectangle with opposite corners (x,y) and (xx,yy). ","category":"page"},{"location":"#Circles","page":"DrawingObjects","title":"Circles","text":"","category":"section"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"Circles are created from a center and a radius:","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"Circle(z, r) is the circle centered at (complex) z with radius r. \nCircle(x, y, r) is the circle centered at (x,y) with radius r. ","category":"page"},{"location":"#Disks","page":"DrawingObjects","title":"Disks","text":"","category":"section"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"Disks are filled circles. That is, their interior is an opaque color. Like circles, create with one of these:","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"Disk(z, r)\nDisk(x, y, r)","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"The function set_fillcolor! can be used to change the interior color of the disk. ","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"The symbol Disc is a synonmy for Disk.","category":"page"},{"location":"#Arcs","page":"DrawingObjects","title":"Arcs","text":"","category":"section"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"Arcs of circles are created thus with Arc(ctr, rad, t1, t2, t3) where:","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"ctr is (complex) the center of the circle,\nrad is the radius of the circle,\nt1 is the starting angle for the arc,\nt2 is an angle for a point inside the arc, and\nt3 is the ending angle for the arc.","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"We require the intermediante angle t2 because simply specifying the end points of the arc does not determine which piece of the circle we are considering. ","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"The center can also be specified as two real numbers: Arc(x, y, rad, t1, t2, t3).","category":"page"},{"location":"#Spline-Curves","page":"DrawingObjects","title":"Spline Curves","text":"","category":"section"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"The functions ClosedCurve and OpenCurve create curves from a list of points (just like Polygon).  The curves are cubic splines through those points. ","category":"page"},{"location":"#Points","page":"DrawingObjects","title":"Points","text":"","category":"section"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"Points in the plane are created with Point(z) or Point(x,y). They are rendered as a small dot. These two functions determine the appearance of points:","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"set_pointsize!(p, sz = 2) sets the size of the point.\nset_pointcolor!(p, col = :black) sets the color of the point. ","category":"page"},{"location":"","page":"DrawingObjects","title":"DrawingObjects","text":"To illustrate a point whose interior color is different from its boundary, use a Disk. ","category":"page"}]
}
