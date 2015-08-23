---
layout: post
title: Topological Sort
authors:
  - andreshp
  - stringparser
category: Teoría de Algoritmos
---

Al principio de los años sesenta se hicieron algunos estudios acerca de cómo analizar y representar las tareas involucradas a la hora de completar un projecto viendo cuáles son sus dependencias. Por ejemplo si tenemos ropa sucia y queremos acabar con ropa limpia y seca. Antes de meter la ropa en la secadora ha de estar lavada. Esto es trivial para un ser humano por supuesto, pero no para una máquina.

En Informática el mismo problema se puede encontrar en la planificación de instrucciones o en qué las tareas se llevan a cabo en un `makefile`. Si buscamos una descipción del problema un poco más abstracta encontraramos algo como lo que sigue.

Ordenación topológica de un grafo dirigido es una ordenación lineal de sus vértices tal que para cada esquina `uv` de un vértice `u` a otro `v`, `u` viene antes de `v` en su ordenación.

La ordeanción anterior es secuencial y aunque pueda haber más de un camino (más de una forma) en la que hacer una tarea que empiece en `u` y termine en, digamos, `w`, desde `u` no se puede volver a `u`.

<!-- more -->

La forma anterior de conectar vértices, tareas, es lo que hace que este tipo de grafos se denominen grafos acíclicos dirigidos[^grafos-dirigidos].

Así, una ordenación topológica del grafo es una lista de nodos que verifican que $$f(v) < f(u)$$ siendo $$f$$ la función que proproporciona la orenación topológica de dicho grafo. Así este tipo de grafos quedan defininos por sus vértices $$V$$ y esquinas $$E$$:

Dado un grafo dirigido $$(V, E)$$, supongamos que es acíclico. Una ordenación topológica es una lista de nodos, $$f: V \to \langle 1, \ldots, |V|\rangle$$ que verifica $$f(v) < f(u); \forall v \in (V,E)$$.

## Fuentes

- https://en.wikipedia.org/wiki/Topological_sorting

## Implementación en Python

- https://github.com/andreshp/Algorithms/tree/master/Graphs/TopologicalSort

## Problemas

- https://www.hackerrank.com/contests/projecteuler/challenges/euler079
- https://www.hackerrank.com/contests/indeed-prime-challenge/challenges/course-dilemma


## Referencias

[^grafos-dirigidos]: [Directed Acyclic Graph](https://en.wikipedia.org/wiki/Directed_acyclic_graph)
