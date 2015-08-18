class Atlas < ActiveRecord::Base
  belongs_to :user

  self.table_name = "atlases"

end
