class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

 def new
    @recipe = Recipe.new
  end

  def create
    values = params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
    @recipe = Recipe.new(name: values[:name], preparation_time: values[:preparation_time], cooking_time: values[:cooking_time],
                     description: values[:description], user_id: current_user.id)

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

end