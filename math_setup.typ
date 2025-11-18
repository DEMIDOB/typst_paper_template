#import "@preview/plotst:0.2.0": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.3.2"

#show: thmrules

#let latexHeadingNumbering(..args) = {
  let pos = args.pos()

  for (i, arg) in pos.enumerate() {
    if (i == pos.len() - 1) {
      text[#arg #h(0.2cm)]
    } else {
      text[#arg.]
    }
  }
}

#let applyStyles(content) = [
  #set par(leading: 0.55em, first-line-indent: 1.8em, justify: true, spacing: 0.55em)
  #set text(size: 11pt, lang: "en")
  #set text(font: "New Computer Modern")
  #set page(numbering: "1", paper: "a4")
  #show raw: set text(font: "New Computer Modern Mono")
  #show heading: set block(above: 1.4em, below: 1em)

  #set enum(numbering: "(i)", spacing: 1em)

  #set heading(numbering: latexHeadingNumbering)
  #set math.equation(numbering: "(1)")
  #show math.equation.where(block: true): set block(spacing: 1.1em)
  
  #show ref: it => {
    let eq = math.equation
    let el = it.element
    if el != none and el.func() == eq {
      // Override equation references.
      numbering(
        el.numbering,
        ..counter(eq).at(el.location())
      )
    } else {
      // Other references as usual.
      it
    }
  }

  #show: thmrules
  #show: thmrules.with(qed-symbol: $square$)

  #content
]

#let theorem = thmbox("theorem", "Theorem", inset: 0em, separator: [*.*#h(0.2em)])
#let corollary = thmbox("theorem", "Corollary", inset: 0em, separator: [*.*#h(0.2em)])
#let proposition = thmbox("theorem", "Proposition", inset: 0em, separator: [*.*#h(0.2em)])
#let lemma = thmbox("theorem", "Lemma", inset: 0em, separator: [*.*#h(0.2em)])
#let conjecture = thmbox("theorem", "Conjecture", inset: 0em, separator: [*.*#h(0.2em)])
#let notation = thmbox("theorem", "Notation", inset: 0em, separator: [*.*#h(0.2em)])
#let property = thmbox("theorem", "Property", inset: 0em, separator: [*.*#h(0.2em)])
#let definition = thmbox("theorem", "Definition", inset: 0em, separator: [*.*#h(0.2em)])
#let intuition = thmbox("theorem", "Intuition", inset: 0em, separator: [*.*#h(0.2em)])
#let construction = thmbox("theorem", "Construction", inset: 0em, separator: [*.*#h(0.2em)])
#let convention = thmbox("theorem", "Convention", inset: 0em, separator: [*.*#h(0.2em)])
#let remark = thmbox("theorem", "Remark", inset: 0em, separator: [*.*#h(0.2em)])
#let example = thmbox("theorem", "Example", inset: 0em, separator: [*.*#h(0.2em)])

#let important_convention(content) = {
  rect(fill: color.linear-rgb(200, 200, 200, 255))[
    #convention[#content]
  ]
}

#let proof = thmproof("proof", "Proof", inset: 0em, separator: [.#h(0.2em)])

#let today = datetime.today()

#let header_section(title, authors) = [
  #align(center, text(size: 19pt)[#title]) 
  #block(height: 0.5em)
  #align(center, text(size: 13pt)[#authors]) 
  #block(height: 0.5em)
  #align(center, text(size: 13pt)[#today.display("[day].[month].[year]")])
]

#let abstract(txt) = align(center)[
  *Abstract*

  #block(width: 90%, txt)
]

#let abstract_after_header(txt) = [
  \ \
  #abstract(txt)
]

#let tmp(content) = text(fill: red)[#content]

#let latexHeadingNumbering(..args) = {
  let pos = args.pos()

  for (i, arg) in pos.enumerate() {
    if (i == pos.len() - 1) {
      text[#arg #h(0.2cm)]
    } else {
      text[#arg.]
    }
  }
}

#let innerproduct(x, y) = $lr(angle.l #x, #y angle.r)$