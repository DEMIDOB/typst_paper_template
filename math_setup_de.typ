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
  #set text(size: 12pt, lang: "de")
  #set text(font: "New Computer Modern")
  #set page(numbering: "1", paper: "a4")
  #show raw: set text(font: "New Computer Modern Mono")
  #show heading: set block(above: 1.4em, below: 1em)

  #set enum(numbering: "(i)")

  #set heading(numbering: latexHeadingNumbering)
  #set math.equation(numbering: "(1)")

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

#let theorem = thmbox("theorem", "Satz", inset: 0em)
#let corollary = thmbox("theorem", "Korollar", inset: 0em)
#let proposition = thmbox("theorem", "Proposition", inset: 0em)
#let lemma = thmbox("theorem", "Lemma", inset: 0em)
#let conjecture = thmbox("theorem", "Vermutung", inset: 0em)
#let notation = thmbox("theorem", "Notation", inset: 0em)
#let property = thmbox("theorem", "Eigenschaft", inset: 0em)
#let definition = thmbox("theorem", "Definition", inset: 0em)
#let intuition = thmbox("theorem", "Intuition", inset: 0em)
#let construction = thmbox("theorem", "Konstruktion", inset: 0em)
#let convention = thmbox("theorem", "Konvention", inset: 0em)
#let remark = thmbox("theorem", "Bemerkung", inset: 0em)
#let example = thmbox("theorem", "Beispiel", inset: 0em)

#let important_convention(content) = {
  rect(fill: color.linear-rgb(200, 200, 200, 255))[
    #convention[#content]
  ]
}

#let proof = thmproof("proof", "Beweis", inset: 0em)

#let today = datetime.today()

#let header_section(title, authors) = [
  #align(center, text(size: 23pt)[#title]) \
  #align(center)[#authors] \
  #align(center)[#today.display("[day].[month].[year]")]
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