 def safe?(col, others)
   others.each_with_index do |c, r|
     return false if col == c or (col - c).abs == (others.size - r).abs
   end
 end


 def solve(n, solutions = [], cols=[])
   return solutions.push(cols) unless cols.size < n
   n.times { |col| solve(n, solutions, cols + [col]) if safe?(col, cols) }
   return solutions
 end


 def show_solutions(n)
   solutions = solve(n)
   puts "There are #{solutions.size} solutions for n = #{n}."
   for cols in solutions
     puts '', cols.map { |c| (0...n).map { |i| i == c ? 'Q' : '.' }.join }
   end
 end
show_solutions(7)
