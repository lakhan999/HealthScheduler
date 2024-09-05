require 'rails_helper'


RSpec.describe Patient, type: :model do
  # byebug
  subject { Patient.new(name: "Jack", blood_group: "AB+", mobile_number: "8889995456") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a first_name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a blood_group" do
    subject.blood_group=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a mobile_number" do
    subject.mobile_number=nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the mobile_number is not 10 chars" do
    expect(subject.mobile_number.length).to eq(10)
  end
end
