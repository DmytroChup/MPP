require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'https://en.wikipedia.org/wiki/List_of_libraries'

html = URI.open(url)
doc = Nokogiri::HTML(html)

div_element = doc.css("div#mw-content-text")
div_element.css("div.noprint").remove
div_element = div_element.css("ul li")

libraries = []
div_element.each do |link|
  text = link.text.strip
  break if text.start_with?("Esperanto libraries")
  libraries << text
end

CSV.open('library/libraries.csv', "wb") do |csv|
  id = 0

  libraries.each do |library|
    csv << [id, library]
    id += 1
  end
end