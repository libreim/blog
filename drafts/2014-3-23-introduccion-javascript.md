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

JavaScript (JS) es el lenguaje de programación desarrollado por Netscape para la web[^mdnjs].
Se trata de un lenguaje de script, generalmente interpretado por el navegador del usuario, esto es,
se ejecuta en el *cliente*. Hablamos del cliente refiriéndonos a la máquina del usuario
final que visitará el sitio web, y del servidor para referirnos a la máquina o el
conjunto de ellas que lo almacenan y proporcionan. Sin embargo, también se
puede utilizar JJavaScriptncomo lenguaje de servidor gracias a [Node.js](http://nodejs.org/).

JavaScript tiene una sintaxis similar a la de C++ o Java, y puede funcionar como
un lenguaje procedimental o como uno orientado a objetos. Además, es capaz de
responder a eventos generados mediante la interacción del usuario, lo que
es generalmente su función principal.

Nota
 : Pese al nombre, JavaScript no deriva de Java, los dos lenguajes apenas
 se parecen, exceptuando el aspecto de la sintaxis.

Es importante notar que cada navegador implementa JavaScript de una manera
ligeramente distinta, luego puede haber peculiaridades en la forma de
aprovechar algunos recursos del navegador. El estándar del lenguaje se
denomina [ECMAScript](http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-262.pdf).

## Sintaxis y tipos

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

Nota
 : JavaScript acepta ciertos símbolos a la hora de nombrar variables. Un
 nombre de variable no puede empezar por un número, pero sí que puede
 comenzar y contener símbolos como `$`, `_` o incluso `$\pi$`[^jsidentifiers].

### Colecciones y objetos
En JS utilizamos los corchetes para representar arrays. Estos pueden
contener objetos de distinta naturaleza, por ejemplo, el siguiente array
es completamente válido:

~~~javascript
var válido = [20, "Hola", /^[a-z]/];
~~~

Los objetos son uno de los pilares de JS. En este lenguaje, los objetos
existen, no se crean como instancias de una clase, por lo que podemos declarar
nuevos con la siguiente sintaxis:

~~~javascript
var un_objeto = {
    dato: "valor",
    otro: 3,
    una_funcion: function() {
        return Math.random();
    }
}

// Acceso a datos:
console.log(un_objeto.otro);     // --> 3
console.log(un_objeto["dato"]);  // --> "valor"
console.log(un_objeto.una_funcion());
~~~

La forma en que se define el objeto es conocida como *JavaScript Object
Notation* (JSON). Un objeto puede funcionar como un
diccionario, de la forma `{ clave: "valor", clave2: "otro" }`.

### Tipos
JavaScript tiene algunos tipos básicos: `Number`, `String`, `Boolean`,
`Date`, `RegExp`, y `Math`.

## El Document Object Model


## Orientación a objetos: Los prototipos


[^mdnjs]: [About JavaScript - Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/JavaScript/About_JavaScript)

[^jsidentifiers]: [Valid JavaScript variable names - Mathias Bynens](http://mathiasbynens.be/notes/javascript-identifiers)
