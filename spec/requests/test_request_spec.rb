require 'rails_helper'

RSpec.describe "Tests", type: :request do

  describe "GET /idnex" do
    it "returns http success" do
      get "/test/idnex"
      expect(response).to have_http_status(:success)
    end
  end

end
