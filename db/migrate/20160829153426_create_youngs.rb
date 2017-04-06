class CreateYoungs < ActiveRecord::Migration
  def change
    create_table :youngs do |t|

      t.string :day
      t.string :title
      t.string :link
      t.string :teacher
      t.string :price
      
      t.integer :loc
      t.integer :time
      t.integer :week
      t.integer :level
      t.integer :subject
      t.integer :name

      t.timestamps null: false
    end
  end
end
