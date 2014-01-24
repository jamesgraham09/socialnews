class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user, index: true
      t.integer :up
      t.integer :down

      t.timestamps
    end
  end
end
