require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  login_incomplete_user

  controller do
    def index
    end

  end

  describe "GET #redirect_test" do
    it "redirects to profile create" do
      #user signed in, devise config.
      get :index
      expect(response).to redirect_to(edit_profile_path(subject.current_user.profile))
    end
  end

  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
