class Document < ActiveRecord::Base
  attr_accessible :title, :upload
  
  has_attached_file :upload
  
  def self.query(search)
    # This is so you can query easily from the controller
    # Returns all results if there is no search parameters
    if search
      @search = Document.search { keywords search }
      @documents = @search.results
    else
      find(:all)
    end
  end
  
  # This is where you define your search fields for Solr
  searchable do
     text :title
     attachment :document_upload
   end

private
  def document_upload
    # This is for returning a URL to the PDF/Doc/etc file. 
    # DO NOT USE THE FOLLOWING LINE WITHOUT ALTERATION. WILL NOT INDEX
    #URI.parse(upload.expiring_url(600))
    URI.parse(upload.url)
  end
end
