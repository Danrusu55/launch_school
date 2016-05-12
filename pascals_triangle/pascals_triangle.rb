class Triangle
  attr_reader :num_rows, :pascals_triangle

  def initialize(num_rows)
    @num_rows = num_rows
    @pascals_triangle = []
  end

  def rows
    return pascals_triangle if num_rows < 1
    current_height = 1
    while current_height <= num_rows
      draw_row(current_height)
      current_height += 1
    end
    pascals_triangle
  end

  def draw_row(current_height)
    current_row = []
    row_above = pascals_triangle[current_height - 2]
    row_above_length = current_height - 1
    index = 0
    while index <= current_height - 1
      if index == 0 || index == current_height
        current_row[index] = 1
      elsif row_above[index-1].nil? && row_above[index].nil?
          break
      elsif row_above[index].nil? || row_above[index-1].nil?
          current_row[index] = 1
      else
          current_row[index] = row_above[index-1] + row_above[index]
      end
      index += 1
    end
    pascals_triangle << current_row
  end
end
