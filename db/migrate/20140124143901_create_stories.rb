class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
