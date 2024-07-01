# _plugins/generate_tags.rb
module Jekyll
    class TagPageGenerator < Generator
      safe true
  
      def generate(site)
        if site.layouts.key? 'tag'
          site.tags.each do |tag, posts|
            # Generate a page for each tag
            site.pages << TagPage.new(site, site.source, File.join('tags', tag), tag)
          end
        end
      end
    end
  
    # Represents a tag page
    class TagPage < Page
      def initialize(site, base, dir, tag)
        @site = site
        @base = base
        @dir = dir
        @name = 'index.html'
  
        self.process(@name)
        self.read_yaml(File.join(base, '_layouts'), 'tag.html')
        self.data['tag'] = tag
        self.data['title'] = "Tag: #{tag.capitalize}"
      end
    end
  end
  