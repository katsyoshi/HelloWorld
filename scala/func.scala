object Func
{
  def main( args:Array[String] )
  {
    val x = 10
    if( args.size > 0 )
      x = args(0).toInt 
    println( func( x ) )
  }
  
  def func( x:Int ):Long = {
    if( x <= 1 )
      x
    else
      x * func( x - 1 )
  }
    
}
