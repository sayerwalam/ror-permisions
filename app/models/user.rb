class User < ApplicationRecord
	validates :username, :presence => true,
						:uniqueness => true, :length => { :in => 3..20 }
	validates :password, :presence => true
	validates_length_of :password, :in => 6..20, :on => :create
end
