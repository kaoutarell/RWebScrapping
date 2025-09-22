require "httparty"
require "nokogiri"
require "uri"

class ArticleScraper
  USER_AGENT = "RubyScraper/0.1"

  def initialize(base_url)
    @base_url = base_url
  end

  def scrape_for(keyword)
    response = HTTParty.get(@base_url, headers: { "User-Agent" => USER_AGENT })
    return [] unless response.success?

    doc = Nokogiri::HTML(response.body)
    text_content = doc.xpath("//text()").map(&:text).join(" ")

    matches = text_content.scan(/[^.?!]*#{Regexp.escape(keyword)}[^.?!]*[.?!]/i)
    matches
  end
end
