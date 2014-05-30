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

JavaScript (JS) es el lenguaje de programación desarrollado por Netscape para
la web[^jsannouncement][^mdnjs]. Se trata de un lenguaje de script,
generalmente interpretado por el navegador del usuario, esto es, se ejecuta en
el *cliente*. Hablamos del cliente refiriéndonos a la máquina del usuario final
que visitará el sitio web, y del servidor para referirnos a la máquina o el
conjunto de ellas que lo almacenan y proporcionan. Sin embargo, también se
puede utilizar JavaScript como lenguaje de servidor gracias a
[Node.js](http://nodejs.org/).

JavaScript tiene una sintaxis similar a la de C++ o Java, y puede funcionar como
un lenguaje procedimental o como uno orientado a objetos. Además, es capaz de
responder a eventos generados mediante la interacción del usuario, lo que es
generalmente una de sus principales funciones.

Nota  : Pese al nombre, JavaScript no deriva de Java, los dos lenguajes apenas
se parecen, exceptuando el aspecto de la sintaxis. De hecho, se  llamó *Mocha* y
*LiveScript* antes de obtener su nombre definitivo.


Para ejecutar tu propio código JavaScript, pulsa F12 o Ctrl-Mayus-C en tu
navegador. En las herramientas de desarrollador tendrás una consola JS
interactiva disponible para experimentar.
Es importante notar que cada navegador implementa JavaScript de una manera
ligeramente distinta, luego puede haber peculiaridades en la forma de
aprovechar algunos recursos del navegador. El estándar del lenguaje se
denomina [ECMAScript](http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-262.pdf).

## Sintaxis y tipos

### Declaraciones, variables y funciones

JavaScript no es fuertemente tipado, por lo que declaramos las variables
simplemente con la palabra reservada `var`.  Declaramos una constante con
`const` y una función con `var ... = function()`.  También podemos declarar
variables simplemente con una asignación y funciones  con `function`, pero
entonces serán globales, lo que es equivalente a  declararlas fuera de
cualquier función (las variables y funciones globales se convierten en
atributos del objeto `window`).

~~~javascript
var una = 1;
const PI = 3.141592;

var perimetro_circulo = function(radio) {
    // Esta variable no estaba declarada antes,
    // así que es global
    tau = 2 * PI;

    return tau * radio;
};

// Función de ámbito global
function area_circulo(radio) {
    return PI * radio * radio;
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
un_objeto.otro;     // --> 3
un_objeto["dato"];  // --> "valor"
un_objeto.una_funcion();
~~~

La forma en que se define el objeto es conocida como *JavaScript Object
Notation* (JSON). Un objeto puede funcionar como un
diccionario, de la forma `{ clave: "valor", clave2: "otro" }`. Solemos llamar
*propiedad* a cada una de las parejas *clave-valor* de un objeto.

### Tipos
JavaScript tiene algunos tipos básicos: `Number`, `String`, `Boolean`,
`Date`, `RegExp`, y `Math`. El resto de objetos serán de tipo
`Object`, y las funciones y constructores son de tipo `Function`.
Se puede comprobar el tipo de un objeto mediante `typeof`:

~~~javascript
typeof 5; // --> Number
typeof []; // --> Object
typeof Math.pow; // --> Function
~~~

Además, se utilizan algunas palabras para identificar variables nulas y
no inicializadas: `null` y `undefined`, respectivamente. Para indicar
resultados de operaciones matemáticas no válidas se usa `NaN` (o `Infinity`,
en caso de divisiones por 0 o números demasiado grandes):

~~~javascript
var sin_inicializar;
sin_inicializar; // --> undefined

Math.log(-1); // --> NaN
Math.pow(2, 10000); // --> Infinity
~~~

### Control de flujo
Disponemos de las mismas estructuras que en el resto de lenguajes similares:

* if-else
* for
* for-in
* while
* do-while
* switch-case

La estructura *for-in* es algo diferente de sus equivalentes en C++ y Java,
y además de arrays nos permite recorrer las propiedades de cualquier objeto:

~~~javascript
var recetas = [
    {
        nombre: "Paella",
        ingrediente_principal: "arroz"
    },
    {
        nombre: "Tortilla",
        ingrediente_principal: "huevo"
    },
    {
        nombre: "Bocata",
        ingrediente_principal: "pan"
    }
];

for (var i in recetas) {
    // i referencia al índice!
    console.log("Receta nº " + i);

    for (var dato in recetas[i]) {
        // dato referencia la clave
        console.log(dato + ": " + recetas[i][dato]);
    }
}
~~~

Tenemos dos comparaciones de igualdad, una que convierte tipos implícitamente
para comparar el contenido, y otra que es estricta con los tipos:

~~~javascript
const POLO = 28;

// Comparación de igualdad:
POLO == "28"; // --> true

// Comparación de igualdad y tipo:
POLO === "28"; // --> false ("28" es String)
~~~

Por último, también podemos usar los operadores lógicos `||` y `&&` para control
de flujo, algo muy utilizado para escribir código compatible con todos los
navegadores:

~~~javascript
var nodo = document.getElementById("identificador");

// Cada navegador aceptará innerText o textContent
var texto = nodo.innerText || nodo.textContent;
~~~

## El Document Object Model

### Acceso a los nodos
Desde luego, si nuestro objetivo es modificar contenido en un sitio web e
interactuar con el usuario, es necesario algo más que todo esto. Para esta tarea
disponemos del *Document Object Model* o DOM, que básicamente se encarga de
proveer la información de la página web de una forma que sea consistente con el
lenguaje.

Así, tendremos disponibles una serie de objetos, partiendo de `window`,
que nos proporcionarán acceso, entre otros, a lo siguiente:

* `window.title`: Título de la página
* `window.location`
    * `location.href`: URL de la página
    * `location.hash`: *hash* (la parte del URL que viene después del símbolo `#`)
* `window.document`: Acceso a los nodos HTML del documento
    * `document.getElementByID(identificador)`: Obtiene un nodo mediante el
    identificador HTML (atributo `id`)
    * `document.querySelector(selector)`: Obtiene un nodo mediante un selector
    estilo CSS
    * `document.createElement(tipo)`: Crea un nuevo nodo HTML del tipo
    especificado

### Eventos
Además, para responder a interacciones del usuario disponemos de eventos, es decir, podemos asociar
funciones a acciones de tipo *click*, *key press*, *drag*, etc. de forma que la página web
responda ante ellas. Por ejemplo:

~~~html
<!-- Nodo HTML: -->
<input id="mi_boton" type="button" value="Púlsame">
~~~
~~~javascript
document.querySelector("#mi_boton").addEventHandler("click", function() {
    console.log("Has pulsado!");
});
~~~

## Orientación a objetos: Los prototipos


[^jsannouncement]: [Netscape and Sun announce JavaScript. Press Release](https://web.archive.org/web/20070916144913/http://wp.netscape.com/newsref/pr/newsrelease67.html)

[^mdnjs]: [About JavaScript - Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/JavaScript/About_JavaScript)

[^jsidentifiers]: [Valid JavaScript variable names - Mathias Bynens](http://mathiasbynens.be/notes/javascript-identifiers)
