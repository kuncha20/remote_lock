require 'spec_helper'

RSpec.describe Parser::People::DollarFormat do
  let(:params) { File.read('spec/fixtures/people_by_dollar.txt') }

  subject { described_class.new(params) }

  describe "every instance of subject" do
    it "should clean and tranform params" do
      subject.records
      expect(subject.params).to eq(
        [["city", "birthdate", "last_name", "first_name"], ["LA", "30-4-1974", "Nolan", "Rhiannon"], ["NYC", "5-1-1962", "Bruen", "Rigoberto"]]
      )
    end
  end

  describe "#records" do
    it "should return instances of People::Record" do
      result = subject.records
      expect(result).to all(be_an_instance_of(::People::Record))
    end
  end
end
