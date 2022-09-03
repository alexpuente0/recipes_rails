class FoodsController < ApplicationController
  def index
    @foods = Food.where(user_id: current_user.id)
  end

  def new
    @food = Food.new
  end

  def create
    values = params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
    @food = Food.new(name: values[:name], measurement_unit: values[:measurement_unit], price: values[:price],
                     quantity: values[:quantity], user_id: current_user.id)

    if @food.save
      redirect_to root_path,
                  notice: 'your food item was added to the database'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to request.referrer
  end
end
