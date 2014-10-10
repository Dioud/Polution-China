class Aqi
  def self.all
    result=[]
    cities = %w(beijing tianjin shanghai hongkong xingtai kunming haerbin guangzhou nanjing)
    # cities.each_with_index do |city, i|
      Parallel.each(cities, :in_threads => 8) do |city, i|
      begin
        doc = Nokogiri::HTML(RestClient.get("http://aqicn.org/city/#{city}/", :user_agent => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36").to_str)
        res= doc.css('div.aqivalue')[0].content
      rescue
        res = 0
      end
      result.push({city: city.humanize, value: res})
    end
    result
  end
end
