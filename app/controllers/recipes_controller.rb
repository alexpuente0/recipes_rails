class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    values = params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
    @recipe = Recipe.new(name: values[:name], preparation_time: values[:preparation_time],
                         cooking_time: values[:cooking_time], description: values[:description],
                         user_id: current_user.id)

    if @recipe.save
      redirect_to recipes_path,
                  notice: 'your recipe was added to the database'
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.destroy
    redirect_to recipes_path
  end

  def toggle_visible
    @recipe = Recipe.find(params[:id])
    @recipe.toggle!(:public)

    if @recipe.save
      redirect_to recipe_path(@recipe.id),
                  notice: 'Your recipe Visibility has changed'
    else
      render :new
    end
  end

  def public_recipes
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  def shopping_list
    @foods = current_user.foods.order(:id)
    @recipe_foods = RecipeFood.where(food_id: @foods)
    @group = @foods.zip(@recipe_foods).to_h
    @result = {}
    @total_cost = 0
    @group.each do |food, recipe_food|
      diff = food.quantity - recipe_food.quantity
      next unless diff.negative?

      cost = diff * food.price
      @total_cost += cost
      @result[food.name] = { difference: -diff, cost: -cost }
    end
  end
end
