require "test/unit"
require 'active_support'
# ============================ Test suite to test locally codewars
# To run type in shell i.e. `ruby prodenum/spec.rb`
# In that file require_relative ../test.rb and your solution + paste specs
module Codewars
  class Test < Test::Unit::TestCase
    GREEN_COLOR = "\e[0;32m".freeze
    RED_COLOR = "\e[0;31m".freeze
    FINISH_COLOR = "\e[0m".freeze

    alias :assert_equals :assert_equal

    def self.diff(first, second)
      first_s = first.split(' ')
      second_s = second.split(' ')
      common_part = second_s & first_s
      first_s.map do |word|
        color = common_part.include?(word) ? GREEN_COLOR : RED_COLOR
        [color, word, FINISH_COLOR].join
      end.join(' ')
    end

    def self.describe(description, &block)
      @@description = description
      puts 'Testing ' + description

      block.call

      @@description = ''
    end

    def self.description
      @@description
    end

    def self.assert_equals(test, expected, description = nil)
      name = Random.urandom(10).chars.map { |c| (c.ord % 25 + 97).chr }.join
      test_description = [self.description, self.it_description, description].compact.join(': ')
      define_method('test_' + name) { assert_equals(test, expected, test_description) }
    rescue => e
      puts "#{RED_COLOR} Error occured: #{e} #{FINISH_COLOR}", e.backtrace[0..1]
    end

    def self.it(description, &block)
      @@it_description = description
      begin
        block.call
      rescue => e
        puts "#{RED_COLOR} Error occured: #{e} #{FINISH_COLOR}", e.backtrace[0..1]
      end
      @@it_description = ''
    end

    def self.it_description
      @@it_description
    end
  end
end
