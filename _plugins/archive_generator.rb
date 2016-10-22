# coding: utf-8
 # Jekyll archive page generator with pagination.
#
# Based on the category generator from 
# http://recursive-design.com/projects/jekyll-plugins/,
# which is copyright (c) 2010 Dave Perrett, 
# http://recursive-design.com/ and is licensed under the MIT
# license (http://www.opensource.org/licenses/mit-license.php), and
# on the pagination code from Jekyll itself.
#
# This code is copyright (c) 2011 Benjamin Curtis, and is licensed
# under the MIT license.
#
# A generator that creates archive pages for jekyll sites. 
#
# To use it, simply drop this script into the _plugins directory of your Jekyll site. You should 
# also create a file called 'archive_index.html' in the _layouts directory of your jekyll site 
# with the following contents (note: you should remove the leading '# ' characters):
#
# ================================== COPY BELOW THIS LINE ==================================
# ---
# layout: default
# ---
# 
# {% for post in paginator.posts %}
#   {% include post.html %}
# {% endfor %}
# 
# <p class="navigation">
#   {% if paginator.next_page %}
#     <span class="alignleft"><a href="/archives/{{ page.year}}/{{ page.month }}/page/{{ paginator.next_page }}/">« Previous Entries</a></span>
#   {% endif %}
# 
#   {% if paginator.previous_page %}
#     {% if paginator.previous_page > 1 %}
#       <span class="alignright"><a href="/archives/{{ page.year}}/{{ page.month }}/page/{{ paginator.previous_page }}/">Next Entries »</a></span>
#     {% else %}
#       <span class="alignright"><a href="/archives/{{ page.year}}/{{ page.month }}/">Next Entries »</a></span>
#     {% endif %}
#   {% endif %}
# </p>
# ================================== COPY ABOVE THIS LINE ==================================
# 
# You can alter the _layout_ setting if you wish to use an alternate layout, and obviously you
# can change the HTML above as you see fit. 
#
# When you compile your jekyll site, this plugin will loop through the list of archives in your 
# site, and use the layout above to generate a page for each one with a list of links to the 
# individual posts.
#
# Included filters :
# - archive_links:      Outputs the list of archives as <link> tags for use in the <head>
# - archive_selects:    Outputs the list of archives as <option> tags for use in a navigation drop-down box
#
# Available _config.yml settings :
# - archive_dir:          The subfolder to build archive pages in (default is 'archives').
# - archive_title_prefix: The string used before the archive name in the page title (default is 
#                          'Archive: ').
module Jekyll
  
  
  # The ArchiveIndex class creates a single archive page for the specified archive.
  class ArchiveIndex < Page
    
    # Initializes a new ArchiveIndex.
    #
    #  +base+         is the String path to the <source>.
    #  +archive_dir+ is the String path between <source> and the archive folder.
    def initialize(site, base, archive_dir, year, month)
      @site = site
      @base = base
      @dir  = archive_dir
      @name = 'index.html'
      self.process(@name)
      # Read the YAML data from the layout page.
      self.read_yaml(File.join(base, '_layouts'), 'archive_index.html')
      # Set the year and month for this page
      self.data['year'] = year
      self.data['month'] = month
      # Set the title for this page.
      title_prefix             = site.config['archive_title_prefix'] || 'Archive: '
      self.data['title']       = "#{title_prefix}#{year} &raquo; #{Jekyll::Filters::Months[month.to_i]}"
      # Set the meta-description for this page.
      meta_description_prefix  = site.config['archive_meta_description_prefix'] || 'Archive: '
      self.data['description'] = "#{meta_description_prefix}#{year} #{month}"
    end
    
  end
  
  
  # The Site class is a built-in Jekyll class with access to global site config information.
  class Site
    
    # Creates an instance of ArchiveIndex for each archive page, renders it, and 
    # writes the output to a file.
    #
    #  +archive_dir+ is the String path to the archive folder.
    #  +archive+     is the archive currently being processed.
    def write_archive_index(archive_dir, posts, year, month)
      index = ArchiveIndex.new(self, self.source, archive_dir, year, month)
      
      pages = Pager.calculate_pages(posts, self.config['paginate'].to_i)
      (1..pages).each do |num_page|
        pager = Pager.new(self.config, num_page, posts, pages)
        if num_page > 1
          newpage = ArchiveIndex.new(self, self.source, archive_dir, year, month)
          newpage.pager = pager
          newpage.dir = File.join(archive_dir, "page/#{num_page}")
          self.pages << newpage
        else
          index.pager = pager
        end
      end
      
      index.render(self.layouts, site_payload)
      index.write(self.dest)
      # Record the fact that this page has been added, otherwise Site::cleanup will remove it.
      self.pages << index
      
    end
    
    # Loops through the list of archive pages and processes each one.
    def write_archive_indexes
      if self.layouts.key? 'archive_index'
        dir = self.config['archive_dir'] || 'archives'
        posts_by_year_month = self.posts.inject({}) do |h, post|
          ((h[post.year] ||= {})[post.month] ||= []) << post
          h
        end.each do |year, months|
          months.each do |month, posts|
            self.write_archive_index(File.join(dir, year, month), posts.reverse, year, month)
          end
        end
        
      # Throw an exception if the layout couldn't be found.
      else
        throw "No 'archive_index' layout found."
      end
    end
    
    alias_method :original_site_payload, :site_payload
    def site_payload
      pl = original_site_payload
      pl['site']['archives'] = 
        self.posts.inject(Hash.new(0)) do |h, post|
          h["#{post.year}/#{post.month}"] += 1
          h
        end
      pl
    end
    
    
  end
  
  
  # Jekyll hook - the generate method is called by jekyll, and generates all of the archive pages.
  class GenerateArchives < Generator
    safe true
    priority :low

    def generate(site)
      site.write_archive_indexes
    end

  end
  
  class Post
    def year
      @year ||= date.strftime("%Y")
    end

    def month
      @month ||= date.strftime("%m")
    end
  end
  
  
  # Adds some extra filters used during the archive creation process.
  module Filters
    Months = %w(None January February March April May June July August September October November December)
    # Outputs a list of archives for archive links in the head
    #
    #  +archives+ is the list of archives to format.
    #
    # Returns string
    def archive_links(archives)
      archives.keys.sort.reverse.collect do |path|
        year, month = path.split('/').map(&:to_i)
        %Q{<link rel="archives" title="#{Months[month]} #{year}" href="/archives/#{path}/" />}
      end
    end
    
    # Outputs a list of archives for archive select options in the sidebar
    #
    #  +archives+ is the list of archives to format.
    #
    # Returns string
    def archive_selects(archives)
      archives.sort.reverse.collect do |path, count|
        year, month = path.split('/').map(&:to_i)
        %Q{<option value="/archives/#{path}/"> #{Months[month]} #{year} &nbsp;(#{count})</option>}
      end
    end
    
  end
  
end
