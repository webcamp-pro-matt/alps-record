class OrdersChild < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :good, optional: true
end
