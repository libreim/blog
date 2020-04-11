#     Script for updating Gemfile in our Jekyll site
#     Usage: ruby update_versions.rb
#     Copyright (C) 2020  Diego Asterio de Zaballa

#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.

#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.

#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <https://www.gnu.org/licenses/>.


require 'net/http'
require 'json'
require 'uri'
require 'tempfile'
require 'fileutils'

name_vers = Struct.new(:name, :version)
# Regex for finding gems
GEM_RE = /^(?<space>\s*)gem\s+[\"\'](?<name>(?:\w|[-_\/])+)[\"\']\s*(?:,\s*[\"\']((?:<=|>=|~>)\s*)?(?<version>(?:.|\d)+)[\"\'])?$/


def replacement_gem(line, versions)
  ret = nil
  # Checks if the line is a gem 
  m = line.match GEM_RE
  if m
    name = m[:name]
    indent = m[:space]
    # If inside versions recommended by github change the line
    if versions[name]
      ret = "#{indent}gem \"#{name}\", \"#{versions[name]}\""
    end
  end
  ret
end
   
if __FILE__ == $0
  uri = URI('https://pages.github.com/versions.json')
  res = Net::HTTP.get_response(uri)
  return unless res.class.body_permitted? and !res.body.nil?
  msg = res.body
  versions = JSON.parse(msg)
  path = "./Gemfile"
  temp_file = Tempfile.new("Gemfile")
  begin
    File.open(path,mode="r") do |file|
      file.each_line do |line|
        repl = replacement_gem(line, versions)
        if repl
          temp_file.puts repl
        else
          temp_file.puts line
        end
      end
    end
    temp_file.close
    FileUtils.mv(temp_file, path)
  ensure
    temp_file.close
    temp_file.unlink
  end
end
