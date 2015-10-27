class Location < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: ->(location){ location.address.present? and location.address_changed? }
  validates :name, :presence => true, :length => {:maximum => 75}

  has_many :location_atlas_page_relationships
  has_many :atlas_pages, :through => :location_atlas_page_relationships

  def add_to_atlas_page( atlas_page_id )
    page = AtlasPage.find( atlas_page_id )
    self.atlas_pages.push( page )
  end
end
