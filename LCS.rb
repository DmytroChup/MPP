def lcs(strings)
  return "" if strings.empty?
  return strings[0] if strings.length == 1

  cache_size = 1

  strings.each do |str|
    cache_size *= str.length
  end

  cache = []
  indexes = []

  strings.each_with_index do |str, i|
    indexes[i] = str.length - 1
  end

  lcs_back(strings, indexes, cache)
end

def lcs_back(strings, indexes, cache)
  return "" if indexes.include?(-1)

  match = true
  (1...indexes.length).each do |i|
    if strings[0][indexes[0]] != strings[i][indexes[i]]
      match = false
      break
    end
  end

  if match
    new_indexes = indexes.map { |idx| idx - 1 }
    result = lcs_back(strings, new_indexes, cache) + strings[0][indexes[0]]
    cache[calc_cache_pos(indexes, strings)] = result
    result
  else
    sub_strings = Array.new(strings.length)

    strings.each_with_index do |str, i|
      if indexes[i] <= 0
        sub_strings[i] = ""
      else
        new_indexes = indexes.dup
        new_indexes[i] -= 1
        cache_pos = calc_cache_pos(new_indexes, strings)

        if cache[cache_pos].nil?
          sub_strings[i] = lcs_back(strings, new_indexes, cache)
        else
          sub_strings[i] = cache[cache_pos]
        end
      end
    end

    longest_string = ""
    longest_length = 0

    sub_strings.each do |sub_str|
      if sub_str.length > longest_length
        longest_string = sub_str
        longest_length = longest_string.length
      end
    end

    cache[calc_cache_pos(indexes, strings)] = longest_string
    longest_string
  end
end

def calc_cache_pos(indexes, strings)
  factor = 1
  pos = 0

  indexes.each_with_index do |idx, i|
    pos += idx * factor
    factor *= strings[i].length
  end

  pos
end


strings = ["ABDCFFF", "ADFCCF", "ADCFFD", "AD", "AFAAAAAD"]
puts lcs(strings)
