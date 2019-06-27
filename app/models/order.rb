class Order < ApplicationRecord

	# rails5から、requiredオプションが標準でtrueになります。
	# なので、標準では関連先のオブジェクトを検査しにいきます。
	# Createメゾット内に@userモデルが存在しないので、エラーになります。
	# 以下のオプションを
	# oprional:true 関連先のオブジェクトが存在するかを検証しない
	belongs_to :user, optional: true
	has_many :orders_children

	#親から子のモデルをいじるとき作成する
  	accepts_nested_attributes_for :orders_children

  	validates :payment_method, presence: true
  	validates :delivery_select_flag, presence: true
end
