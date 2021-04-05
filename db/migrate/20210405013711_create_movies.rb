class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :issued
      t.integer :year
      t.integer :votes, default: 0

      t.timestamps
    end
  end
end
