class TvShow < ApplicationRecord
    has_and_belongs_to_many :genres
    
    validates :name, presence: true, length: {minimum: 2, maximum: 100}
    validates :description, presence: true, length: {minimum: 2, maximum: 250}
    validates :seasons, presence: true

    validate :image_path_exists

    def image_path_exists
        require 'open-uri'

        begin
            # checking if the url is valid
            path = URI.open(image_path)

            # does the response have a content type image?
            # path.content_type.starts_with?("image")
            errors.add(:image_path, "does not contain image content") and return unless path.content_type.starts_with?("image")

        # if thrown an exception, rescue will execute
        rescue
            errors.add(:image_path, 'Invalid URL for image')
        end
    end
end
