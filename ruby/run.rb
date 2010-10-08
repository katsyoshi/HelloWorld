#!/usr/bin/env ruby
require 'anemone'

Anemone.crawl"http://twitter.com/#!/katsyoshi/favorites" do |anemone|
  anemone.on_every_page {|page|
    p page.url
  }
end

