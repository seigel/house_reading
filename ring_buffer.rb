class Array; def sum; inject( nil ) { |sum,x| sum ? sum+x : x }; end; end
class Array; def mean; sum / size; end; end

class RingBuffer < Array

  alias_method :array_push, :push
  alias_method :array_element, :[]

  def initialize( size )
    @ring_size = size
    super( size )
  end

  def push( element )
    if length == @ring_size
      shift # loose element
    end
    array_push element
  end

  def average
  	
  end
  
  def []( offset = 0 )
    return self.array_element( - 1 + offset )
  end
end

