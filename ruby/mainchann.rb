#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require './main.rb'

def input
  STDIN.gets.split(/,|\./)
end

t = Table.new
n = 0

while true
  p t.bombs.to_s + "個あるよ"
  print "#{n}回目\n"
  t.show
  x,y = input
  break if x =~ /q|(exit)|(quit)/ 
  t.select x.to_i,y.to_i
  n += 1
end
t.result
