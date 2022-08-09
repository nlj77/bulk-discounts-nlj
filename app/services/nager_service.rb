require 'httparty'

class NagerService 
    def self.upcoming_holiday 
        response = HTTParty.get('https://date.nager.at/swagger/index.html')

        body = response.body

        
    end
end