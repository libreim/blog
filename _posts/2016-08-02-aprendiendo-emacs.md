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
editor para programación literaria y ciencia reproducible; se integra con git o
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
versión estable es la 24.5. La versión estable actual puede descargarse desde
[GNU](https://www.gnu.org/software/emacs/).

## Atajos de teclado

En emacs se usa la siguiente notación para escribir un atajos de teclado.
La mayoría de documentación que consultes usará `C-x` en lugar de `Control+x`:

|---------|-----------------------------------------------|-----------------|
| C-x     | Mantener control pulsado mientras se pulsa n  | Next line       |
| C-x C-s | Mantener control pulsado pulsando x y luego s | Save file       |
| M-x     | Mantener alt o pulsar esc para luego pulsar x | Execute Command |
| RET     | Salto de línea, pulsar enter antes de seguir  |                 |
|---------|-----------------------------------------------|-----------------|

Usar atajos de teclado facilita mucho usar emacs rápidamente. [^emacs-productivo]

Cuando abras el programa por primera vez, te ofrecerá seguir un tutorial de emacs
escrito en emacs. El tutorial es muy útil para aprender a moverse dentro de
emacs, pero la mayoría de lo que cuenta no es especialmente fácil de aprender 
de una vez. Lo más chocante para un usuario nuevo es el sistema de copiar-pegar;
de forma muy simplificada: [^emacs-kill-buffer]

* `M-w` copia.
* `C-w` corta.
* `C-y` pega.

## Sistemas de paquetes

### Melpa
Es necesario añadir un repositorio más grande que el que trae GNU por defecto.
El repositorio de MELPA se añade desde `M-x customize-group RET package`. Dentro
de la pestaña de repositorios puede añadirse el de MELPA. Para salir de cualquiera
de las pantallas de customización se usa `q`.

### Paquetes
Podemos listar los paquetes que podemos instalar usado `M-x list-packages` y podemos
buscar entre los paquetes pulsando varias veces el comando `C-s`.

## Paquetes útiles
### Dired
Dired viene instalado por defecto con Emacs y permite navegar la estructura de 
directorios del sistema operativo. Podemos empezar a navegarla usando `M-x dired` y
pulsando `RET` cada vez que queramos abrir un archivo o una carpeta.

Podemos además afectar a los archivos. Por ejemplo, si queremos eliminar algunos
archivos, podemos marcarlos con `d` y eliminarlos definitivamente con `x`. 

## org-mode
**org-mode** es un completo lenguaje de marcado, similar a Markdown, que se creó 
originalmente para gestionar listas de tareas, agendas y calendarios. Permite exportar 
documentos a una gran variedad de formatos (pdf, html, latex o markdown) e incluir
internamente trozos de código (programación literaria) y ejecutarlos. Además, tiene
un sistema de tablas en texto plano capaz de sustituir la hoja de cálculo para tareas
sencillas. Por todo esto, puede ser usado en tareas como la ciencia reproducible o la
programación literaria cuando Latex es demasiado complejo.

## magit
**magit** permite integrar Emacs con **git** fácilmente para incluir los commits desde
dentro del mismo editor.

### Referencias
[^emacs-wiki]: [Emacs Wiki](https://www.emacswiki.org/emacs/SiteMap) documenta todo lo relacionado con emacs. 
[^emacs-productivo]: Citation needed. Sólo puedo decir que a mí me funciona.
[^emacs-kill-buffer]: El [sistema](https://www.gnu.org/software/emacs/manual/html_node/emacs/Killing.html#Killing) que emacs usa para esto es bastante más sofisticado.
