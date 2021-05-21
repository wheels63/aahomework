class Stack
  def initialize
    @arr = []
  end

  def push(el)
    @arr.push(el)
  end

  def pop
    @arr.pop
  end

  def peek
    @arr
  end

end

class Queue
  def initialize
    @arr = []
  end

  def enqueue(el)
    @arr.push(el)
  end

  def dequeue
    @arr.shift
  end

  def peek
    @arr
  end
end

class Map
  
  def initialize
    @map = []
  end

  def set(key,value)
    if @map.empty?
      @map << [key,value]
    else
      @map.each.with_index do |sub,i|
        if sub.first == key
          puts "key exists" 
          break
        else
          @map << [key,value]
        end
      end
    end
  end

  def get(key)
    @map.each { |sub| return sub if sub[0] == key }
  end

  def delete(key)
    @map.each.with_index do |sub,i|
      @map.delete_at(i) if sub[0] == key
    end
  end
end