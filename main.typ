#set page(
    paper: "a4",
    margin: (
        top: 32pt, bottom: 32pt,
        left: 30pt, right: 20pt,
    ),
    header: [
        #set text(weight: "bold")
        NYCU_ACtame (National Yang Ming Chiao Tung University)
        #h(1fr)
        Page #counter(page).display("1/1", both: true)
    ],
    header-ascent: 20%,
    footer: [
        #set text(weight: "bold")
        #set align(center)
        2023 ICPC World Finals Luxor
    ],
    footer-descent: 20%,
)

#show raw: set text(
    font: "Jetbrains Mono",
    ligatures: false,
    features: (calt: 0),
    size: 7.4pt,
    weight: 700,
)

#show raw.line: it => {
    if calc.rem(it.number, 2) == 1 {
        h(-0.5em)
        box(
            width: 0em,
            align(right, text(fill: gray)[#it.number]),
        )
        h(0.5em)
    }
    it.body
}

#import "lib.typ": recursively_render_content

#align(center)[#block(inset: 2em)[
    #text(weight: "bold", size: 2em)[
        NYCU_ACtame Team Reference Document
    ]
]]

#columns(2, gutter: 12pt)[
    #set text(size: 9.8pt)
    #set par(leading: 0.45em)
    #outline(indent: auto, title: none)
]

#pagebreak()

#columns(2, gutter: 12pt)[
    #set text(size: 9.6pt)
    #set par(leading: 0.4em)
    #recursively_render_content(yaml("content.yaml"))
]
