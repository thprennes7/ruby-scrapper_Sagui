# frozen_string_literal: true

require 'pry'
require 'nokogiri'
require 'open-uri'

def url_loader(url)
  Nokogiri::HTML(open(url))
end

def page
  Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
end

def link_fetcher
  links = page.xpath('//a[@class="lientxt"]/@href').to_a
  links.map! { |adress| adress.to_s.gsub(/^\./, "http://annuaire-des-mairies.com") }
end

def mail_fetcher
  emails = []
  link_fetcher.each do |link|
    emails.push(url_loader(link).xpath('//section[2]//tr[4]/td[2]').text.to_s)
  end
  emails
end

def name_fetcher
  names = page.xpath('//a[@class="lientxt"]/text()').to_a
  names.map! { |name| name.to_s.downcase.capitalize }
end

def data_gatherer
  name_fetcher.zip(mail_fetcher).to_h
end
