require 'rails_helper'

RSpec.describe Doctor, type: :model do
  subject { Doctor.new(name: "Vishal", consultation_fees: 300, mobile_number: "8889995456", specialization: "MBBS Homiopathy") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a first_name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a blood_group" do
    subject.consultation_fees=nil
    expect(subject).to_not be_valid
  end

  # it "is not valid without a mobile_number" do
  #   subject.mobile_number=98798
  #   expect(subject).to_not be_valid
  # end

  it "is not valid without a mobile_number" do
    subject.specialization=nil
    expect(subject).to_not be_valid
  end

  byebug
  it "is not valid if the mobile_number is not 10 chars" do
    expect(subject.mobile_number.length).to eq(10)
  end
end
