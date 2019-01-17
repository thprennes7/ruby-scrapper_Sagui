# frozen_string_literal: true

require 'pry'
require 'nokogiri'
require 'open-uri'

def page
  Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
end

def money_name
  page.xpath('//td[@class="text-left col-symbol"]').to_a
end

def money_value
  page.xpath('//a[@class="price"]').to_a
end

def transform_to_text
  money_name_text = []
  money_name.each do |name|
    name = name.text.to_sym
    money_name_text.push(name)
  end
  money_name_text
end

def transform_to_float
  money_value.map!{ |value| value.text.to_s.slice!(1..value.text.to_s.length).to_f }
end

def crypto_gatherer
  transform_to_text.zip(transform_to_float).to_h
end
