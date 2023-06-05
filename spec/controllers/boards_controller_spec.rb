require 'rails_helper'

RSpec.describe BoardsController, type: :controller do

  describe '#home' do
    context 'renders home page successfully' do
      before { get :home }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template('home') }
    end
  end

  describe '#index' do
    context 'renders index page successfully' do
      before { get :index }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template('index') }
    end

    context 'renders index page successfully if search param is present.' do
      before { get :index, params: { search: 'test' } }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template('index') }
    end
  end

  describe '#new' do
    context 'renders new page successfully' do
      before { get :new }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template('new') }
    end
  end

  describe '#show' do
    context 'renders show page successfully' do
      let!(:game_board) { create :game_board, board_data: "[[2,-1,2,1,-1],[2,-1,2,1,1],[2,2,3,1,1],[1,-1,2,-1,1],[1,1,2,1,1]]"  }
      before { get :show, params: {id: game_board.id} }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template('show') }
    end
  end

  describe '#create' do
    context 'create game board successfully' do
      before { post :create, params: { game_board: {board_name: 'test', email: 'tester@test.com', height: 3, width: 3, mines: 3} }}

      it { expect(response).to have_http_status(302) }
    end

    context 'not created game board' do
      before { post :create, params: { game_board: {board_name: 'test', email: 'tester@test.com', height: 0, width: 3, mines: 3} }}

      it { expect(response).to have_http_status(200) }
    end
  end

  describe '#destroy' do
    context 'destroys successfully' do
      let!(:game_board) { create :game_board  }
      before { delete :destroy, params: {id: game_board.id} }

      it { expect(response).to have_http_status(302) }
    end
  end
end