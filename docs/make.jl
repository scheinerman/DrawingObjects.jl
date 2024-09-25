# execute this file in the docs directory with this
# julia --color=yes --project make.jl

using Documenter, SimpleDrawingObjects
makedocs(
    pages = ["index.md", "Function Documentation" => "docstrings.md"],
    sitename = "SimpleDrawingObjects",
)
