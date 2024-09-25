using SimpleDrawingObjects, SimpleDrawing, Plots

"""
    logo()

Draw a logo for `SimpleDrawingObjects`.
"""
function logo()
    newdraw()

    face = FilledCircle(0, 0, 4)
    set_fillcolor!(face, :yellow)

    left_eye = Point(-1.5, 1.5)
    right_eye = Point(1.5, 1.5)
    set_pointsize!(left_eye, 15)
    set_pointsize!(right_eye, 15)

    nose = Point(0, 0)
    set_pointsize!(nose, 7)

    smile = Arc(0, 2.25, -pi / 4, -pi / 2, -3pi / 4)
    set_linewidth!(smile, 3)

    draw([face, left_eye, right_eye, nose, smile])

    finish()
end
