module PrivateNotesHelper

  def location_private_notes( location, user )
    PrivateNote.where( :user_id => user.id, :location_id => location.id )
  end

end
