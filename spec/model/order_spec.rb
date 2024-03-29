require 'spec_helper'

describe Order do

  let(:order) { FactoryGirl.build(:order) }

  subject { order }

  it { should respond_to(:name)}

  describe "when name is not present" do
    before { subject.name = nil }
    it {should_not be_valid}
  end

  describe "when email is not prensent" do
    before { subject.email = nil }
    it {should_not be_valid}
  end

  describe "when name is too long" do
    before { subject.name = "a" * 51 }
    it {should_not be_valid}
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org]
        subject.email = invalid_address
        expect(subject).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        subject.email = valid_address        
        expect(subject).to be_valid
      end
    end
  end
end