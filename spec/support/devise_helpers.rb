module DeviseHelpers

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      profile = Profile.new(fname: "Fred", lname: "Cat")
      sign_in User.create!(email: "test@test.com", password: "12345678", profile: profile)
    end
  end

  def login_incomplete_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in User.create!(email: "test@test.com", password: "12345678")
    end
  end

end
