require 'rails_helper'
RSpec.describe "TasklistsController", type: :request do
  describe "users" do
    let(:user) { create(:user) }
    it "tasklist path" do
      sign_in user
      get "/tasklists"
      expect(response).to render_template("tasklists/index")
    end

    it "tasklist new" do
      sign_in user
      get "/tasklists/new"
      expect(response).to render_template("tasklists/new")
    end
  end
  # describe "/users" do
  #   let(:user) { User.create(password: "12345678") }
  #   before do
  #     sign_in user
  #   end

end