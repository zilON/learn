require 'rails_helper'

RSpec.describe "CorrectTranslations", type: :request do
  describe "GET /correct_translations" do
    it "works! (now write some real specs)" do
      get correct_translations_index_path
      expect(response).to have_http_status(200)
    end
  end
end
