#!/usr/bin/env ruby
#encoding utf-8

# Intérprete kramdown. Uso:
# ruby kramdown.rb archivo_markdown.md > salida.html

# Instalad kramdown mediante:
# sudo apt-get install ruby rubygems
# sudo gem install kramdown

require 'kramdown'

puts Kramdown::Document.new(IO.read ARGV[0]).to_html
