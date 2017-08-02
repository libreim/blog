module Jekyll
  class CollectionIndex < Page
    def initialize(site, base, dir, collection)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'collection_index.html')
      documents = Array.new
      collection[1].docs.each do |page|
        documents.push(page.to_liquid)
      end
      self.data['col'] =  documents.to_liquid

      self.data['title'] = "#{collection[0]}".capitalize
    end
  end

  class CollectionIndexGenerator < Generator
    safe true

    def generate(site)
      site.collections.each do |collection|
        site.pages << CollectionIndex.new(site, site.source, File.join(collection[0]), collection)
      end
    end
  end
end
