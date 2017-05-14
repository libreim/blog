---
layout: post
title: Emacs for lazy people
authors:
    - fdavidcl
lang: en
category: Programación
---

Emacs is one of the most powerful, extensible editors out there.
However, learning to use it is not an easy task, and I'm just really
lazy. The following are some packages that I hope will make your life
way easier. And if you already use Emacs, I encourage you to try them
and see if they help you get a more comfortable development environment.

To add any of these packages to your Emacs configuration, find your 
initialization file (usually `~/.emacs` or `~/.emacs.d/init.el`) and
add the snippets there. You will also need to install and enable `use-package` 
beforehand ([why?](http://www.lunaryorn.com/posts/my-emacs-configuration-with-use-package.html)).

<!--more-->

Smex
----

In Emacs we use M-x
(<kbd>Alt</kbd>+<kbd>X</kbd>) to enter any
command without the need for a dedicated keyboard shortcut or menu
entry. By default Emacs doesn't help much while writing a command, and
it can be challenging to remember many of them, as well as tedious
writing the long ones (`package-list-packages` anyone?).
[Smex](https://github.com/nonsequitur/smex/) is a M-x enhancement for
Emacs, built on top of Ido, which means it will try to predict and
autocomplete commands as you write them.

In order to install and enable Smex, add the following code to your
initialization file:

~~~common_lisp
(use-package smex
:config (smex-initialize))
~~~

Ergoemacs
---------

If you're just starting to use emacs, you may find it difficult to learn
all the new keybindings. If you're a long-time user, you may have
experienced repetitive strain injury (RSI), also known as [Emacs
pinky](https://en.wikipedia.org/wiki/Emacs#Emacs_pinky). Don't worry,
I've got just the solution for you:
[ergoemacs-mode](https://ergoemacs.github.io/index.html) is a minor-mode
that sets ergonomic and well-known keybindings for common editing
functions, with the aim of reducing RSI as well as adding some
familiarity to the use of emacs.

Just as before, add the following code to your initialization file and
restart Emacs to use it:

~~~common_lisp
(use-package ergoemacs-mode
:init
  (setq ergoemacs-theme nil)
  (setq ergoemacs-keyboard-layout "es")
:config
  (ergoemacs-mode 1)
)
~~~

You can check [your new keybinding
layout](https://ergoemacs.github.io/key-setup.html). Remember that,
after enabling Ergoemacs, the keyboard shortcut that allows you to enter
a custom command becomes
<kbd>Alt</kbd>+<kbd>A</kbd>.

Which-key
---------

![]({{ site.baseurl }}/images/emacs-which-key.png)
{: .fig.med}

[Which-key](https://github.com/justbur/emacs-which-key) displays the key
bindings following your currently entered incomplete command. That way,
when you can't remember which key to press, you'll have a cheat sheet in
a couple of seconds.

~~~common_lisp
(use-package which-key
:config (which-key-mode))
~~~

Auto-reload stuff
-----------------

When using version control, files generally change while having them
open in the editor. If this happens, I expect my editor to refresh the
files so that I don't write on an old version. Emacs doesn't enable this
behavior by default, rather letting the user decide if they want to
reload files. Instead, we can set it to automatically reload files from
disk when changed via these configuration lines (source: [Pragmatic
Emacs](http://pragmaticemacs.com/emacs/automatically-revert-buffers/)):

~~~common_lisp
(global-auto-revert-mode 1)
(add-hook 'dired-mode-hook 'auto-revert-mode)
~~~

{:.note}
The [magit](https://magit.vc/) plugin for version control with git does
refresh the files without the need for this configuration (thanks [Nacho](https://ncordon.github.io/)
for the remark!).

Still want more?
-------------------

These are the main tools that have eased my way into Emacs. You can check out the rest of my configuration in [my dotfiles repository](https://github.com/fdavidcl/dotfiles/tree/master/emacs).
