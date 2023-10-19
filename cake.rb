# Написати програму яка приймає на вхід "пиріг з родзинками"
# cake =
#   ........
#   ..o.....
#   ...o....
#   ........
#   // o это изюм
# Нам потрібно рівно розрізати пиріг на n маленьких прямокутних шматочків так, щоб у кожному маленькому
# пирізі була 1 родзинка. n не є аргументом, ця кількість родзинок усередині торта
# cake =
#   ........
#   ..o.....
#   ...o....
#   ........
#
#   Результат ось такий масив
# [
#   ........
#   ..o.....
# ,
#   ...o....
#   ........
# ]
# Кількість родзинок завжди більше 1 та менше 10.
# Якщо рішень кілька, виберіть те, що має найбільшу ширину першого елемента масиву.
# Поступово розрізати на n частин, що означає однакову площу. Але їхня форма може бути різною.
# Кожен шматок торта має бути прямокутним.


def backtracking(cake, result, raisins_coords, target_area)
  print raisins_coords
  print "\n#{target_area}"

  result if raisins_coords.empty?


end

def divide_cake(cake_str)
  cake = cake_str.split(' ').map { |row| row.chars }

  raisins_coords = []
  cake.each_with_index do |row, i|
    row.each_with_index { |char, j| raisins_coords << [i, j] if char == 'o'}
  end

  cake = cake.map { |row| row.join("") }

  raisins_count = raisins_coords.length
  cake_area = cake.length * cake[0].length

  target_area = cake_area / raisins_count

  result = []
  backtracking(cake, result, raisins_coords, target_area)
end

cake = ".o...... ........ ........ ..o....."
cake = ".o.o.... ........ ....o... ........ .....o.. ........"

print divide_cake(cake)




# start = 0
# finish = raisins_coords[0][0]
# (0..raisins_count - 1).each do |k|
#   slice = ""
#   (start..finish).each do |j|
#     slice += cake[j].join("")
#     slice += " "
#   end
#
#   result << slice.strip
#   start = raisins_coords[k][0] + 1
#   if k >= raisins_count - 2
#     finish = cake.length - 1
#   else
#     finish = raisins_coords[k + 1][0]
#   end
# end
#
# if result.include?("")
#   "Can't slice"
# else
#   result
# end

