require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(id: 1, name: 'John Doe', email: 'jhon@gmail.com', password: '123456') }
  let(:recipe) do
    Recipe.create(user:, name: 'bolon', preparation_time: 2, cooking_time: 2, description: 'description', public: false)
  end

  describe 'validations' do
    context 'when name is missing' do
      it 'should not be valid' do
        recipe.name = nil
        expect(recipe).not_to be_valid
      end
    end

    context 'when preparation time is missing' do
      it 'should not be valid' do
        recipe.preparation_time = nil
        expect(recipe).not_to be_valid
      end
    end

    context 'when cooking time is missing' do
      it 'should not be valid' do
        recipe.cooking_time = nil
        expect(recipe).not_to be_valid
      end
    end

    context 'when description is missing' do
      it 'should not be valid' do
        recipe.description = nil
        expect(recipe).not_to be_valid
      end
    end

    context 'when all parameters are given' do
      it 'should be valid' do
        expect(recipe).to be_valid
      end
    end
  end
end
