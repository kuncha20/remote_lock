module Constants
  module People
    module Payload
      ORDER           = :order.freeze
      DOLLAR_FORMAT   = :dollar_format.freeze
      PERCENT_FORMAT  = :percent_format.freeze
    end

    module City
      LOSANGELES   = "Los Angeles".freeze
      NEWYORKCITY  = "New York City".freeze

      SHORTFORM_CITIES = ["LA", "NYC"]

      def self.city_name_map
        {
          "LA" => LOSANGELES,
          "NYC" => NEWYORKCITY
        }
      end
    end

    module Params
      CITY       = "city".freeze
      BIRTH_DATE = "birthdate".freeze
      FIRST_NAME = "first_name".freeze
      LAST_NAME  = "last_name".freeze
    end
  end
end