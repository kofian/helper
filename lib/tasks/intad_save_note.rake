namespace :add do
  desc 'Save current posts'
  task :new_notes => :environment do
    require 'nokogiri'
    require 'open-uri'
    require 'json'
  
    url = 'http://127.0.0.1:3000'
    html = open(url)

    doc = Nokogiri::HTML(html)

    panels = []

    doc.css('.panel').each do |showing|
     panel_header = showing.at_css('.panel-heading h3')
     title = panel_header.text.strip
     panel_body = showing.at_css('.panel-body p')
     description= panel_body.text.gsub('[...]','').strip
     panels.push(
      title: title,
      description: description
     )
    Item.create(name: title, description: description)
    end
    puts JSON.pretty_generate(panels.first)
  end
end
