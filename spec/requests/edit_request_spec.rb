require 'rails_helper'

RSpec.describe "Edits", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/edit/index"
      expect(response).to have_http_status(:success)
    end
  end

end
