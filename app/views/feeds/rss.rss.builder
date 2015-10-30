xml.instruct!
xml.rss :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
 
  xml.channel do
    xml.title 'Earthquake 2015 Resources'
    xml.description 'A crowdsourced repository of resources to assist you in helping with the recent Earthquake in Pakistan and Afghanistan.'
    xml.link 'http://www.earthquake2015.info'
    xml.language 'en'
 
    for resource in @resources
      xml.item do

        xml.title resource.title

        if resource.website_link.present?
          xml.link resource.website_link
        else
          xml.link "http://www.earthquake2015.info"
        end

        if resource.contact_num.present?
          xml.contact "<p>" + resource.contact_num + "</p>"
        else
          xml.contact ""
        end

        if resource.description.present?
          xml.description "<p>" + resource.description + "</p>"
        else
          xml.description ""
        end

        xml.mainsection resource.main_section
        xml.subsection resource.sub_section
        xml.pubDate(resource.created_at.rfc2822)

        xml.pubDate resource.created_at.to_s(:rfc822)
        xml.upDate resource.updated_at.to_s(:rfc822)
      end
    end
 
  end
 
end