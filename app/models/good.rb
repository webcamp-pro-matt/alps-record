class Good < ApplicationRecord
	has_many :music_titles
	attachment :jacket_image

	accepts_nested_attributes_for :music_titles
end
