require "simple_google_custom_search/version"
require 'timeout'
require 'open-uri'
require 'cgi'
require 'hpricot'

module SimpleGoogleCustomSearch
  autoload :ResultSet, 'simple_google_custom_search/result_set'
  autoload :Result, 'simple_google_custom_search/result'
  autoload :SgcsConfig, 'simple_google_custom_search/sgcs_config'
  extend self
  
  def search(query, offset=0)
    config = SimpleGoogleCustomSearch::SgcsConfig.new
    site = config.domain + ' -"tagged with" -"posts by date" -page'
    uri = url(site, CGI.escape(query), offset)
    return nil unless resp = fetch(uri)
    
    if resp.status.first == '200'
      parse(resp)
    else
      nil
    end
  end
  
  private
  def url(site, query, offset)
    "http://www.google.com/search?q=#{URI.escape('site:'+site+' '+query+'&start='+offset.to_s)}"
  end
  
  def fetch(uri)
    begin
      resp = nil
      Timeout::timeout(3) do
        resp = open(uri)
      end
    rescue Timeout::Error; end
    resp
  end
  
  def parse(resp)
    parsed = Hpricot(resp.read.encode("UTF-8"))
    number_of_results = (parsed/'div#resultStats').first.inner_text.to_s[/(\S*) result/i, 1].try(:gsub, ',', '').try(:to_i) || 0  
    result_set = SimpleGoogleCustomSearch::ResultSet.new(total: number_of_results)
    result_set.item = (parsed/"li.g").map do |ele|
      SimpleGoogleCustomSearch::Result.new({
        :title => ele.at("a").inner_text,
        :link => "http://www.google.com#{ele.at("a")['href']}",
        :description => (ele/("span.st")).to_s
      })
    end
    result_set
  end
end
