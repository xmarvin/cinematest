require 'rails_helper'

RSpec.describe 'movies', type: :request do
  context 'no user' do
    describe 'index' do
      let!(:movie) { create(:movie) }
      let!(:season) { create(:season) }
      it "returns 200" do
        get '/api/v1/movies.json'

        expect(response).to have_http_status(200)
        expect(json_body['records'].length).to eql(1)
        expect(json_body['records'][0]['id']).to eql(movie.id)
      end
    end
  end
end