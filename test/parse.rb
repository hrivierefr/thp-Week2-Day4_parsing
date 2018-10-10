require 'rubygems'
require 'nokogiri'  
require 'open-uri'


page = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/HTML"))
puts page.class   # => Nokogiri::HTML::Document


links = page.css("a")

puts links.length
puts links[0].text   # => Click here
puts links[0]["href"] # => http://www.google.com

news_links = page.css("a").select{|link| link['data-category'] == "news"}
news_links.each{|link| puts link['href'] }

#=>   http://reddit.com
#=>   http://www.nytimes.com
         
puts news_links.class   #=>   Array 

summary_labels = page.css("div#bodyContent table.infobox th")
summary_labels.each{|label| puts "#{label.text}}"}      