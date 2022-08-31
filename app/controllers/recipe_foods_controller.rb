class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    if @recipe_food.save
      redirect_to recipe_path(@recipe_food.recipe)
    else
      render :new
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity).merge(recipe_id: params[:recipe_id])
  end
end
