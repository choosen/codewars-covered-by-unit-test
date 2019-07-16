require "test/unit"
require 'active_support'
# ============================ Test suite to test locally codewars
# To run type in shell i.e. `ruby prodenum/spec.rb`
# In that file require_relative ../test.rb and your solution + paste specs to Codewars module

module Codewars
  def self.method_missing(method_name, *args)
    [method_name, *args]
  end

  class SolutionKlass
    include Solution
  end

  class Test < Test::Unit::TestCase
    GREEN_COLOR = "\e[0;32m".freeze
    RED_COLOR = "\e[0;31m".freeze
    FINISH_COLOR = "\e[0m".freeze

    alias :assert_equals :assert_equal

    def setup
      @solution = SolutionKlass.new
    end

    def self.describe(description, &block)
      @@description = description
      puts 'Testing ' + description

      block.call

      @@description = ''
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

    def self.assert_equals(test, expected, description = nil)
      name = Random.urandom(10).chars.map { |c| (c.ord % 25 + 97).chr }.join
      test_description = [@@description, @@it_description, description, test[1..-1]].compact.join(': ')
      define_method('test_' + test[0].to_s + '_' + test[1].to_s) { assert_equals(@solution.public_send(test[0], *test[1..-1]), expected, test_description) }
    rescue => e
      puts "#{RED_COLOR} Error occured: #{e} #{FINISH_COLOR}", e.backtrace[0..1]
    end
  end
end
