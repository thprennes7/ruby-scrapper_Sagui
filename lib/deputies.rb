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
  page.xpath('//td[3]/a/@href').each do |link|
    url_loader("https://www.nosdeputes.fr" + link).xpath('//h1').to_a.each do |full_names|
      split_name = full_names.text.to_s.split(' ')
      hash_name = {"first_name":split_name[0], "last_name":split_name[1]}
      deputies_array.push(hash_name)
    end
    url_loader("https://www.nosdeputes.fr" + link).xpath('//a[@href*="mailto"]/text()').to_a.each_with_index do |emails, index|
      email = emails.to_s
      deputies_array[index]["email"] = email
    end
  end
  deputies_array
end

puts deputies_full_name