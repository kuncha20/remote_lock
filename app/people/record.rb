module People
  class Record
    require 'date'
    require './app/constants/people.rb'

    include Constants::People::City
    include Constants::People::Params
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def format
      [first_name, city, birth_date].join(', ')
    end

    def first_name
      @first_name ||= params[FIRST_NAME]
    end

    def last_name
      @last_name ||= params[LAST_NAME]
    end

    def city
      @city ||= format_city
    end

    def birth_date
      @birth_date ||= formatted_date
    end

    private
    def formatted_date
      date = DateTime.parse(params[BIRTH_DATE])
      date.strftime("%-m/%-d/%Y")
    end

    def format_city
      city = params[CITY]
      return Constants::People::City.city_name_map[city] if SHORTFORM_CITIES.include?(city)
      return city
    end
  end
end