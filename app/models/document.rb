class Document < ActiveRecord::Base
  attr_accessible :title, :upload
  has_attached_file :upload
  
  def self.query(search)
    if search
      @search = Document.search { keywords search }
      @documents = @search.results
    else
      find(:all)
    end
  end
  
  searchable do
     text :title
     attachment :attached_file #When I enable this I get a 500 error. Something isn't right in the schema.xml I think
   end

private
  def attached_file
    URI.parse(upload.expiring_url(60))
  end
end
