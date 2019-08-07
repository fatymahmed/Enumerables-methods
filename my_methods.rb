# frozen_string_literal: true

module Enumerable
  def my_each
    # your code here
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < length
      yield(i, self[i])
      i += 1
    end
  end

  def my_select
    result = []
    my_each { |element| result << element if yield(element) }
  end

  def my_all
    flag = true
    my_each { |element| flag &&= yield(element) }
    flag
  end

  def my_any
    flag = false
    my_each { |element| flag ||= yield(element) }
    flag
  end

  def my_none
    flag = false
    my_each { |element| flag ||= yield(element) }
    !flag
  end

  def my_count
    count = 0
    my_each { |element| count += 1 if yield(element) }
    count
  end

  def my_map(proc = nil)
    result = []
    result <<
    my_each do |element|
      if proc
        proc.call(element)         
      else
        yield(element)
      end
    end
    result
  end

  def my_inject(initial)
    result = initial || 0
    my_each do |element|
      result = yield(result, element)
    end
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