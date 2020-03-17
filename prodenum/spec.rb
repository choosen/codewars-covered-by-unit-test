#!/usr/bin/env ruby

require_relative 'prodenum'
require_relative '../test'

module Codewars
  Test.describe('Part function') do
    Test.it('Return primitives') do
      Test.assert_equals(primitives(6), [2, 3, 5])
      Test.assert_equals(primitives(20), [2, 3, 5, 7, 11, 13, 17, 19])
      Test.assert_equals(primitives(23), [2, 3, 5, 7, 11, 13, 17, 19, 23])
    end

    Test.it('Basic Tests') do
      Test.assert_equals(part(1), 'Range: 0 Average: 1.00 Median: 1.00')
      Test.assert_equals(part(2), 'Range: 1 Average: 1.50 Median: 1.50')
      Test.assert_equals(part(3), 'Range: 2 Average: 2.00 Median: 2.00')
      Test.assert_equals(part(4), 'Range: 3 Average: 2.50 Median: 2.50')
      Test.assert_equals(part(5), 'Range: 5 Average: 3.50 Median: 3.50')
      Test.assert_equals(part(7), 'Range: 11 Average: 6.09 Median: 6.00')
      Test.assert_equals(part(8), 'Range: 17 Average: 8.29 Median: 7.50')
      Test.assert_equals(part(9), 'Range: 26 Average: 11.17 Median: 9.50')
      Test.assert_equals(part(25), 'Range: 8747 Average: 1126.14 Median: 500.00')
      Test.assert_equals(part(40), 'Range: 2125763 Average: 85158.49 Median: 14250.00')
      Test.assert_equals(part(41), 'Range: 3188645 Average: 113720.82 Median: 17745.00')
      Test.assert_equals(part(43), 'Range: 6377291 Average: 202904.65 Median: 27262.50')
      Test.assert_equals(part(44), 'Range: 9565937 Average: 271332.21 Median: 33796.00')
      Test.assert_equals(part(45), 'Range: 14348906 Average: 363114.82 Median: 41947.50')
      Test.assert_equals(part(46), 'Range: 19131875 Average: 484712.39 Median: 51975.00')
      Test.assert_equals(part(47), 'Range: 28697813 Average: 648367.27 Median: 64260.00')
      Test.assert_equals(part(48), 'Range: 43046720 Average: 867970.08 Median: 79830.00')
      Test.assert_equals(part(49), 'Range: 57395627 Average: 1159398.98 Median: 98227.50')
      Test.assert_equals(part(50), 'Range: 86093441 Average: 1552316.81 Median: 120960.00')
      Test.assert_equals(part(70), 'Range: 125524238435 Average: 549257140.37 Median: 6792296.50')
      Test.assert_equals(part(80),
                        'Range: 5083731656657 Average: 10690636285.93 Median: 46257666.00')
      Test.assert_equals(part(85),
                        'Range: 30502389939947 Average: 47546349133.03 Median: 118338202.50')
      Test.assert_equals(part(86),
                        'Range: 45753584909921 Average: 64140938095.38 Median: 142519500.00')
      Test.assert_equals(part(87),
                        'Range: 68630377364882 Average: 86564687494.46 Median: 171918450.00')
      Test.assert_equals(part(88),
                        'Range: 91507169819843 Average: 116736218163.45 Median: 206903800.00')
      # Test.assert_equals(part(89), "Range: 86093441 Average: 1552316.81 Median: 120960.00")
      # Test.assert_equals(part(90), "Range: 86093441 Average: 1552316.81 Median: 120960.00")
      # Test.assert_equals(part(95), "Range: 86093441 Average: 1552316.81 Median: 120960.00")
      # Test.assert_equals(part(96), "Range: 86093441 Average: 1552316.81 Median: 120960.00")
      # Test.assert_equals(part(97), "Range: 86093441 Average: 1552316.81 Median: 120960.00")
      # Test.assert_equals(part(98), "Range: 86093441 Average: 1552316.81 Median: 120960.00")
      # Test.assert_equals(part(100), "Range: 86093441 Average: 1552316.81 Median: 120960.00")
    end
  end
end
