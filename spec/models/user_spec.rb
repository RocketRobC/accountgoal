require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates a profile automatically for a new user" do
    user = User.create!(email: "test@test.com", password: "123456789")
    expect(user.profile).not_to be_nil
  end
  it "provided profile isn't overwritten by auto created profile" do
    profile = Profile.new(fname: "Fred", lname: "Cat")
    user = User.create!(email: "test@test.com", password: "123456789", profile: profile)
    expect(user.profile.fname).to eq("Fred")
  end
end
