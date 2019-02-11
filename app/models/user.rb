class User < ApplicationRecord
	has_secure_password
	validates :first_name, :presence => true
	validates :last_name, :presence => true
    validates_format_of :dob, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "^Date must be in the following format: mm/dd/yyyy"
	validates :email, :presence => true,
						:uniqueness => true, :length => { :in => 3..20 }
	validates :password_digest, :presence => true
	validates_length_of :password, :in => 6..20, :on => :create
	validates_presence_of :password_confirmation
end
