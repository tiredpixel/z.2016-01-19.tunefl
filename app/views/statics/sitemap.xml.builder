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
  
  # legal
  xml.url do
    xml.loc legal_url
  end
  
  
  # = scores
  
  Score.find_each do |score|
    if score.preview && score.music
      xml.url do
        xml.loc thing_url(score)
        xml.lastmod score.updated_at.strftime('%Y-%m-%d')
      end
    end
  end
  
end

