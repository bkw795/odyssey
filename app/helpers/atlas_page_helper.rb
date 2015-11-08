module AtlasPageHelper

  # Just add a hex color code to the end to get a pin of that color
  GOOGLE_MAPS_PIN_URL = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|"

  def get_markers_for_page( atlas_page )
    markers = []
    atlas_page.locations.each do |loc|
      markers << {"lat": loc.latitude, "lng": loc.longitude,
                  "picture": {"url": GOOGLE_MAPS_PIN_URL + atlas_page.color_code,
                              "width": 32, "height": 32},
                  "infoWindow": loc.name + "\n" + loc.address}
    end
    markers
  end

  def get_markers( atlas )
    markers = []
    atlas.atlas_pages.each do |ap|
      get_markers_for_page( ap ).each do |marker|
        markers << marker
      end
    end
    logger.debug( "RDEBUG: " +  markers.to_json )
    markers.to_json
  end

end
