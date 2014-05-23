---
layout: chapter
title: Introducción a JavaScript. Programación con prototipos
authors:
 - fdavidcl
category: programación
permalink: /js/
---

~~~javascript
console.log("Hello World!!");
~~~

JavaScript es el lenguaje de programación desarrollado por Netscape para la web[^mdnjs].
Se trata de un lenguaje de script, generalmente interpretado por el navegador del usuario, esto es,
se ejecuta en el *cliente*. Hablamos del cliente refiriéndonos a la máquina del usuario
final que visitará el sitio web, y del servidor para referirnos a la máquina o el
conjunto de ellas que lo almacenan y proporcionan. Sin embargo, también se
puede utilizar como lenguaje de servidor gracias a [Node.js](http://nodejs.org/).

JavaScript tiene una sintaxis similar a la de C++ o Java, y puede funcionar como
un lenguaje procedural o como uno orientado a objetos. Además, es capaz de
responder a eventos generados mediante la interacción del usuario, lo que
es generalmente su función principal.

Es importante notar que cada navegador implementa JavaScript de una manera
ligeramente distinta, luego puede haber peculiaridades en la forma de
aprovechar algunos recursos del navegador. El estándar del lenguaje se
denomina [ECMAScript](http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-262.pdf).

## La sintaxis

### Declaraciones, variables y funciones

JavaScript no es fuertemente tipado, por lo que declaramos las variables
simplemente con la palabra reservada `var`. Declaramos una constante con
`const` y una función con `function`. También podemos declarar variables
simplemente con una asignación, pero entonces serán variables globales,
lo que es equivalente a declarar variables fuera de cualquier función
(las variables globales se convierten en atributos del objeto `window`).

~~~javascript
var una = 1;
const PI = 3.141592;

function perimetro_circulo(radio) {
    return 2 * PI * radio;
}

// Otra forma de declarar funciones
var area_circulo = function(radio) {
    return PI * radio^2;
}
~~~

### Colecciones y objetos
En JavaScript utilizamos los corchetes para representar arrays. Estos pueden
contener objetos de distinta naturaleza, por ejemplo, el siguiente array
es completamente válido:

~~~javascript
var válido = [20, "Hola", /^[a-z]/]
~~~

Nota
 : JavaScript acepta ciertos símbolos a la hora de nombrar variables. Un
 nombre de variable no puede empezar por un número, pero sí que puede
 comenzar y contener símbolos como `$`, `_` o incluso `π`[^jsidentifiers].



## El Document Object Model


## Orientación a objetos: Los prototipos


[^mdnjs]: [About JavaScript - Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/JavaScript/About_JavaScript)

[^jsidentifiers]: [Valid JavaScript variable names - Mathias Bynens](http://mathiasbynens.be/notes/javascript-identifiers)
