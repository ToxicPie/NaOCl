#let preprocess_code(code) = {
    code.split("\n").map(line =>
        if regex("^//(/| clang-format)") in line {
            none
        } else if regex("^#include") in line {
            line.replace("// keep-line", "").trim(at: end)
        } else {
            line.trim(at: end)
        }
    ).join("\n")
}

#let render_content(filename) = {
    let ext = filename.split(".").at(-1)
    if ext == "typ" {
        include(filename)
    } else {
        let code = preprocess_code(read(filename))
        raw(
            block: true,
            lang: ext,
            tab-size: 2,
            code.trim(),
        )
    }
}

#let recursively_render_content(contents, depth: 1) = {
    for item in contents {
        if type(item) == dictionary {
            let (title, subcontents) = item.pairs().at(0)
            heading(
                depth: depth,
                numbering: "1.1",
                title,
            )
            recursively_render_content(subcontents, depth: depth + 1)
        } else {
            render_content(item)
        }
    }
}
