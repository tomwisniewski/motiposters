require 'spec_helper'

describe Order do
  let(:order){ FactoryGirl.build(:order) }
      # Order.new(name: "Exemple User", email: "name.surname@gmail.com", street: "Exemple street", city: "Exemple city", postcode: "8TEST")}

  subject {order}
  it { should respond_to(:name)}

  describe "when name is not present" do
    before {order.name= " "}
    it {should_not be_valid}
  end

  describe "when email is not prensent" do
    before {order.email= " "}
    it {should_not be_valid}
  end

  describe "when name is to long" do
    before {order.name = "a" * 51}
    it {should_not be_valid}
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org]
      addresses.each do |invalid_address|
        order.email = invalid_address
        expect(order).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        order.email = valid_address
        expect(order).to be_valid
      end
    end
  end
end