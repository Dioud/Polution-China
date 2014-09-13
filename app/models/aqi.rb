class Aqi
  def self.all
    result={}
    cities = %w(beijing tianjin shanghai hongkong xingtai kunming haerbin guangzhou nanjing)
    cities.each do |city|
      begin
        p city
        doc = Nokogiri::HTML(RestClient.get("http://aqicn.org/city/#{city}/").to_str)
        res= doc.css('div.aqivalue')[0].content
      rescue
        res = 0
      end
      result[city.humanize] = res
    end
    result
  end
end
