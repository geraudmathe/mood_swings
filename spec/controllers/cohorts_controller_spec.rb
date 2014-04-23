require "spec_helper"

describe CohortsController do
  include Devise::TestHelpers

  describe "GET #index" do
    let!(:cohorts) { FactoryGirl.create_list(:cohort, 3) }
    let(:user){ User.create(email: "test@mail.com") }

    context "logged in as a user" do
      before do
        sign_in user
        
      end

      it "should render all cohorts objects" do
        get :index
        expect(response.status).to be 302
      end

      it "should redirect to home page" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "logged in as an admin" do
      
      before do
        user.update_attribute(:role, :admin)
        sign_in user
        get :index
      end

      it "should render all cohorts objects" do
        expect(assigns[:cohorts]).to eq(cohorts)
      end

      it "should returns a http 200 OK status" do
        expect(response.status).to be(200)
      end
    end
  end
end