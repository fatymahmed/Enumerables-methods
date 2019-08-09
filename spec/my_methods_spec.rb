require './my_methods'

RSpec.describe Enumerable do
	describe "#my_each" do
		it "returns each of the elements in the array" do
			expect([1,2,3,4].my_each{|element| element}).to eql([1,2,3,4])
		end
	end
	describe "#my_all" do
			it "returns true if condition holds for all elements ,otherwise returns false" do
				expect([2,1,2,4,8].my_all { |num|  num.even?  }).to eql(false)
			end
		end
		describe "#my_any" do
			it "returns false if condition doesn't hold for all elements ,otherwise returns true" do
				expect([2,1,2,4,8].my_any { |num|  num.even?  }).to eql(true)
			end
		end
		describe "#my_none" do
			it "returns false if condition hold for any elements ,otherwise returns true" do
				expect([2,1,2,4,8].my_none { |num|  num.even?  }).to eql(false)
			end
		end
  end