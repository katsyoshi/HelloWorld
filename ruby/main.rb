#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

class Bomb 
  attr_accessor :mawari, :open
  attr_reader :state  
  
  def initialize(state=false)
    @state = state 
    @mawari = 0
    @open = false
  end
  
  class Opened < Exception; end
  class Error < Exception; end

  def bomb 
    raise Bomb::Opened, "Opened This Place!!" if @open
    raise Bomb::Error,  "You are Lucky! This is Bomb!!" if @state
  end
end

class Table 
  attr_reader :bombs
  def initialize( x=10, y=10, per=0.1 )
    # @x = x; @y = y
    @bombs = 0
    @cells = Array.new(x){|z| 
      Array.new(y){|w| 
        k = false
        if rand() < per
          k = true 
          @bombs += 1
        end
        Bomb.new(k)
      } 
    }
    setmawari()
  end

  def select( x, y )
    n = @cells.size - 1; m = @cells[0].size - 1 
    raise TypeError if( x > m ) || ( y > n )
    @cells[x][y].bomb
  rescue TypeError 
    print "OB!\n"
  rescue Bomb::Opened
    print "Opened\n"
  rescue Bomb::Error
    print "You are Lucky! This is Bomb!!\n"
    result
    exit( 0 )
  else
    @cells[x][y].open = true
  end
  
  def show
    @cells.each{|x|
      x.each{|y|
        # @mawari = mawari(y)
        printf "%2d", y.mawari if y.open
        print " *" unless y.open
      }
      print "\n"
    }
  end
  
  def setmawari
    for x in 0 ... @cells.size
      for y in 0 ... @cells[0].size
        @cells[x][y].mawari = mawari( x, y )
        # print @cells[x][y].mawari
      end
      # print "\n"
    end
      
  end
  
  def mawari(x,y)
    z = 0
    mx = x - 1; my = y - 1;
    px = x + 1; py = y + 1;
    z+=1 if @cells[mx][my].state if mx >= 0 && my >= 0 
    z+=1 if @cells[mx][y].state  if mx >= 0
    z+=1 if @cells[mx][py].state if mx >= 0 && py < @cells[x].size
    
    z+=1 if @cells[x][my].state if my >= 0
    z+=1 if @cells[x][py].state if py < @cells[x].size
       
    z+=1 if @cells[px][my].state if px < @cells.size && my >= 0
    z+=1 if @cells[px][y].state  if px < @cells.size 
    z+=1 if @cells[px][py].state if px < @cells.size && py < @cells[x].size
       
    z
  end
  
  def result
    @cells.each{|x|
      x.each{|y|
        printf( "%2d", y.mawari ) unless y.state
        print " B" if y.state
      }
      print "\n"
    }
  end

  private :mawari, :setmawari
end
