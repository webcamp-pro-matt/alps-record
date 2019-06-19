class Cart < ApplicationRecord
	belongs_to :good, optional: true
end
