#set page(
    paper: "a4",
    // columns: 2,
    margin: (
        top: 32pt, bottom: 28pt,
        left: 32pt, right: 20pt,
        rest: 0pt
    ),
    header: [
        #set text(weight: "bold")
        NYCU_ACtame (National Yang Ming Chiao Tung University)
        #h(1fr)
        Page #counter(page).display("1/1", both: true)
    ],
    footer: [
        #set text(weight: "bold")
        #set align(center)
        2023 ICPC World Finals Luxor
    ],
)

#set text(size: 10pt)
#set par(leading: 0.45em)

#show raw: set text(
    font: "Fira Code",
    tracking: -0.2pt,
    ligatures: false,
    features: (calt: 0),
    size: 7.4pt,
    weight: 600,
)

#show raw.line: it => {
    if calc.rem(it.number, 2) == 1 {
        h(-0.3em)
        box(
            width: 0em,
            align(right, text(fill: gray)[#it.number]),
        )
        h(0.3em)
    }
    it.body
}

#import "lib.typ": recursively_render_content

#columns(2, gutter: 12pt)[
    #outline(indent: auto)
    #recursively_render_content(yaml("content.yaml"))
]
