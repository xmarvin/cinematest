require 'rails_helper'

RSpec.describe 'seasons', type: :request do
  context 'no user' do
    describe 'index' do
      let!(:video) { create(:season) }
      it "returns 200" do
        get '/api/v1/seasons.json'

        expect(response).to have_http_status(200)
        expect(json_body['records'][0]['id']).to eql(video.id)
      end
    end
  end
end