class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, :presence => true, :length => {:maximum => 25},
                       :uniqueness => {:case_sensitive => false }
  validates :email, :presence => true, :length => {:maximum => 255},
                    :format => {with: VALID_EMAIL_REGEX},
                    :uniqueness => { :case_sensitive => false }
  validates :display_name, :length => { maximum: 30 }
  validates :password, :length => { minimum: 6 }

  has_secure_password

  # has_secure_password adds this method, but I'm putting it here so I remember:
  # def authenticate( password )
  #   compute_hash, compare_with_password_digest
  #   returns either false or the User object
  # end
end