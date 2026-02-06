// Style the title
#show heading.where(level: 1): it => {
  set text(size: 22pt, weight: "bold", fill: rgb("#1a1a1a"))
  block(it.body)
  v(0.2em)
}

#show heading: it => {
  it
  v(0.5em)
}

#show figure: it => {
  it.body
}

// Code blocks
#show raw: it => {
  if it.block {
    // breakable: false is the key to preventing "ugly" splits
    block(
      fill: rgb("#eeeeee"),
      inset: 10pt,
      radius: 4pt,
      width: 100%,
      breakable: false, 
      text(font: "JetBrainsMono NF", size: 9pt, it)
    )
  } else {
    box(
      fill: rgb("#eeeeee"),
      inset: (x: 3pt),
      outset: (y: 3pt),
      radius: 2pt,
      text(font: "JetBrainsMono NF", size: 9pt, it)
    )
  }
}