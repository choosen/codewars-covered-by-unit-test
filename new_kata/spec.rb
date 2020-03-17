#!/usr/bin/env ruby

require_relative 'solution'
require_relative '../test'

module Codewars
  Test.describe('kata function') do
    Test.it('Custom Specs') do
      # Test.assert_equals(kata_function(), [2, 3, 5])
    end

    Test.it('Basic Tests') do
      # paste here kata asserts
      Test.assert_equals(kata_function(1), 'Range: 0 Average: 1.00 Median: 1.00')
    end
  end
end
