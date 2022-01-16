require 'spec_helper'

RSpec.describe People::Record do
    
  let(:first_name) { "Elliot" }
  let(:last_name) { "John" }
  let(:city) { "LA" }
  let(:birthdate) { "1974-4-30" }

  let(:params) { {"first_name"=> first_name, "last_name"=> last_name, "city"=> city, "birthdate"=> birthdate} }

  subject { described_class.new(params) }

  describe "#first_name" do
    it "should return first name" do
      puts params.inspect
      expect(subject.first_name).to eq(first_name)
    end
  end

  describe "#last_name" do
    it "should return last name" do
      expect(subject.last_name).to eq(last_name)
    end
  end

  describe "#city" do
    context "when city is given as shortform" do
      let(:city) { "LA" }

      it "should return city's full name" do
        expect(subject.city).to eq("Los Angeles")
      end
    end

    context "when city is given in fullform" do
      let(:city) { "Atlanta" }

      it "should return city's full name" do
        expect(subject.city).to eq(city)
      end
    end
  end

  describe "#birth_date" do
    context "when birthdate is given as YYYY - MM - DD" do
      let(:birthdate) { "1974-4-30" }

      it "should return city's full name" do
        expect(subject.birth_date).to eq("4/30/1974")
      end
    end

    context "when birthdate is given as D-M-YYYY" do
      let(:birthdate) { "30-4-1974" }

      it "should return birthdate in 'M/D/YYYY'" do
        expect(subject.birth_date).to eq("4/30/1974")
      end
    end
  end

end
