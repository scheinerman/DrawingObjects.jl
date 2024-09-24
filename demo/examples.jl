using SimpleDrawing, SimpleDrawingObjects

function draw_segment_example()
    newdraw()
    s = Segment(0, 1 + im)
    set_linecolor!(s, :red)
    draw(s)

    s = Segment(0, 1 - im)
    set_linecolor!(s, :blue)
    set_linewidth!(s, 4)
    draw(s)

    s = Arrow(0, -1 + 2im)
    draw(s)

    return finish()
end

function pentagram(with_points::Bool=false)
    newdraw()
    ts = [(4k * pi / 5 + pi / 2) for k in 0:4]
    zs = [exp(t * im) for t in ts]
    p = Polygon(zs)
    draw(p)

    if with_points
        plist = [Point(z) for z in zs]
        for p in plist
            set_pointsize!(p, 4)
        end
        draw(plist)
    end

    return finish()
end

function spirograph(n::Int=11, s::Int=5, with_points::Bool=false)
    newdraw()
    ts = [pi / 2 + s * k * 2pi / n for k in 1:n]
    zs = [exp(t * im) for t in ts]
    p = ClosedCurve(zs)
    draw(p)

    if with_points
        plist = [Point(z) for z in zs]
        for p in plist
            set_pointsize!(p, 4)
        end
        draw(plist)
    end

    return finish()
end
