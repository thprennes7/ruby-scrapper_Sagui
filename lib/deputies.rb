# frozen_string_literal: true

require 'pry'
require 'nokogiri'
require 'open-uri'

def url_loader(url)
  Nokogiri::HTML(open(url))
end

def page
  Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
end

def deputies_full_name
  deputies_array = []
  page.xpath('//div[@class="list_table"]//a/@href').each do |link|
    url_loader("https://www.nosdeputes.fr" + link).xpath('//h1').to_a.each_with_index do |full_names, index|
      email = url_loader("https://www.nosdeputes.fr" + link).xpath('//a[contains(@href, "@assemblee-nationale.fr")]/text()')[index].to_s
      split_name = full_names.text.to_s.split(' ')
      hash_name = {"first_name": split_name[0], "last_name": split_name[1], "email": email}
      deputies_array.push(hash_name)
    end
  end
  deputies_array
end

puts deputies_full_name
