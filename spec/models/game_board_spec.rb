require 'rails_helper'

RSpec.describe GameBoard, :type => :model do

  context 'when all attributes are correct' do
    let!(:game_board) { build :game_board }

    it "returns true" do
      expect(game_board.save).to eq(true)
    end
  end

  context 'when all attributes are not present' do
    let!(:game_board) { build :game_board, board_name: nil, email: nil, height: nil, width: nil, mines: nil }

    it "returns false" do
      expect(game_board.save).to eq(false)
    end
  end

  context 'when height width mines are not numbers' do
    let!(:game_board) { build :game_board, height: 'a', width: 'b', mines: 'c' }

    it "returns false" do
      expect(game_board.save).to eq(false)
    end
  end

  context 'when height width mines are zero or less than 0' do
    let!(:game_board) { build :game_board, height: 0, width: -2, mines: 0 }

    it "returns false" do
      expect(game_board.save).to eq(false)
    end
  end
end
