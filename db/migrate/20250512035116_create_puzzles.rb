class CreatePuzzles < ActiveRecord::Migration[8.0]
  def change
    create_table :puzzles do |t|
      t.references :word, null: false, foreign_key: true
      t.date :puzzle_date
      t.integer :puzzle_number

      t.timestamps
    end
  end
end
