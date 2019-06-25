class MusicTitle < ApplicationRecord
	belongs_to :good, optional: true
end
