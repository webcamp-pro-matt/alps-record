class UsersChild < ApplicationRecord
	#userと親子関係(ネスト)
	belongs_to :user

	validates :name_kanji_sei, presence: true
  	validates :name_kanji_mei, presence: true

  	validates :name_kana_sei, presence: true, format: { with: /\A[ァ-ヶー－]+\Z/ }
  	validates :name_kana_mei, presence: true, format: { with: /\A[ァ-ヶー－]+\Z/ }

  	validates :post_code, presence: true, length: { is: 7 }, format: { with: /\A[0-9]+\Z/ }
  	validates :address, presence: true
end
