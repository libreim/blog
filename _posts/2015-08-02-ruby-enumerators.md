---
layout: post
title: "Iterating in Ruby: Enumerable and Enumerators"
authors:
  - fdavidcl
category: Programación
---

The syntax of a programming language is one of the key points when it comes to
the difficulty in its learning process. Here we examine the traditional syntaxes
for iterating through a collection of any type, and place them face to face with a
newer, more semantic one based on objects called Enumerators.

## Introduction

Let's imagine we've got a collection of items, such as an array, a hash or a
set. We may want to be able to iterate through all its elements, either with
a determinate order or without it. To achieve this task in most programming
languages we usually resort to loop structures, for example a *for* loop.
In this case, we will need to use a special syntax in order to
describe the conditions in which the iterations will be made. For example, in
a C-like language:

~~~c
for (int i = 0; i < arr_size; i++) {
    // Code goes here
}
~~~

<!--more-->

Likewise, in a Pascal-style language we could write something like the
following:

~~~pascal
for index := 0 to arr_size do
begin
    // Code goes here
end;
~~~

Since loops of this kind have a very generic syntax, and they're frequently
used for these tasks, some languages provide a *for..in* loop able to iterate
through the items of a collection:

~~~cpp
// C++11
for (auto& item : collection) { }
~~~

~~~pascal
// Pascal
for item in collection do ;
~~~

These syntaxes can sometimes become cumbersome, for example, when using the
`::iterator` class of STL containers in C++:

~~~cpp
for (vector<MyClass>::iterator it = collection.begin(); it != collection.end; ++it) { }
~~~

This makes the code more difficult to read and makes it less semantic, since
a programmer who isn't aware of the use of iterators in C++ wouldn't find it
easy to understand.

Let's fix this.

## The Enumerable mixin

### each
Let me introduce you to our first Ruby enumerator, given by the `each` method:

~~~ruby
collection.each do |item|
    # Do things with 'item'
end
~~~

Well that was easy. But still, a couple of things are happening here. First, we
are calling the `each` method for `collection` (suppose this is an array, for example)
which accepts no parameters (so we could have written `.each() do...`).
Then, we are specifying a *block* between `do` and `end`; this is a piece of
code received by the method, who can call it on demand (more on that later).
The block does however receive one parameter, indicated between vertical bars
`|item|`. Each time the block is run, `item` will contain a different element
of the collection.

This method is nonetheless a very special one, since a whole module of code
can be incorporated to any class that implements it. This new module is the
Enumerable mixin[^ruby-enumerable]. A mixin is a piece of code that adds
functionality but isn\'t autonomous on its own. Enumerable incorporates several
methods that take advantage of the `each` method to be able to retrieve elements
and look for items with certain properties, map functions to all of them,
accumulate elements using an operator, etc.

