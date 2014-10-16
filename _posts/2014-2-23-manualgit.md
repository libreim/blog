---
layout: post
title: Manual rápido de Github/Git
authors:
  - fdavidcl
editors:
  - M42
  - ncordon
category: utilidades
---

## TL;DR
Instala git. Crea un repositorio desde la página de Github. Descárgalo con `git clone`. Actualiza tu versión local con `git pull`. Empaqueta cambios con `git commit -a`. Envía cambios con `git pull && git push`.

## La versión larga

Github es un servicio de almacenamiento de código con control de versiones Git. Git permite a los desarrolladores llevar un registro de todos los cambios realizados a lo largo del tiempo. Con una cuenta en Github puedes crear tantos repositorios (públicos) como quieras, y 5 privados si registras tu correo de la Universidad en [Github Edu](http://edu.github.com). Cada repositorio puede estar compartido por el creador para varios colaboradores, de forma que todos pueden editarlo.

La gran ventaja de Github/Git respecto de los sistemas de sincronización de archivos (como Dropbox o OneDrive) es que Git no almacena cada archivo completo generado tras cada cambio, sino únicamente los cambios que se han hecho desde la primera versión de cada archivo. Esto permite recuperar un código antiguo sin necesidad de hacer varias copias, y que varios colaboradores editen el mismo archivo sin crear conflictos de versiones, ya que los cambios se mezclan en un único archivo resultante.

Existen más sistemas de control de versiones aparte de Git, pero son en su mayoría centralizados (solo el servidor almacena el código completo), mientras que Git es un sistema distribuido, es decir, en el que todos los colaboradores obtienen una copia completa del repo y hacen sus propios cambios, estando en el servidor la combinación de los códigos de todos.

### Terminología
 - *repository/repo* - Lugar en Github para almacenar todo el código de un proyecto e ir registrando los cambios.
 - *clone* - Descargar el código de un repositorio y activar git sobre él.
 - *commit* - Crear un paquete de cambios a partir de los cambios realizados en la versión local del repo.
 - *pull* - Estando en la versión local del repo, descargar los cambios hasta la versión más actual.
 - *push* - Enviar los cambios (empaquetados en commits) de la versión local del repo a Github (para que los demás colaboradores puedan descargarlos).
 - *merge* - Mezcla de cambios de varios desarrolladores o cuando se envian commits realizados sobre versiones antiguas de los archivos.
 - *fork* - Copiar el código de un repositorio (en el que no tenemos permiso de edición) a otro propio para poder editar (y mejorar o arreglar fallos).

### Estado de los archivos
Puede consultarse el estado del repositorio usando `git status`. Simplificando, podemos tener los archivos en los siguientes estados:
 - No registrados (*untracked*) - Archivos y modificaciones no añadidas al repositorio. No se enviarán con el próximo commit. No se tienen en cuenta en el repositorio. Pueden añadirse con `git add`, y pasarán a estar registrados.
 - Registrados (*tracked*) - Archivos y modificaciones añadidos, que serán parte del próximo commit.
 - Formando parte del commit (*committed*) - Tras realizar un `git commit`, archivos y modificaciones que ya forman parte de un commit, aunque todavía no se haya enviado el commit al repositorio.
 - Enviados (*pushed*) - Tras enviar el commit con `git push`, los archivos ya forman parte del repositorio de GitHub.

Además, se pueden especificar archivos a ignorar completamente por git en el archivo `.gitignore`. En este archivo podemos añadir nombres de archivo y directorios (separados por saltos de línea) de forma que el registro de cambios no se realice nunca sobre ellos y ni siquiera aparecerán como *untracked*.

### Creación del repo
Asumiendo que usamos Linux para utilizar Github, hemos de instalar primero el sistema de control de versiones (en Ubuntu, `sudo apt-get install git` bastará). En Windows existe una [fantástica aplicación](http://windows.github.com) que hace todo el trabajo por nosotros, sin necesidad de línea de comandos (OS X también tiene [la suya](http://mac.github.com/)).

Un repositorio se puede crear desde la web de Github, que nos pedirá un nombre y nos sugerirá que comencemos añadiendo un archivo README. Una vez creado, copiamos el enlace que aparecerá al final de la sección derecha en la página del repo (terminado en *.git*) y ejecutamos en terminal `git clone URL` donde URL es la dirección obtenida. Esto creará una carpeta con contenido idéntico al del repo.

### Modificación
Antes de modificar nada es conveniente ejecutar `git pull` para descargar la última versión de los archivos, en caso de que algún colaborador los haya editado. Esto nos evitará merges innecesarios.

Tras crear archivos en la versión local, ejecutamos `git add file1 file2 ...` para añadirlos al control de cambios, o con `git add .`, para añadir todo lo que haya sido modificado, creado,... El comando `git rm file` se emplea para borrar archivos del repositorio.

Después de crear archivos o realizar varios cambios en los ya existentes es recomendable crear un commit con `git commit -a`. Esto nos abrirá una instancia del editor `nano` en la que podremos escribir un mensaje para el commit (no puede estar vacío), que describa los cambios realizados brevemente. Al pulsar Ctrl-O, Ctrl-X para guardar y salir, se termina la creación del commit. Aún no están enviados los cambios al repo online, sino que se ha realizado un registro de los mismos, y se puede decir que estamos un commit *por delante* de la versión en Github.

Antes de enviar los cambios es importante asegurar que se sobreescribirán en las versiones más recientes de los archivos (el repo en Github también podría estar varios commits por delante de nosotros) y para ello ejecutamos `git pull`. Normalmente nos diría que estamos en la versión más actual, pero si no lo estuviéramos no pasa nada, crearía un merge automático mezclando los cambios realizados por nosotros con los más modernos en Github (el caso de que haya conflictos está descrito más abajo).

Finalmente ejecutamos `git push origin master` que envía nuestros cambios y actualiza el repo en Github. Si ha sido necesario un merge se nos abrirá una instancia de `nano` con un mensaje por defecto para el mismo, que podremos cerrar (Ctrl-X) para mantener.

En resumen, el orden de comandos necesarios es:

 `git pull` -> (modificaciones) -> `git commit -a` -> `git pull` -> `git push origin master`

*Consejo:* Es cómodo añadir un alias a nuestro *.bashrc* para ejecutar las últimas tres órdenes de seguido. Para ello ejecutad

	echo "alias gitsync='git commit -a && git pull && git push origin master'" >> ~/.bashrc

*Nota:* `git push origin master` envía los cambios locales (*origin*) a la rama *master* (la principal) del repositorio en Github. Al trabajar con varias ramas podríamos ejecutar variaciones del tipo `git push origin rama_pruebas`.

### Conflictos
Si dos colaboradores trabajan simultáneamente sobre el mismo archivo es posible que se produzcan conflictos, es decir, que uno de ellos no tuviera actualizados los cambios del otro y envíe unos cambios que los sobreescribirían. En ese caso el merge automático falla y git deja que el usuario termine de mezclar los cambios manualmente (para ello separará en los archivos los cambios propios de los otros mediante marcas como `HEAD>>>>`). Tras terminar de mezclarlos, es suficiente con ejecutar de nuevo `git commit -a`, `git pull` y `git push`.

### Sitios web
Un repositorio con el nombre `username.github.io` (con *username* nuestro usuario) podrá almacenar páginas HTML que se accedan desde http://username.github.io. Además, una rama `gh-pages` en cualquier otro repositorio se podrá acceder desde http://username.github.io/nombre_repo/.

### Más avanzado
Este breve manual no abarca aún temas más avanzados como el aprovechamiento de las ramas (*branches*), los métodos para volver atrás en el código (*reverts* y demás), y la colaboración en otros proyectos mediante *forks* y *pull requests*.
