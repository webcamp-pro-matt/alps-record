class MusicTitle < ApplicationRecord
	belongs_to :good, optional: true

	validates :song, presence: true
end
