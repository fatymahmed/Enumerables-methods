# frozen_string_literal: true

module Enumerable #:nodoc:
  def my_each
    # your code here
    result=[]
    i = 0
    while i < length
      result<<yield(self[i])
      i += 1
    end
    result
  end

  def my_each_with_index
    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    result = []
    my_each { |element| result << element if yield(element) }
    return result
  end

  def my_all
    self.my_each { |item|
      if !yield(item)
        return false
      end
    }
    return true
  end

  def my_any
    self.my_each { |item|
      if yield(item)
        return true
      end
    }
    return false
  end

  def my_none
    result = true
    self.my_each{|item| result = false if yield(item)}
    return result
  end

  def my_count(arg = nil)
    count = 0
    if arg.nil?
      my_each { |element| count += 1 if yield(element) }
    else
      my_each { |element| count += 1 if element == arg }
    end
    return count
  end

  def my_map(&block)
    result = []
    unless block == nil
      self.my_each do |item| 
        result << block.call(item) 
      end
    else
      return result
    end
  
    return result
  end  


  def my_inject(initial)
    result = initial || 0
    my_each do |element|
      result = yield(result, element)
    end
    return result
  end
end
# def multiply_els(arr)
#     arr.my_inject(1){|res,ele| res*ele}
# end

    # arr=[1,2,3,4]
    # a1=arr.each{|element| element}
    # puts a1
    # a2=arr.my_each{|element| element}
    # puts a2
    # arr.my_each_with_index{|element, index| puts "element #{element} at #{index} index"}
    # puts [2,1,2,4,8].my_all { |num|  num.even?  }

    # puts [2,2,2,1,8].my_any { |num|  num.odd?  }
    # puts [2,2,2,2,2].my_none { |num|  num.odd?  }

    # puts [2,7,2,5,2].my_count{ |num|  num.odd?  }
    # puts [2,2,2,5,2].my_count(2){}

    # pc=["hi","hey"].my_map{|element| element.upcase}
    # puts pc

    #   arr=[2,2,2,5,2]
    #   res=arr.my_inject(1){|res,ele| res+ele}
    #   puts res
    # #   multiply_els([2,4,5])
    #   proc=Proc.new{
    #     |element|
    #     element.upcase
    #   }
    #   ["hi","hey"].my_map(proc)
