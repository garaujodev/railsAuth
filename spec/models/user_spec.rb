require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "create" do
    it "is not valid without valid attributes" do
      expect(User.new).to_not be_valid
    end
    it "is not valid without a email" do
      user = User.new(password: 'passwordtest')
      expect(user).to_not be_valid
    end
    it "is not valid without a password" do
      user = User.new(email: Faker::Internet.email)
      expect(user).to_not be_valid
    end
  end

end
