class Location < ActiveRecord::Base
  geocoded_by :address
  validates :name, :presence => true, :length => {:maximum => 75}
  validates :address, :presence => true
  after_validation :geocode, if: ->(location){ location.address.present? and location.address_changed? }

  has_many :location_atlas_page_relationships
  has_many :atlas_pages, :through => :location_atlas_page_relationships
  has_many :private_notes
  has_many :public_tips

  def add_to_atlas_page( atlas_page_id )
    page = AtlasPage.find( atlas_page_id )
    self.atlas_pages.push( page )
  end

  def notes_by( user )
    self.private_notes.where( user: user )
  end

  def contained_in_user_atlas_pages( user )
    user.atlas.atlas_pages.select{|ap| ap.locations.include?( self ) }
  end

end
