module Solution
  def primitives(n)
    temp_table = Array.new(n + 1, true)
    (2..n).to_a.each do |number|
      unprimitive_number = number + number
      while unprimitive_number <= n
        temp_table[unprimitive_number] = false
        unprimitive_number += number
      end
    end
    (2..temp_table.size).to_a.select { |i| temp_table[i] }
  end

  # -------------
  # enum() is not worth to generate with 1 and not primitives numbers if we wanna product them
  # (which means multiply)
  # So we need to store just primitives elements, which in sum gives us `n`.
  # Lower combinations of sum elements will be also included in list of `n`
  # e.g 2*3 + 1 belongs to prod(enum(`6`))
  # We can use lower `n` results to generate new one (but I won't explain how to do it :)
  # I optimized generation part to get things on time - but I know it can be done better
  # (I need to use uniq for some cases)

  def prodenum(n)
    $primitives ||= primitives(90)
    $new_number_products_cache ||= Array.new(4, [])

    result = (4..n).to_a.flat_map { |i| primitives_combinations(i) }
    (result | [1].concat($primitives.select { |pr| pr <= n })).sort
  end

  # split into 2 sum elemenets and
  # combine them with previous calculated sum primitives or just with primitive
  def primitives_combinations(n)
    $new_number_products_cache[n] ||= begin
      (2..n / 2).flat_map do |z|
        lower_part = wrap_array_for_primitives_or_new_number_product(z)
        higher_part = wrap_array_for_primitives_or_new_number_product(n - z)
        higher_part.product(lower_part).map { |combination| combination.reduce(&:*) }
      end.uniq
    end
  end

  def wrap_array_for_primitives_or_new_number_product(number)
    primitive?(number) ? [number] : primitives_combinations(number)
  end

  def primitive?(number)
    $primitives.include? number
  end

  # ----------------- output 3rd step

  def part(n)
    array = prodenum(n)
    avg = array.sum / array.size.to_f
    range = array.last - array.first
    median = median(array)
    "Range: #{range} Average: #{format_float(avg)} Median: #{format_float(median)}"
  end

  def median(array)
    half_size = array.size / 2
    if array.size.even?
      (array[half_size - 1] + array[half_size]) / 2.0
    else
      array[half_size]
    end
  end

  def format_float(value)
    format('%.2f', value).to_s
  end
end
