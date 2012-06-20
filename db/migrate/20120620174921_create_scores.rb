class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :title
      t.string :composer
      t.string :copyright
      t.text :music
      t.string :preview
      t.string :midi
      t.boolean :blocked, :default => false, :null => false
      
      t.timestamps
    end
  end
end

