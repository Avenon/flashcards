require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("http://greatstudy.ru/100-samyx-upotreblyaemyx-anglijskix-slov/"))
rows = doc.xpath("//table/tbody/tr[position() >= 2]")
array = []

details = rows.map do |row|
  detail = {}

  [[:original_text,'td[1]/text()'], [:translated_text, 'td[2]/text()'], [:review_date]].each do |name, xpath|
    detail[name] = row.at_xpath(xpath).to_s.strip
  end

  array = detail[:original_text].split(" ")
  detail[:original_text] = array[1]
  detail[:review_date] = Time.now + (60 * 60 * 24 * 3)
  Card.create(original_text: detail[:original_text], translated_text: detail[:translated_text],review_date: detail[:review_date])
end
