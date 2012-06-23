class AddScoresUsable < ActiveRecord::Migration
  def change
    add_column :scores, :usable, :boolean
  end
end

