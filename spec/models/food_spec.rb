require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    let(:user) { User.create(name: 'John Doe', email: 'Jhon@gmail.com', password: '123456') }
    let(:food) { Food.create(name: 'Pineapple', measurement_unit: 'kg', price: 2, quantity: 1, user_id: 1) }

    context 'when foods has all parameters' do
      it 'has a name' do
        expect(food.name).to eq('Pineapple')
      end

      it 'has a price' do
        expect(food.price).to eq(2)
      end

      it 'has a user' do
        expect(food.user_id).to be(1)
      end
    end

    context 'when foods have null parameters is invalid' do
      it 'has a null name' do
        food.name = nil
        expect(food).to_not be_valid
      end

      it 'has a null price' do
        food.price = nil
        expect(food).to_not be_valid
      end

      it 'has a null user' do
        food.user = nil
        expect(food).to_not be_valid
      end
    end
  end
end
