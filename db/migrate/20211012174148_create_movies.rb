class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :runtime
      t.string :storylines
      t.string :country
      t.string :url
      t.integer :year
      t.integer :rating
      t.date :release_date

      t.timestamps
    end
  end
end
