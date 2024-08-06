module Jekyll
    class TagPageGenerator < Generator
      safe true
  
      def generate(site)
        site.tags.each do |tag, posts|
          site.collections['tag_pages'].docs << TagPage.new(site, site.source, tag)
        end
      end
    end
  
    class TagPage < Page
      def initialize(site, base, tag)
        @site = site
        @base = base
        @dir  = File.join('tags', tag.downcase.gsub(' ', '-'))
        @name = 'index.html'
  
        self.process(@name)
        self.read_yaml(File.join(base, '_layouts'), 'tag.html')
        self.data['tag'] = tag
        self.data['title'] = "Posts tagged with #{tag}"
      end
    end
  end