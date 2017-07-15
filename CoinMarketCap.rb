require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   

tab = {}

i = 1

while true
    while(i<973)
        name = page.xpath("//*[@id=\"currencies-all\"]/tbody/tr[#{i}]/td[2]/img/@alt")
        price = page.xpath("//*[@id=\"currencies-all\"]/tbody/tr[#{i}]/td[5]/a/@data-usd")
        i += 1
        tab.store(name.text, price.text) 
    end

    puts tab

    sleep 3600

end