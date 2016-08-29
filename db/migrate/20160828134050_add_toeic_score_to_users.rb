class AddToeicScoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :toeic_socre, :string
    add_index :users, :toeic_socre, unique: true
  end
end
