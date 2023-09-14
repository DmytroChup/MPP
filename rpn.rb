def transform_to_rpn(expression)
  priority = {
    "+" => 1,
    "-" => 1,
    "*" => 2,
    "/" => 2,
    "^" => 3
  }

  stack = []
  reverse_polish = []

  chars = expression.scan(/\d+|[+\-*\/()^]/)

  chars.each do |c|
    if c =~ /\d+/
      reverse_polish << c
    elsif c =~ /[+\-*\/^]/
      while !stack.empty? && stack.last != "(" && (priority[stack.last] >= priority[c])
        reverse_polish << stack.pop
      end
      stack << c
    elsif c == "("
      stack << c
    elsif c == ")"
      while stack.last != "("
        reverse_polish << stack.pop
      end
      stack.pop
    end
  end

  reverse_polish << stack.reverse
  reverse_polish.join(" ")
end

print transform_to_rpn(ARGV[0])