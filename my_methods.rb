module Enumerable
  def my_each
      # your code here
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
        # your code here
    i = 0
    while i < self.length
      yield(i,self[i])
      i += 1
      end
  end

  def my_select
    result = []
    self.my_each { |element| result << element if yield(element) }
  end  
    
  def my_all
    flag = true
    self.my_each { |element| flag = flag && yield(element) }
    flag
  end  

  def my_any
    flag = false
    self.my_each { |element| flag = flag || yield(element) }
    flag
  end  

  def my_none
    flag = false
    self.my_each { |element| flag = flag || yield(element) }
    !flag
  end  

  def my_count
    count = 0   
    self.my_each { |element| count +=1 if yield(element) }
    count
  end  

  def my_map(proc = nil)
    result = []
    self.my_each { |element|
    if proc
      result <<  proc.call(element)         
    else
      result << yield(element)
    end
      }
    result
  end  

  def my_inject(i)
    result = i || 0
    self.my_each { |element| result = yield(result,element) }
    result
  end

  end

# def multiply_els(arr)
#     arr.my_inject(1){|res,ele| res*ele}
# end

#   arr=[1,2,3,4]
#   arr.my_each{|element| puts element}
#   arr.my_each_with_index{|index,element| puts "index: #{index} for #{element}"}
#   [2,2,2,4,8].my_all { |num|  num.even?  }
#   [2,2,2,4,8].my_any { |num|  num.odd?  }
#   [2,2,2,5,7].my_none { |num|  num.odd?  }

#   [2,2,2,5,2].my_count{ |num|  num.odd?  }
#   ["hi","hey"].my_map{|element| element.upcase}
#   [2,2,2,5,2].my_inject(1){|res,ele| res+ele}
#   multiply_els([2,4,5])
  
#   proc=Proc.new{
#     |element| 
#     element.upcase
#   }
#   ["hi","hey"].my_map(proc)