# frozen_string_literal: true

module Enumerable #:nodoc:
  def my_each
    # your code here
    result = []
    i = 0
    while i < length
      result << yield(self[i])
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
    result
  end

  def my_all
    flag = true
    my_each { |element| flag &&= yield(element) }
    flag
  end

  def my_any
    my_each { |item| return true if yield(item) }
    false
  end

  def my_none
    result = true
    my_each { |item| result = false if yield(item) }
    result
  end

  def my_count(my_arg = nil)
    arr = self
    count = 0
    if my_arg.nil?
      arr.my_each { count += 1 }
    else
      arr.my_each { |x| count += 1 if x == my_arg }
    end
    count
  end

  def my_map(&block)
    result = []
    if block.nil?
      my_each do |item|
        result << block.call(item)
      end
    else
      return result
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
    # puts %w[ant bear cat].all? { |word| word.length >= 3 }

    #  arr=[1,2,3,4]
    #  a1=arr.each{|element| element}
    #  puts a1
    # a2=arr.my_each{|element| element}
    # puts a2
    # arr.my_each_with_index{|element, index| puts "element #{element} at #{index} index"}
    # puts [2,1,2,4,8].my_all { |num|  num.even?  }

    #  puts [2,2,2,1,8].any? { |num|  num.odd?  }
    # puts [2,2,2,2,2].my_none { |num|  num.odd?  }

    # puts [2,7,2,5,2].my_count{ |num|  num.odd?  }
    # puts [2,2,2,5,2].my_count(2){}

    # pc=["hi","hey"].my_map{|element| element.upcase}
    # puts pc
    # puts [1, 2, 4, 2].my_count(2)
    # arr=[2,2,2,5,2]
    # res=arr.my_inject(1){|res,ele| res+ele}
    # puts res
    # multiply_els([2,4,5])
    # proc=Proc.new{
    # |element|
    # element.upcase}
    # ["hi","hey"].my_map(proc)
