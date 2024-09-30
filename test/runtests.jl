using Test
using SimpleDrawingObjects

function test_attr(o::SimpleDrawingObject)
    set_fillcolor!(o, :red)
    set_linestyle!(o, :dash)
    set_linewidth!(o, 2)
    set_pointcolor!(o, :yellow)
    set_pointsize!(o, 3)
    set_fillcolor!(o, :blue)
    set_fillalpha!(o, 0.5)
    return true
end

@test test_attr(Segment(1, 2, 3, 4))
@test test_attr(Arrow(0, 3im))
@test test_attr(Circle(2, 3, 5))
@test test_attr(FilledCircle(-im, 2))
pts = [2, 3 - im, 4 + im, -2im, 0]

@test test_attr(Polygon(pts))
@test test_attr(FilledPolygon(pts))
@test test_attr(Rectangle(0, 0, 1, 2))
@test test_attr(FilledRectangle(-im, 0))
@test test_attr(ClosedCurve(pts))
@test test_attr(OpenCurve(pts))
@test test_attr(FilledClosedCurve(pts))
@test test_attr(PolygonalPath(pts))
@test test_attr(Ellipse(1 - im, 2, 3))
@test test_attr(FilledEllipse(1 - im, 2, 3))
