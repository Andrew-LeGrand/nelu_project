class CreateTvShows < ActiveRecord::Migration[7.0]
  def change
    create_table :tv_shows do |t|
      t.string :name
      t.string :description
      t.string :image_path, default: "https://www.shutterstock.com/image-photo/tv-flat-screen-lcd-plasma-260nw-314401364.jpg"
      t.integer :seasons

      t.timestamps
    end
  end
end
