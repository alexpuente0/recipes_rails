require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { User.create(id: 1, name: 'John Doe', email: 'jhon@gmail.com', password: '123456') }
  let(:food) { Food.create(id: 1, name: 'Pineapple', measurement_unit: 'kg', price: 2, quantity: 1, user:) }
  let(:recipe) do
    Recipe.create(id: 1, user:, name: 'bolon', preparation_time: 2, cooking_time: 2, description: 'description',
                  public: false)
  end
  let(:recipe_food) { RecipeFood.create(id: 1, recipe:, food:, quantity: 1) }

  describe 'validations' do
    it 'should not be valid without a quantity' do
      recipe_food.quantity = nil
      expect(recipe_food).to_not be_valid
    end
    it 'should not be valid with a quantity less than 0' do
      recipe_food.quantity = -1
      expect(recipe_food).to_not be_valid
    end
    it 'should be valid with a positive quantity' do
      recipe_food.quantity
      expect(recipe_food).to be_valid
    end
  end
end
