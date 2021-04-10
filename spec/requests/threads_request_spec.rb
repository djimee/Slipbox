require 'rails_helper'

RSpec.describe "Threads", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/threads/index"
      expect(response).to have_http_status(:success)
    end
  end

end
