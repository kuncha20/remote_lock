require 'spec_helper'

RSpec.describe Parser::People::Client do
  let(:dollar_format) { File.read('spec/fixtures/people_by_dollar.txt') }
  let(:percent_format) { File.read('spec/fixtures/people_by_percent.txt') }
  let(:order) { :first_name }

  let(:params) do
    {
      dollar_format: dollar_format,
      percent_format: percent_format,
      order: order,
    }
  end

  let(:payload) { instance_double(Parser::People::Payload, ) }

  subject { described_class.new(params) }

  describe "#parse" do
    it "should call order" do
      expect(subject).to receive(:order)
      subject.parse
    end

    it "should return instances of String" do
      records = subject.parse
      expect(records).to all(be_a(String))
    end
  end
end
