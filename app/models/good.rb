class Good < ApplicationRecord
	has_many :music_titles, dependent: :destroy
	attachment :jacket_image

	accepts_nested_attributes_for :music_titles
end
