class AddScoresLilypond < ActiveRecord::Migration
  def change
    add_column :scores, :lilypond, :string
  end
end

