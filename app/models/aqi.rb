class Aqi
  def self.all
    result={}
    cities = %w(tianjin beijing shanghai hongkong xingtai kunming haerbin guanzhou nanjing)
    cities.each do |city|
      doc = Nokogiri::HTML(RestClient.get("http://aqicn.org/city/#{city}/").to_str)
      res= doc.css('div.aqivalue')[0].content rescue 'error'
      result[city] = res
    end
  end
end
