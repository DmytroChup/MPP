require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'https://en.wikipedia.org/wiki/List_of_libraries'

html = URI.open(url)
doc = Nokogiri::HTML(html)

div_element = doc.xpath('(//*[@id="mw-content-text"]/div[1]/ul[position() >= 1 and position() <= 26])//li')

libraries = []
div_element.each do |link|
  text = link.text.strip.split(',')[0]
  libraries << text
end

CSV.open('library/libraries.csv', "wb") do |csv|
  id = 0

  libraries.each do |library|
    csv << [id, library]
    id += 1
  end
end

#(//*[@id="mw-content-text"]/div[1]/ul[position() >= 1 and position() <= 26])//li