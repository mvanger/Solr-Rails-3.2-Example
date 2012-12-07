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
     attachment :document_upload
   end

private
  def document_upload
    #URI.parse(upload.expiring_url(600))
    URI.parse(upload.url)
  end
end
