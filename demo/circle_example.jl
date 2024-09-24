using SimpleDrawingObjects, SimpleDrawing

C = Circle(2 - im, 3)  # circle centered at (2,-1) with radius 3
set_linecolor!(C, :red)
set_linewidth!(C, 2)
set_linestyle!(C, :dash)
newdraw()
draw(C)
finish()
