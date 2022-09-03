require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  let (:user) { User.create(id: 1, name: 'John Doe', email: 'jhon@gmail.com', password: '123456') }
before do 
  sign_in(user)
  user.confirm
end

  describe 'GET /recipes' do
    it 'returns http success' do
      get recipes_path
      expect(response).to have_http_status(:success)
    end
  end

end
