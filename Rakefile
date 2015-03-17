task :default do
  system "jekyll serve --watch"
end

task :post do
  require 'date'
  
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
  
  filename = "#{date}-#{filename}.md"
  filepath = "_posts/" + filename
  
  # Read data
  print "Author: "
  author = STDIN.readline.chomp
  
  # Read category
  print "Category: "
  cat = STDIN.readline.chomp
  
  raise StandardError, "File already exists" if File.exists? filepath
  
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
