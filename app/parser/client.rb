module Parser
  class Client
    require './app/parser/people/client.rb'

    def people(params)
      Parser::People::Client.new(params)
    end
  end
end