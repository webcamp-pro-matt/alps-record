class Order < ApplicationRecord

	belongs_to :user
	has_many :orders_children

	#親から子のモデルをいじるとき作成する
  	accepts_nested_attributes_for :orders_children
end
