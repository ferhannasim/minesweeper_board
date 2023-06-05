class MinesweeperService
  def initialize(height, width, num_mines, record)
    @height = height
    @width = width
    @num_mines = num_mines
    @record = record
  end

  def generate_board
    board = Array.new(@height) { Array.new(@width, 0) } # Initialize the board with 0s
    place_mines(board)
    calculate_hints(board)
    save_board(board, @record) # Save the board in the GameBoard model
    board
  end

  def place_mines(board)
    mines = @num_mines
    while mines > 0
      row = rand(@height)
      col = rand(@width)
      next if board[row][col] == -1 # Skip if there is already a mine at this position
      board[row][col] = -1 # Place the mine
      mines -= 1
    end
  end

  def calculate_hints(board)
    @height.times do |row|
      @width.times do |col|
        next if board[row][col] == -1 # Skip if it's a mine
        board[row][col] = count_adjacent_mines(board, row, col)
      end
    end
  end

  def count_adjacent_mines(board, row, col)
    count = 0
    ((row - 1)..(row + 1)).each do |r|
      ((col - 1)..(col + 1)).each do |c|
        next if r < 0 || c < 0 || r >= @height || c >= @width || (r == row && c == col)
        count += 1 if board[r][c] == -1
      end
    end
    count
  end

  def save_board(board, record)
    record.update(board_data: board.to_json)
    record.id # Return the ID of the saved board
  end

  def load_board(board)
    JSON.parse(board.board_data)
  end

  def board_to_html(board)
    html = "<table>"
    board.each_with_index do |row, row_index|
      html += "<tr>"
      row.each_with_index do |cell, col_index|
        if cell == -1
          html += "<td id='tile-#{row_index}-#{col_index}' class='tile'>💣</td>"
        else
          html += "<td id='tile-#{row_index}-#{col_index}' class='tile'>#{}</td>"
        end
      end
      html += "</tr>"
    end
    html += "</table>"
    html
  end
end