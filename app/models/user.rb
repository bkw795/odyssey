class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  after_create :assign_atlas

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, :presence => true, :length => {:maximum => 25},
                       :uniqueness => {:case_sensitive => false }
  validates :email, :presence => true, :length => {:maximum => 255},
                    :format => {with: VALID_EMAIL_REGEX},
                    :uniqueness => { :case_sensitive => false }
  validates :display_name, :length => { maximum: 30 }
  validates :password, :length => { minimum: 6 }

  has_secure_password
  has_one :atlas
  has_many :private_notes
  has_many :public_tips

  # has_secure_password adds this method, but I'm putting it here so I remember:
  # def authenticate( password )
  #   compute_hash, compare_with_password_digest
  #   returns either false or the User object
  # end

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private
    def assign_atlas
      self.atlas = Atlas.create!()
    end

end
