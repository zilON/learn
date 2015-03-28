# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'nokogiri'
require 'open-uri'

Card.destroy_all

page = Nokogiri::HTML(open ("http://www.languagedaily.com/learn-german/vocabulary/common-german-words/"))

page.css('.jsn-article-content > table > tbody > tr').each do |row|
  de = row.css('td:nth-child(2)')
  en = row.css('td:nth-child(3)')
  Card.create(original_text: de.text, translated_text: en.text)
end
puts "Loading data from 1 page complite"

page = Nokogiri::HTML(open ("http://www.languagedaily.com/learn-german/vocabulary/most-common-german-words-2"))

page.css('.jsn-article-content > table > tbody > tr').each do |row|
  de = row.css('td:nth-child(2)')
  en = row.css('td:nth-child(3)')
  Card.create(original_text: de.text, translated_text: en.text)
end
puts "Loading data from 2 page complite"

page = Nokogiri::HTML(open ("http://www.languagedaily.com/learn-german/vocabulary/common-german-words-3"))

page.css('.jsn-article-content > table > tbody > tr').each do |row|
  de = row.css('td:nth-child(2)')
  en = row.css('td:nth-child(3)')
  Card.create(original_text: de.text, translated_text: en.text)
end
puts "Loading data from 3 page complite"

page = Nokogiri::HTML(open ("http://www.languagedaily.com/learn-german/vocabulary/common-german-words-4"))

page.css('.jsn-article-content > table > tbody > tr').each do |row|
  de = row.css('td:nth-child(2)')
  en = row.css('td:nth-child(3)')
  Card.create(original_text: de.text, translated_text: en.text)
end

puts "Loading data from 4 page complite"

puts "All done"
