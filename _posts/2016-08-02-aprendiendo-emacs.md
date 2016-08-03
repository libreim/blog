---
layout: post
authors:
  - M42
category: Programación
---

## Emacs

**Emacs** es un editor de texto construido sobre un intérprete del lenguaje 
**Elisp** para hacerlo extensible. Cada acción del editor constituye un comando
sobre el intérprete, por lo que podemos reescribir sus comandos o crear nuevos
comandos simplemente programando sobre el intérprete.

Emacs sirve como IDE la mayoría de lenguajes de programación, como
editor para programación literaria y ciencia reproducible; se integra con git y
con el sistema de archivos, y tiene extensiones disponibles para usarse como
aplicación para organizar listas de tareas, leer el correo o servir como hoja
de cálculo.

> I use Emacs, which might be thought of as a thermonuclear word processor.  
> **Neal Stephenson**, *In the Beginning... was the command line.*

### Instalación

Emacs puede encontrarse en la mayoría de gestores de paquetes, pero puede no
estar en su versión más actualizada

``` bash
sudo apt install emacs
```

Para escribir este artículo estoy usando `GNU Emacs 25.1`, pero la última 
versión estable es la **24.5**. La versión estable actual puede descargarse desde
[GNU](https://www.gnu.org/software/emacs/).

## Atajos de teclado

En emacs se usa la siguiente notación para escribir un atajos de teclado.
La mayoría de documentación que consultes usará `C-x` en lugar de `Control+x`:

| Atajo   | Descripción                                   | Comando         |
|---------|-----------------------------------------------|-----------------|
| C-x     | Mantener control pulsado mientras se pulsa n  | Next line       |
| C-x C-s | Mantener control pulsado pulsando x y luego s | Save file       |
| M-x     | Mantener alt o pulsar esc para luego pulsar x | Execute Command |
| RET     | Salto de línea, pulsar enter antes de seguir  |                 |


Usar atajos de teclado facilita mucho usar emacs rápidamente. [^emacs-productivo]

Cuando abras el programa por primera vez, te ofrecerá seguir un tutorial de emacs
escrito en emacs. El tutorial es muy útil para aprender a moverse dentro de
emacs, pero la mayoría de lo que cuenta no es especialmente fácil de aprender 
de una vez. Lo más chocante para un usuario nuevo es el sistema de copiar-pegar;
de forma muy simplificada: [^emacs-kill-buffer]

* `M-w` copia.
* `C-w` corta.
* `C-y` pega.

Otros comandos útiles de aprender antes de empezar con nada más son `C-x C-s` para
guardar y `C-x C-f` para abrir un archivo.

## Personalización

Prácticamente todos los parámetros que uses en emacs pueden ser ajustados a tu
necesidad. Desde los atajos de teclado, que puedes configurar a tu gusto; hasta
el tema de color y fuentes que usa el editor.

La forma más básica de editar todas estas configuraciones es `M-x customize group`,
que accede a un menú en el que se pueden modificar todas ellas. Todos los cambios
que aquí se hagan se guardarán en un archivo `.emacs` (o `init.el`, en las versiones
nuevas de emacs). Esta es la otra forma de configurar emacs, el archivo de inicio
`.emacs` contiene código en Elisp que se ejecutará al iniciar el editor. Algunos
paquetes necesitarán configuración adicional que abrá que incluir en este archivo.

[**.Emacs #2 - Customizations and themes** - *jekor*](https://youtu.be/mMcc0IF1hV0)

## Sistemas de paquetes

### Melpa
Es necesario añadir un repositorio más grande que el que trae GNU por defecto.
[MELPA](https://melpa.org/#/) es uno de los repositorios de paquetes de emacs más 
grandes y actualizados.
El repositorio de MELPA se añade desde `M-x customize-group RET package`. Dentro
de la pestaña de repositorios puede insertarse la dirección de MELPA:

```
Archive name: melpa-stable  
URL or directory name: https://stable.melpa.org/packages/
```

Para salir de cualquiera de las pantallas de customización se usa `q`.

Otra forma de conseguir este mismo efecto es añadirlo directamente a nuestro
archivo de configuración (`.emacs`/`init.el`), como se indica en las [instrucciones
de instalación](https://melpa.org/packages/) del repositorio.

### Paquetes

Podemos listar los paquetes que podemos instalar usado `M-x list-packages` y podemos
buscar entre los paquetes pulsando varias veces el comando `C-s`.

[**.Emacs #3 - Installing packages and extensions** - *jekor*](https://youtu.be/Cf6tRBPbWKs)

## Paquetes útiles

### Dired

Dired viene instalado por defecto con Emacs y permite navegar la estructura de 
directorios del sistema operativo. Podemos empezar a navegarla usando `M-x dired` y
pulsando `RET` cada vez que queramos abrir un archivo o una carpeta.

Podemos además afectar a los archivos. Por ejemplo, si queremos eliminar algunos
archivos, podemos marcarlos con `d` y eliminarlos definitivamente con `x`. 

[**.Emacs #4 - Exploring the filesystem** - *jekor*](https://youtu.be/7jZdul2fC94)

### org-mode
**org-mode** es un completo lenguaje de marcado, similar a Markdown, que se creó 
originalmente para gestionar listas de tareas, agendas y calendarios. Permite exportar 
documentos a una gran variedad de formatos (pdf, html, latex o markdown) e incluir
internamente trozos de código (programación literaria) y ejecutarlos. Además, tiene
un sistema de tablas en texto plano capaz de sustituir la hoja de cálculo para tareas
sencillas. Por todo esto, puede ser usado en tareas como la ciencia reproducible o la
programación literaria cuando Latex es demasiado complejo.

[**Getting started with org-mode** - *Harry Schwartz*](https://youtu.be/SzA2YODtgK4)

### magit
**magit** permite integrar Emacs con **git** fácilmente para incluir los commits desde
dentro del mismo editor. Usando `magit-status` llegamos a una pantalla en la que podemos
elegir qué ficheros añadir al commit con `s`, ejecutar el commit con `c c`, que nos mostrará
el buffer con el mensaje de commit y por último usar `C-c C-c` para enviarlo. El push y
pull los haremos desde `magit-status` con `P u` y `F u`, respectivamente.

Es útil asignar un atajo de teclado al comando `magit-status`, que es el que muestra la 
ventana desde la que controlamos el añadir y hacer commit de ficheros. Por ejemplo, podemos
fijarlo en `f9` añadiendo a nuestro archivo de configuración:

``` lisp
(global-set-key (kbd "<f9>") 'magit-status)
```

## Macros de teclado
Las macros de teclado nos dejan grabar una secuencia de acciones y volver a repetirla
tantas veces como sea necesaria. Se puede empezar a grabar con **"f3"** y terminar la
grabación y repetirla tantas veces como sea necesario con **"f4"**.

[**.Emacs #9 - Keyboard macros** - *jekor*](https://youtu.be/JfZ9fCHzkJw)

## Elisp

[Emacs Lisp](https://www.gnu.org/software/emacs/manual/html_node/elisp/), o Elisp, es un
lenguaje de programación diseñado específicamente para escribir un editor de texto.
Facilita el tratamiento de texto y el manejo de archivos y buffers.

Podemos escribir scripts en Elisp que se encarguen de tareas repetitivas en nuestro editor
de texto y asignarlas a atajos de teclado o ampliarlo con más funcionalidad. Un tutorial
básico sobre Elisp es [Learn Emacs Lisp in 15 minutes](http://emacs-doctor.com/learn-emacs-lisp-in-15-minutes.html).

## Referencias
[^emacs-wiki]: [Emacs Wiki](https://www.emacswiki.org/emacs/SiteMap) documenta todo lo relacionado con emacs. 
[^emacs-productivo]: Citation needed. Sólo puedo decir que a mí me funciona.
[^emacs-kill-buffer]: El [sistema](https://www.gnu.org/software/emacs/manual/html_node/emacs/Killing.html#Killing) que emacs usa para esto es bastante más sofisticado.
