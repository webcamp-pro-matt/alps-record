class Cart < ApplicationRecord
	belongs_to :good, optional: true
	belongs_to :user, optional: true

	validates :cart_value, presence: true, numericality: {greater_than: 0}
end
