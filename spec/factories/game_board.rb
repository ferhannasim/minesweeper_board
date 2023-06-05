FactoryBot.define do
  factory :game_board do
    board_name { 'test' }
    email { 'test@example.com' }
    height { 5 }
    width { 5 }
    mines { 5 }
  end
end
