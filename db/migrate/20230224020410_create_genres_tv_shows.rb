class CreateGenresTvShows < ActiveRecord::Migration[7.0]
  def change
    create_table :genres_tv_shows do |t|
      t.integer :genre_id, null: false
      t.integer :tv_show_id, null: false

      t.timestamps
    end
  end
end
