class AtlasPage < ActiveRecord::Base
  validates :name, :presence => true, :length => {:maximum => 25}
  before_create :assign_color_code

  belongs_to :atlas
  has_many :location_atlas_page_relationships
  has_many :locations, :through => :location_atlas_page_relationships

  # RDEBUG: Test these

  def owner
    self.atlas.user
  end

  def owned_by?( user )
    owner == user
  end

  def public?
    self.public
  end

  # If public is somehow not set, mark page private
  def private?
    self.public || true
  end

  def can_be_read_by?( user )
    return (self.public || self.owned_by?(user))
  end

  def make_private!
    self.public = false
    self.save
  end

  def make_public!
    self.public = true
    self.save
  end

  def assign_color_code
    self.color_code = "%06x" % (rand * 0xffffff)
  end

end
