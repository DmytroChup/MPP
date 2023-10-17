def ipv_check(ipv4_str)
  numbers = ipv4_str.split('.')

  if numbers.length != 4
    return false
  else
    numbers.each do |number|
      return false unless (0..255).include?(number.to_i) && number == number.to_i.to_s
    end
  end
  true
end

if ARGV.length == 1
  ipv4_str = ARGV[0]
  print ipv_check(ipv4_str)
else
  print "Enter a value in argv"
end
