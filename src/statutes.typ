#import "i18n.typ": tr, lookup

// Statutes/bylaws (vedtægter) layout.
// `= Title` → "§N  Title", `== ` → "N.M", `#stk[...]` → "stk. 2 ..." (auto-numbered per subsection).

#let _stk-counter = counter("statutes-stk")

#let stk(body) = {
  _stk-counter.step()
  context [#lookup("stk") #_stk-counter.get().first() #body]
  parbreak()
}

#let statutes(
  organisation: none,
  title: none,
  updated: none,
  logo: none,
  lang: "en",                 // "da" or "en"
  body,
) = {
  assert(lang in ("da", "en"), message: "statutely: lang must be \"da\" or \"en\", got " + repr(lang))
  set text(lang: lang)
  let title = if title != none { title } else { [#tr("statutes-of") #organisation] }
  set document(title: title)
  set page(paper: "a4", margin: (x: 3.2cm, y: 3cm), numbering: "1")
  set text(font: "New Computer Modern", size: 11pt, lang: lang)
  set par(justify: true)
  set list(indent: 1em, spacing: 1em)
  set enum(indent: 1em, spacing: 1em, numbering: "1.a")

  set heading(numbering: (..n) => {
    let n = n.pos()
    if n.len() == 1 { "§" + str(n.first()) } else { n.map(str).join(".") }
  })
  show heading.where(level: 1): it => {
    _stk-counter.update(1)
    block(above: 1.8em, below: 1em, text(size: 14pt, weight: "bold",
      counter(heading).display(it.numbering) + h(1.2em) + it.body))
  }
  show heading.where(level: 2): it => {
    _stk-counter.update(1)
    block(above: 1.4em, below: 0.9em, text(size: 11pt, weight: "bold",
      counter(heading).display(it.numbering) + if it.body != [] { h(0.8em) + it.body }))
  }

  align(center, {
    assert(type(logo) != str, message: "logo must be content, e.g. logo: image(\"logo.png\")")
    if logo != none { logo; v(1em) }
    v(4em)
    text(size: 17pt, title)
    if updated != none {
      v(1.5em)
      text(size: 11pt, [#tr("last-updated") #updated])
    }
    v(2.5em)
  })
  body
}

#let vedtaegter = statutes.with(lang: "da")
