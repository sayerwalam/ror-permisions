class MessageThread < ApplicationRecord
	validates :user1, presence: true, allow_blank: false
	validates :user2, presence: true, allow_blank: false
	validates :body, presence: true, allow_blank: false
end
