require 'anemone'
require 'pp'
class Crawl
  
  def self.fetch(url="http://localhost:3000")
    check=Array.new
    Anemone.crawl url do |anemone|
      begin
        anemone.on_every_page do |page|
          unless check.find{|x| x===page.url}
            check << page.url 
          else 
            pp check
            break
          end        
          print page.url, "\n"
        end
      rescue LocalJumpError
        p $!
        p $!.reason
      end
    end
  end
end
