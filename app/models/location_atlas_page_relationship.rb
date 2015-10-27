class LocationAtlasPageRelationship < ActiveRecord::Base
  belongs_to :atlas_page
  belongs_to :location
end
