#!/usr/bin/env ruby
#encoding: utf-8

#
# Rakefile
# Automatic task completion for Math&CS blog
#
# Usage: rake [<task>]
#   By default `rake` will generate the static site from the current files
#   and start a local server
#

# Default: Blog server
def jekyll_serve
  system "jekyll serve --watch"
end
task :default do jekyll_serve end
task :serve do jekyll_serve end

# Create new post
task :post do
  require 'date'
  require 'etc'
  require 'git'

  # Read and create filename
  print "Post name: "
  name = STDIN.readline.chomp
  date = Date.today.strftime "%Y-%m-%d"
  filename = name.downcase.split(" ")[0..4].join(" ")

  subs = {
    "á" => "a",
    "é" => "e",
    "í" => "i",
    "ó" => "o",
    "ú" => "u",
    /[^a-z ]/ => "",
    " " => "-"
  }

  subs.each do |k, v|
    filename.gsub! k, v
  end

  branch_name = "post-#{filename}"
  filename = "#{date}-#{filename}.md"
  filepath = "_posts/" + filename

  # Read data
  print "Author (#{Etc.getlogin}): "
  author = STDIN.readline.chomp
  author = Etc.getlogin if author.empty?

  # Read category
  print "Category: "
  cat = STDIN.readline.chomp

  raise StandardError, "File already exists" if File.exists? filepath

  g = Git.open "."
  puts g.branch(branch_name).checkout

  File.open filepath, "w" do |f|
    f.write "---
layout: post
title: #{name}
authors:
  - #{author}
category: #{cat}
---


<!--more-->
"
  end

  puts "Done! Go write something in #{filepath}"
end

task :review do

end

task :help do
  BOLD = "\e[1m"
  RST = "\e[m"

  puts "Rakefile
  Usage: #{BOLD}rake [<task>]#{RST}

  <task> can take the following values:
    - #{BOLD}serve#{RST} (default): generate the static site and start a server
    - #{BOLD}post#{RST}: create a new branch and prepare the Markdown file for a new post
    - #{BOLD}submit#{RST}: submit a new post for revision
    - #{BOLD}review#{RST}: choose a post branch and prepare a revision
    - #{BOLD}help#{RST}: show this help message
  "
end
