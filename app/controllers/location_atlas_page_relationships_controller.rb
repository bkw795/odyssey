class LocationAtlasPageRelationshipsController < ApplicationController

 def create
    atlas_page_id = params[:location_atlas_page_relationship][:atlas_page_id]
    location_id = params[:location_atlas_page_relationship][:location_id]
    @location = Location.find( location_id )
    relationship = LocationAtlasPageRelationship.new( :location_id => location_id, :atlas_page_id => atlas_page_id )
    if relationship.save
      respond_to do |format|
        format.html{ redirect_to Location.find( location_id ) }
        format.js
      end
    end
 end 

end
