require 'httparty'

class HolidayService 
    def self.upcoming_holidays 
        response = HTTParty.get('https://date.nager.at/api/v3/NextPublicHolidays/us')
        body = response.body
        JSON.parse(response.body, symbolize_names: true)

    end
end