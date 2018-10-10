require 'rubygems'
require 'nokogiri'  
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/"))
puts page.css("title")[0].text

=begin
def crypto_quotations
	
	myhash = {}
	names = []
	page.css("div#currencies-all_wrapper a.currency-name-container.link-secondary").each { |name|
		i+=1
		if i < 10
			names << name.text
		end
	}
	puts names


	page.css("div#currencies-all_wrapper a.currency-name-container.link-secondary").each { |name|
		i+=1
		if i < 100
			page.css("div#currencies-all_wrapper a.price").each { |quotation|
				myhash[name.text]=quotation.text
			}
		end
	}

	return  myhash
end

puts crypto_quotations

=end