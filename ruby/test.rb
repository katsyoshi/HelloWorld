#! /usr/bin/env ruby
require './crawl.rb'

Crawl::fetch()
p (1..10).inject(:+)
p (1..10).reduce(:*)
