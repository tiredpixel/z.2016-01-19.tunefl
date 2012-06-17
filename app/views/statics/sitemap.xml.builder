# this procudes the <?xml ... ?> tag at the start of the document
#   note: this is different to calling builder normally as the <?xml?> tag
#         is very different to how you'd write a normal tag!
xml.instruct! :xml, :version => '1.0', :encoding => 'UTF-8'

# create the urlset
xml.urlset :xmlns => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  
  # = statics
  
  # index
  xml.url do
    xml.loc root_url
  end
  
end

