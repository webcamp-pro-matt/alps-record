class Cart < ApplicationRecord
	belongs_to :good, optional: true
	belongs_to :user, optional: true
end
