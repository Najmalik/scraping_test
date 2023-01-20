require 'open-uri'
require "nokogiri"

url = "https://www.nasa.gov/press-release/nasa-industry-to-collaborate-on-space-communications-by-2025"
html = URI.open(url)
doc = Nokogiri::HTML(html)

result = {title: "", date: "", release: "", article: ""}

result[:title] = doc.title

result[:date] = Time.parse(doc.css("head").children[59].children[0].text.strip.split("\r")[25].split(":")[1].delete(' \"')).strftime("%Y-%m-%d")

puts result
