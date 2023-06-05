class  GameBoard < ApplicationRecord
	include PgSearch::Model

	pg_search_scope :search,
        against: [:board_name, :email],
        using: {
          tsearch: {
            prefix: true,
            any_word: true
          }
        }

	validates :board_name, :height, :width, :mines, presence: true
	validates_numericality_of :height, :width, :mines, greater_than: 0
	validates :email, presence: true, email: true
end
