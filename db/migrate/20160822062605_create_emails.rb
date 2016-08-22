class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string "title"
      t.string "content"
      t.string "email"
      t.timestamps null: false
    end
  end
end
