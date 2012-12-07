Solr PDF Search Example in Rails 3.2
============

I spent the majority of a day bashing my head into a wall trying to get Solr working to index PDF files with Rails. I am not a Java developer, so groking the documentation around the Apache Solr stuff was a bit difficult. 20 different blog posts all said slightly different things and didn't point out the pitfalls. 

I ran into issues with 500-errors, PDF results returning nothing, gems fighting each other, etc. 

This example application will get you up and running with Solr working for PDF indexing. 

My goal was to make an app that worked with Rails 3.2, Amazon AWS/S3, and Solr for indexing (searching) PDF files. 

To get started, check out this repo and install the needed gems:
```
git clone git@github.com:tibbon/Solr-Rails-3.2-Example.git
cd Solr-Rails-3.2-Example
bundle install
cp .env_example .env
rake db:migrate
```

I am using the 'dotenv' gem from bkeepers (https://github.com/bkeepers/dotenv) for allowing Webrick and the rails console to easily access environmental variables. Foreman can also be used for this, but then the rails console stuff gets funny. 

You will then want to edit the .env file with your Amazon credentials from https://portal.aws.amazon.com/gp/aws/securityCredentials

You can then start Solr. 
```
rake sunspot:solr:start
```
to stop Solr
```
rake sunspot:solr:stop
```

Things to watch out for. 

1) I was accidentally running Solr twice. This created an issue with port numbers and caused all sorts of weirdness. Double check if you are running an additional instance of Solr with
```
ps aux | grep java
```
2) The versions of the .jar files in /solr/lib matter quite a bit. I tried updating the pdfbox to version 1.7.x. This was a no-go and cause errors immediately
3) The versions of stuff in your Gemfile really seem to matter, as well as the git repos. Development of the Solr stuff (and moreso the SolrCell) Ruby libraries has been all over the place. Change these with the utmost caution.
4) There are a few specific things in the /solr/conf/schema.xml file that enable the PDF search, specifically lines 95, 235 and 236. If you install Solr elsewhere, make sure those lines go into the schema.xml file. Elsewise, I didn't change anything in configuration.

You can test that Solr is working by doing the following:
```
rails s
```
Go to ```http://localhost:3000/documents``` and upload a new document with a title
Now go to ```http://localhost:3000/documents?search=foobar``` where foobar is a term you know is in the file you uploaded. 

Also from the console then you can do the following:
``` ruby
rails c
Document.reindex
r = Document.search { keywords 'foobar' }
r.results
```


TODO: 

- Add a simple search box to the index
- Format this document better