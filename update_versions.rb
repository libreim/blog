require 'net/http'
require 'json'
require 'uri'
require 'tempfile'
require 'fileutils'

name_vers = Struct.new(:name, :version)
GEM_RE = /^(?<space>\s*)gem\s+[\"\'](?<name>(?:\w|[-_\/])+)[\"\']\s*(?:,\s*[\"\']((?:<=|>=|~>)\s*)?(?<version>(?:.|\d)+)[\"\'])?$/

def replacement_gem(line, versions)
  ret = nil
  m = line.match GEM_RE
  if m
    name = m[:name]
    indent = m[:space]
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