In the following subsections we will take a look at the main purposes these
methods can fulfill. Not all the methods available will be covered, but an
exhaustive reference can be found in the [Ruby documentation](http://ruby-doc.org/core-2.2.2/Enumerable.html).

### Taking elements

Extracting elements from a collection is usually a functionality implemented
directly into the class, but despite that, Enumerable includes some basic
methods which may come in handy.

Firstly, the `take` method is pretty straightforward: it returns as many
elements from the collection as specified. Likewise, the `first` method is as simple as
it sounds: if no parameters are passed, it returns the first item. Otherwise,
it can achieve the same task as `take`.

~~~ruby
arr = [6, 2, 8, 3, 1, 8]

arr.take 3
=> [6, 2, 8]
arr.first
=> 6
arr.last
=> 8
~~~

Other interesting methods that return elements of a collection are `cycle` and
`drop`. The first one is able to indefinitely provide with items by cycling
through the collection, whereas the latter returns the elements left after
dropping as many as the parameter indicates.

~~~ruby
(0..2).cycle(3).to_a
=> [0, 1, 2, 0, 1, 2, 0, 1, 2]
(0..5).drop 3
=> [3, 4, 5]
~~~

### Detecting items with certain properties

The Enumerable mixin incorporates a lot of methods for detecting and finding
elements by user criteria. The simplest and less informative ones just return
a boolean value; for instance `any?`, `all?`, `one?`, `none?`:

~~~ruby
arr = [5, 2, 7]

arr.any? &:even?
=> true
arr.all? &:even?
=> false
arr.one? &:even?
=> true
arr.none? &:even?
=> false
~~~

The syntax used in this example is a shortcut for passing a block, that is, the
call to `any?` above is equivalent to the following:

~~~ruby
arr.any? do |i|
  i.even?
end
=> true
~~~

Other methods that return specific elements are `find`, `find_index`, `max`
and `min`. The `find` method takes a block, calls it for each element of the
collection, and returns the first element that makes the block evaluate
as true. `find_index` behaves similarly but returns the index of the matching
element, instead of the element itself. Lastly, the `min` and `max` methods
return the minimum and maximum values respectively, accepting a block that
can serve as a comparison operator.

~~~ruby
(10..20).find do |i|
  i % 6 == 0
end
=> 12

(10..20).find_index do |i|
  i % 6 == 0
end
=> 2

arr.min
=> 2
arr.max
=> 7

%w(hola hi hei).min do |a, b|
  a.length <=> b.length
end
=> "hi"
~~~

Note
: Comparison operators in Ruby work as a three-way comparison[^wiki-3comp], that is,
  they return 1, 0 or -1 according to whether $$a < b$$, $$a = b$$ or $$a > b$$.
  The *spaceship* (`<=>`) operator implements this kind of behavior.

### Filtering elements

An useful application of the iteration through a collection is to filter its
elements and obtain a new collection, either by retaining or dropping the ones
which match a certain criterion. This can be achieved with two methods called
`select` and `reject`:

~~~ruby
data = [0, 2, 3, 0, 0, 0, 1, 1, 5, 6, 0]

data.select &:zero?
=> [0, 0, 0, 0, 0]
data.reject &:zero?
=> [2, 3, 1, 1, 5, 6]
~~~

Note
: As seen in the example, these methods don't actually modify the object
  identified by `data`, but instead they return a new array as a result.
  Their "exclaimed" counterparts, `select!` and `reject!`, on the contrary, do
  alter the object with the result of the filter.

  ~~~ruby
  data.select! &:zero?
  => [0, 0, 0, 0, 0]
  data
  => [0, 0, 0, 0, 0]
  ~~~

  The exclamation notation for methods that alter the object
  they're called on, or have side effects in general,
  is pretty common in Ruby, and the manipulation methods
  listed on the following subsection also have an "exclaimed" duplicate.

### Manipulating collections

Enumerable provides several methods that allow reordering and applying
different processes to items. The `sort` method is simple and works as
expected, using Quicksort as the underlying algorithm[^ruby-quicksort].
A block can be passed to `sort` to be relied on as comparison operator.

~~~ruby
l18n = ["Hola mundo!", "Hello world!", "Salut le monde!"]

l18n.sort # Lexicographic order
=> ["Hello world!", "Hola mundo!", "Salut le monde!"]

l18n.sort do |a, b|
  b.length <=> a.length # Inverse length order
end
=> ["Salut le monde!", "Hello world!", "Hola mundo!"]
~~~

The `zip` method allows to create tuples of elements by passing one or
several collections:

~~~ruby
langs = [:es, :en, :fr]
=> [:es, :en, :fr]
langs.zip l18n
=> [[:es, "Hola mundo!"], [:en, "Hello world!"], [:fr, "Salut le monde!"]]
~~~

The `group_by` method classifies the items of the collection
according to the different values the block returns and composes a Hash:

~~~ruby
(1..8).group_by &:even?
=> {false=>[1, 3, 5, 7], true=>[2, 4, 6, 8]}
~~~

Finally, a more generic methods that enables the programmer to apply a function
to every element and put together an array with the results is `map`, also
known as `collect`:

~~~ruby
(0..8).map do |i|
  i % 5
end
=> [0, 1, 2, 3, 4, 0, 1, 2, 3]
~~~

### Other methods

There are two more methods worthy of mention: `reduce`, which is able to
aggregate values into an accumulator, and `lazy`, which creates a lazy
enumerator out of the collection (an object that can serve as a wrapper
for manipulation of infinite elements).

Firstly, `reduce` generalizes the task of iteratively merging elements
into any kind of result such as a sum or a mean. It can be used jointly with
the `map` method to gather information about the collection:

~~~ruby
# Sum the length of all the words in a string
%w(I can has cheezburger).map(&:length).reduce(&:+)
=> 18
~~~

For its part, `lazy` can take any collection and create a lazy enumerator out
of it, but it's most useful when used with infinite sequences:

~~~ruby
nonnegative = (0..Float::INFINITY).lazy

fibonacci = nonnegative.map do |n|
  if n <= 1
    n
  else
    # Sum the two previous elements
    fibonacci.take(n).drop(n - 2).reduce(&:+)
  end
end

fibonacci.take(10).force
=> [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
~~~

Note that in this last example the `force` method is used to make the interpreter
calculate the results. Otherwise, it would just return another lazy enumerator
to allow chaining methods. This particular version of the fibonacci sequence is very slow, because it
will recursively calculate every number in the sequence out of the previous
ones. A memoized version can be written with a lambda function[^lazy-ruby]. Later
on, another faster way to enumerate the Fibonacci sequence will be shown.

### Using Enumerable in your class

Adding all this functionality to a class in Ruby is as easy as implementing an
`each` method and including the Enumerable mixin, like in the following example:

~~~ruby
class Blog
  include Enumerable

  def initialize
    # The class uses any kind of internal collection
    @posts = [
      "Mean inequalities",
      "introduction to JavaScript",
      "Introduction to Category Theory",
      "Genetic algorithms"
    ]
  end

  # The each method should invoke 'yield' for every element
  def each
    @posts.each do |p|
      yield p
    end
  end
end

dgiim = Blog.new
dgiim.first
=> "Mean inequalities"
~~~

## Using blocks

Being able to receive and call blocks of code within methods is the key point for
Enumerable methods to work. The `each` method provides the ability to iterate
through all elements, which allows the rest of the methods to act on each element
according to the returned value of a block.

As we've seen before, a block in Ruby is just a piece of code wrapped between
`do` and `end`. Method symbols can be used together with an ampersand (&) as
a short-hand for blocks. This means that if we have a collection of objects
of class `MyClass`, and they implement method `my_method`, then its symbol is
`:my_method`, and one could use the syntax `&:my_method` to compact the following
block:

~~~ruby
do |i|
  i.my_method
end
~~~

Any method defined by the programmer can receive and call a block, either via the
`yield` statement of the `call` method. In this first example, we use `yield` to
execute a block without parameters:

~~~ruby
def call_block
  puts "Before calling block"
  yield
  puts "After calling block"
end

call_block do
  puts "This is block"
end
~~~

Output:

~~~markdown
Before calling block
This is block
After calling block
~~~

The second example shows how to receive a block as a parameter with the ampersand
syntax, execute it with `call` and pass parameters to it:

~~~ruby
def call_block(&block)
  puts "Before calling block"
  block.call 4
  puts "After calling block"
end

call_block do |arg|
  puts "I was passed argument #{arg}"
end
~~~

Output:

    Before calling block
    I was passed argument 4
    After calling block

Lastly, blocks can be stored as objects of class Proc in variables[^ruby-blocks].
In order to do this, we can just pass the block to the constructor:

~~~ruby
square = Proc.new do |n|
  n**2
end

square.call 5
=> 25
~~~

Procs can be passed as blocks by using the same ampersand syntax. Notice that in
this case the variable itself is used instead of a symbol (`:square`), because we
want to pass the whole object instead of its name.

~~~ruby
def apply_proc(arg, &proc)
  proc.call arg
end

apply_proc 5, &square
=> 25
~~~

## The Enumerator class

Most of the methods seen above return processed results when they receive a block,
but when they don't, they can return an object of class Enumerator[^ruby-enumerator]. This object
is a wrapper that contains the information necessary to iterate through the
collection.

Additionally, Enumerators implement the `each` method as well, so
Enumerable methods can also be called on them. This means Enumerators can be
chained, which is useful to modify the way we act on collections without implementing
new methods. For example, if we wanted to enumerate an array of items starting from
the back and grouping them according to their index modulo 3, we would write something
like the following:

~~~ruby
arr = %w(a b c d e)
arr.reverse_each.group_by.each_with_index do |item, index|
  index % 3
end
=> {0=>["e", "b"], 1=>["d", "a"], 2=>["c"]}
~~~

Notice how the chaining order changes how elements are returned. Indexes are not
returned in the example above, but they can be obtained by just swapping `group_by`
and `each_with_index`:

~~~ruby
arr.reverse_each.each_with_index.group_by do |item, index|
  index % 3
end
=> {0=>[["e", 0], ["b", 3]], 1=>[["d", 1], ["a", 4]], 2=>[["c", 2]]}
~~~

Enumerators need not be created out of existing collections, method `new` of the
class can be used as well. This method accepts a block with a parameter that will
act as "yielder object". The block is expected to iteratively push each element to
the yielder, which will in turn retrieve only the elements needed, pausing the
generation of elements otherwise. A simple Enumerator can be just a countdown from
10 to 1:

~~~ruby
countdown = Enumerator.new do |yielder|
  n = 10

  until n == 0
    yielder << n
    n -= 1
  end
end

countdown.take 5
=> [10, 9, 8, 7, 6]  
~~~

Since the yielder will only use the necessary elements, Enumerators can generate
infinite sequences. For example, the following Enumerator generates
prime numbers, and the next one is a fast Fibonacci generator.

~~~ruby
# Primes Enumerator
primes = Enumerator.new do |yielder|
  n = 2

  loop do
    yielder << n

    # Find next prime
    prime = false
    until prime
      n += 1

      prime = (2..Math.sqrt(n).floor).all? do |i|
        n % i != 0
      end
    end
  end
end

primes.take 10
=> [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

# Fibonacci Enumerator
fibonacci = Enumerator.new do |yielder|
  a, b = 0, 1

  loop do
    yielder << a

    a, b = b, a + b
  end
end

# Calculate 500 elements, retrieve last
fibonacci.take(500).drop(499)
=> [86168291600238450732788312165664788095941068326060883324529903470149056115823592713458328176574447204501]
~~~

Have you noticed the `loop` word used above to create an infinite loop? It's actually
just a function using an Enumerator which generates infinitely many `nil` values. It can be seen
as well how the typical `[]` accesor can't be used on an Enumerator, simply because
it's not implemented; but we can do that for ourselves:

~~~ruby
class Enumerator
  def [](index)
    take(index)[index - 1]
  end
end

fibonacci[100]
=> 218922995834555169026
~~~

## Conclusions

In this article we've studied how different syntaxes work for the same purposes of iteration. Classic
`for` loops are generic and not very semantic. This means that, in addition to being a
special structure, they commonly force the programmer to expose the logic used to
iterate through a collection. This is something that generally should be avoided, and
the class of the collection should be the one providing the functionality.

Furthermore, different tasks can be achieved with generic loops, that then need an
explanation of some comments. To solve this, the Enumerable mixin incorporates very
specific iteration methods that are mostly self-explanatory, and ease programming as
well as later readings of the code. Finally, in addition to iterating through existing collections, items can be generated
on demand with Enumerator objects. Enumerators and lazy Enumerators are powerful
tools to calculate elements of finite and infinite sequences. I'd encourage you to
give them a try, be creative and find new ways to use them.

## References

[^ruby-enumerable]: [Enumerable - Ruby Docs](http://ruby-doc.org/core-2.2.2/Enumerable.html)
[^wiki-3comp]: [Three-way comparison - Wikipedia](https://en.wikipedia.org/wiki/Three-way_comparison)
[^ruby-quicksort]: [Ruby Algorithms: Sorting, Trie and Heaps - Ilya Grigorik](https://www.igvita.com/2009/03/26/ruby-algorithms-sorting-trie-heaps/)
[^lazy-ruby]: [Lazy Ruby - Effluence](https://sonnym.github.io/2014/04/05/lazy-ruby/)
[^ruby-blocks]: [Understanding Ruby Blocks, Procs and Lambdas - Reactive.IO](http://www.reactive.io/tips/2008/12/21/understanding-ruby-blocks-procs-and-lambdas/)
[^ruby-enumerator]: [Enumerator - Ruby Docs](http://ruby-doc.org/core-2.2.2/Enumerator.html)
