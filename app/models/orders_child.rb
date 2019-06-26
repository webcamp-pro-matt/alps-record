class OrdersChild < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :good, optional: true

	validates :order_value, presence: true
end
