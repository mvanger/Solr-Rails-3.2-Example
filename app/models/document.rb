class Document < ActiveRecord::Base
  attr_accessible :title, :upload
  has_attached_file :upload
  
  # searchable do
  #    text :title
  #    attachment :attached_file
  #  end

private
  def attached_file
    URI.parse(file.expiring_url(60))
  end
end
