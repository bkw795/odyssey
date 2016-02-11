class Atlas < ActiveRecord::Base
  belongs_to :user
  has_many :atlas_pages

  self.table_name = "atlases"

  def add_atlas_page( atlas_page )
    self.atlas_pages.push( atlas_page )
  end

  def owned_by?( user )
    self.user == user
  end

end
