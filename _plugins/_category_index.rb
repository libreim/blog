module Jekyll
  class CategoryIndex < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
      self.data['category'] = tag
      cat_title_prefix = site.config['category_title_prefix'] || 'Posts Tagged &ldquo;'
      cat_title_suffix = site.config['category_title_suffix'] || '&rdquo;'
      self.data['title'] = "#{cat_title_prefix}#{tag.split("/").last}#{cat_title_suffix}"
    end
  end
  class CategoryGenerator < Generator
    safe true
    def generate(site)
      if site.layouts.key? 'category_index'
        dir = site.config['category_dir'] || 'category'
        colname = site.config['category_collection'] || 'posts'
        collection = site.collections.to_h[colname]
        # Work in progress
        # puts "#{collection}"
        # collection.categories.keys.each do |cat|
        #   write_category_index(site, File.join(dir, cat), cat)
        # end
      end
    end
    def write_category_index(site, dir, cat)
      index = CategoryIndex.new(site, site.source, dir, cat)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end
  end
end
