---
layout: chapter
title: Post de prueba
authors:
  - fdavidcl
---

### Probando kramdown
[kramdown](http://kramdown.gettalong.org/quickref.html) es el procesador de Markdown que
[Jekyll](http://jekyllrb.com) utiliza para convertir los archivos *.md* en código HTML

*[HTML]: Hyper Text Markup Language

#### Ejemplo

1. Esto
1. es
1. una
1. lista
1. numerada

* Esta
* está
* sin
* numerar

definición
: Proposición que expone con claridad y exactitud los caracteres genéricos y
diferenciales de algo material o inmaterial[^1].

[^1]: [RAE](http://lema.rae.es/drae/?val=definici%C3%B3n)

Podéis consultar [el código que genera esto](https://github.com/fdavidcl/apuntes/raw/gh-pages/_posts/2014-3-6-testpost.md),
y el resto de [la sintaxis](http://kramdown.gettalong.org/syntax.html).


### Probando MathJax

Para escribir código `$\LaTeX$` y que sea interpretado por MathJax, lo englobaremos de
esta forma:

    `$f: \mathbb{N} \rightarrow \mathbb{R} $`

para fórmulas en línea. Para fórmulas centradas usaremos:

    `$$f: \mathbb{N} \rightarrow \mathbb{R} $$`

¡Importantes los *backticks* `` ` ``!

#### Ejemplo

Sea `$f:\mathbb{N}\rightarrow\mathbb{R}$`, se verifica `$$f(n) \in O(g(n))
\Leftrightarrow \exists k \in \mathbb{N} \exists c \in \mathbb{R}^{+} : f(n) \leq
c\times g(n) \forall n \geq k$$`

Voy a complicarle la vida a MathJax: `$a_{ij}\times b_{ji};\ 1*2*3*4*5$`

### Probando highlight.js

Para escribir código lo indentamos a 4 espacios. Usamos [Highlight.js](http://highlightjs.org)
que interpreta automáticamente el lenguaje y resalta el código. Para separar dos bloques de
código consecutivos usamos el marcador `^`.

#### Ejemplo

    var preorder = function(call_each, node) {
        call_each(node.key());

        for (var c = 0; c < node.numChildren(); c++) {
            preorder(call_each, node.child(c));
        }
    }
^
    def self.stronger_than(level, monsters)
        monsters.select { |m| m.level > level }
    end
