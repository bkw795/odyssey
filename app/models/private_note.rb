class PrivateNote < ActiveRecord::Base

  belongs_to :user
  belongs_to :location
  validates :user_id, :presence => true
  validates :location_id, :presence => true

  def readable_by?( user )
    self.user == user
  end

end
