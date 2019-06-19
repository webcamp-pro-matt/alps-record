class Good < ApplicationRecord
	has_many :music_titles, dependent: :destroy
	has_many :carts
	attachment :jacket_image

	accepts_nested_attributes_for :music_titles
	accepts_nested_attributes_for :carts
end
