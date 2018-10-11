require 'rubygems'
require 'nokogiri'  
require 'open-uri'



def get_the_email_of_a_townhall_from_its_webpage(commune)

	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/#{commune}.html"))
	email = page.css("section.well.section-border[2] tbody tr[4] td[2]").text
	return email
end

#puts get_the_email_of_a_townhall_from_its_webpage("vaureal")


def get_all_the_urls_of_a_department_townhalls(department)
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{department}.html"))
	city_list = []
	page.css("a.lientxt").each { |city|
		city_list << city.text
	}
	return city_list
end

#puts get_all_the_urls_of_a_department_townhalls("val-d-oise")

def get_all_emails_of_a_department (department)
	department = department.downcase.gsub(" ", "-")
	result =[]

	get_all_the_urls_of_a_department_townhalls(department).each { |city|
		url_city = city.downcase.gsub(" ", "-")
		result << {"city" => city.capitalize, "email" => get_the_email_of_a_townhall_from_its_webpage(url_city)}
	}
	return result
end

puts get_all_emails_of_a_department("Val d Oise")
