require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open ("http://www.languagedaily.com/learn-german/vocabulary/common-german-words/"))

page.css('.jsn-article-content > table > tbody > tr').each do |row|
  de = row.css('td:nth-child(2)')
  en = row.css('td:nth-child(3)')
  Card.create(original_text: de.text, translated_text: en.text, review_date: Time.zone.now)
end
puts "Loading data from 1 page complite"

page = Nokogiri::HTML(open ("http://www.languagedaily.com/learn-german/vocabulary/most-common-german-words-2"))

page.css('.jsn-article-content > table > tbody > tr').each do |row|
  de = row.css('td:nth-child(2)')
  en = row.css('td:nth-child(3)')
  Card.create(original_text: de.text, translated_text: en.text, review_date: Time.zone.now )
end
puts "Loading data from 2 page complite"

page = Nokogiri::HTML(open ("http://www.languagedaily.com/learn-german/vocabulary/common-german-words-3"))

page.css('.jsn-article-content > table > tbody > tr').each do |row|
  de = row.css('td:nth-child(2)')
  en = row.css('td:nth-child(3)')
  Card.create(original_text: de.text, translated_text: en.text, review_date: Time.zone.now)
end
puts "Loading data from 3 page complite"

page = Nokogiri::HTML(open ("http://www.languagedaily.com/learn-german/vocabulary/common-german-words-4"))

page.css('.jsn-article-content > table > tbody > tr').each do |row|
  de = row.css('td:nth-child(2)')
  en = row.css('td:nth-child(3)')
  Card.create(original_text: de.text, translated_text: en.text, review_date: Time.zone.now)
end
puts "Loading data from 4 page complite"
puts page.title.first(13)
