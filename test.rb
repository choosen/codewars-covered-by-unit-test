require "test/unit"

# ============================ Test suite to test locally codewars
# To run type in shell i.e. `ruby prodenum/spec.rb`
# In that file require_relative ../test.rb and your solution + paste specs
class Test < Test::Unit::TestCase
  GREEN_COLOR = "\e[0;32m".freeze
  RED_COLOR = "\e[0;31m".freeze
  FINISH_COLOR = "\e[0m".freeze

  def self.diff(first, second)
    first_s = first.split(' ')
    second_s = second.split(' ')
    common_part = second_s & first_s
    first_s.map do |word|
      color = common_part.include?(word) ? GREEN_COLOR : RED_COLOR
      [color, word, FINISH_COLOR].join
    end.join(' ')
  end

  def self.assert_equals(test, expected)
    if test == expected
      puts "#{GREEN_COLOR}  #{expected} #{FINISH_COLOR}"
    else
      puts "#{RED_COLOR}  Expected was: #{expected}",
           "  Resultat was: #{FINISH_COLOR}#{diff(test, expected)}",
           caller(0, 2)
    end
  end

  def self.describe(description, &block)
    Benchmark.bm do |benchmark|
      @@benchmark = benchmark
      @@description = description
      puts 'Testing ' + description

      block.call
    end
  end

  def self.benchmark
    @@benchmark
  end

  def self.description
    @@description
  end

  def self.it(description, &block)
    @@it_description = description
    benchmark.report(' ' + it_description + "\n") do
      begin
        block.call
      rescue => e
        puts "#{RED_COLOR} Error occured: #{e} #{FINISH_COLOR}", e.backtrace[0..1]
      end
    end
  end

  def self.it_description
    @@it_description
  end
end
