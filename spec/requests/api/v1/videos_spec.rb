require 'rails_helper'

RSpec.describe 'videos', type: :request do
  context 'no user' do
    describe 'index' do
      let!(:video) { create(:video) }
      it "returns 200" do
        get '/api/v1/videos.json'

        expect(response).to have_http_status(200)
        expect(json_body['records'][0]['id']).to eql(video.id)
      end
    end
  end
end