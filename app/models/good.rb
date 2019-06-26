class Good < ApplicationRecord
	has_many :music_titles, dependent: :destroy
	has_many :carts
	attachment :jacket_image
	has_many :orders_children

	accepts_nested_attributes_for :music_titles, allow_destroy: true
	accepts_nested_attributes_for :carts, :orders_children

	validates :price, presence: true, format: { with: /\A[0-9]+\Z/ }
	validates :artist, :goods_title, :type, :label, :stock, presence: true
end
