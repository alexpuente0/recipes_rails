class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.belongs_to :user, foreign_key: true

      t.string :name
      t.string :preparation_time
      t.string :cooking_time
      t.string :description
      t.boolean :public, default: false

      t.timestamps
    end
  end
end
