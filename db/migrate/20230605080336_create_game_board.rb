class CreateGameBoard < ActiveRecord::Migration[6.1]
  def change
    create_table :game_boards do |t|
      t.string   :email
      t.integer  :mines
      t.integer  :height
      t.integer  :width
      t.string   :board_name
      t.text     :board_data

      t.timestamps
    end
  end
end
