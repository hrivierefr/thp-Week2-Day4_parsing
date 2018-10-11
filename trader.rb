require 'rubygems'
require 'nokogiri'  
require 'open-uri'
require 'resolv-replace'

	
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
puts page.css("title")[0].text

result = []
i = 0

page.css("div.container.main-section tbody tr").each { |currency_line| 
	result << {"currency" => currency_line.css("a.currency-name-container.link-secondary").text , "quotation" => currency_line.css("a.price").text}
}

puts result
