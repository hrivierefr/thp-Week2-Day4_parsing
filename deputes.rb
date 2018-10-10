require 'rubygems'
require 'nokogiri'  
require 'open-uri'

page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=577"))

deputy_list =[]

page.css("main ul.no_puce.list_ann").each {|deputy_info|
	deputy = {}
	
	deputy_info.css("h2").each {|complete_name|
		deputy["first_name"] = complete_name.text.split[1]
		deputy["name"] = (complete_name.text.split(" "))[2..-1].join(" ")
	}

	deputy_info.css("li[4] a.ann_mail").each {|coordonnees|
		deputy["email"] = coordonnees.text.split[0]
	}

	deputy_info.css("li[5] a.ann_mail").each {|coordonnees|
		deputy["email"] = coordonnees.text.split[0]
	}

	deputy_list << deputy
}

puts deputy_list.compact
