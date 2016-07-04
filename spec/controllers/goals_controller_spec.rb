require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  login_user

  describe "POST #encourage" do
    let(:goal){Goal.create!(name: "TestG", startdate: 2.days.ago, enddate: 1.day.ago)}
    it "returns http success" do
      post :encourage, id: goal.id, format: :js
      expect(response).to have_http_status(:success)
    end
    it "creates an encouragement on the goal" do
      # expect{
      #   post :encourage, id: goal.id, format: :js
      # }.to change { goal.encouragements.count }.from(0).to(1)
      post :encourage, id: goal.id, format: :js
      expect(goal.encouragements.count).to eq(1)
    end
  end

end
