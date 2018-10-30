class Setting < ApplicationRecord

	validates :body, presence: true, allow_blank: false
	validates :duration, presence: true

end
