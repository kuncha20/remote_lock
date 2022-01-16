require 'spec_helper'

RSpec.describe Parser::People::PercentFormat do
  let(:params) { File.read('spec/fixtures/people_by_percent.txt') }

  subject { described_class.new(params) }

  describe "every instance of subject" do
    it "should clean and tranform params" do
      subject.records
      expect(subject.params).to eq(
        [["first_name", "city", "birthdate"], ["Mckayla", "Atlanta", "1986-05-29"], ["Elliot", "New York City", "1947-05-04"]]
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
