require 'json'
require 'nokogiri'

module Jekyll
  class SearchIndexGenerator < Generator
    safe true

    def generate(site)
      index = []
      site.pages.each do |page|
        if page.data['exclude_from_search']
          next
        end

        doc = Nokogiri::HTML(page.content)
        text = doc.text.gsub(/\s+/, ' ').strip

        item = {
          'title' => page.data['title'] || page.name,
          'url' => page.url,
          'content' => text
        }
        index << item
      end

      File.open(File.join(site.dest, 'search.json'), 'w') do |file|
        file.write(JSON.pretty_generate(index))
      end
    end
  end
end