class PeopleController
  require './app/parser/client.rb'

  def initialize(params)
    @params = params
  end

  def normalize
    client.people(params).parse
  end

  private
  def client
    ::Parser::Client.new
  end

  attr_reader :params
end
