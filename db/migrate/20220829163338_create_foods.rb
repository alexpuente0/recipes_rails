class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.numeric :measurement_unit
      t.numeric :price
      t.numeric :quantity

      t.timestamps
    end
  end
end
