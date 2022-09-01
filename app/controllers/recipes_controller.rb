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
    @requirements = []
    #Take all the foods from the current user's recipes and add them to the requirements array
    current_user.foods.each do |food|
      food_quantity = food.quantity
      food_required = food.recipe_foods.sum(:quantity)
      required = food_required - food_quantity
      #if the required quantity is greater than 0, add it to the requirements array
      if required > 0
        @requirements << {name: food.name, required: required, price: food.price * required}
      end
    end
    #Calculate the total cost of the shopping list
    @total_cost = @requirements.sum {|h| h[:price] }
    #Calculate the total number of elements in the shopping list
    @total_elements = @requirements.size
  end
end
