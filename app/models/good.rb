class Good < ApplicationRecord
	has_many :music_titles, dependent: :destroy
	has_many :carts
	attachment :jacket_image
	has_many :orders_children

	accepts_nested_attributes_for :music_titles, :carts, :orders_children
end
