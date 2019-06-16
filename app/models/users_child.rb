class UsersChild < ApplicationRecord
	#userと親子関係(ネスト)
	belongs_to :user
end
