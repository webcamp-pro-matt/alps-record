class OrdersChild < ApplicationRecord
	belongs_to :order
	belongs_to :good
end
