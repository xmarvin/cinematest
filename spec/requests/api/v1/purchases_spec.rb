require 'rails_helper'

RSpec.describe 'Purchases', type: :request do
  context 'no user' do
    let(:user_id) { nil }
    describe 'index' do
      it "returns a 403 if user not found" do
        get '/api/v1/purchases.json', params: { user_id: user_id }
        expect(response).to have_http_status(401)
      end
    end
  end

  context 'valid user' do
    let(:user) { create(:user) }
    let(:user_id) { user.id }
    let!(:purchase) { create(:purchase, user: user) }
    let(:video) { purchase.video }
    describe 'get video' do
      it "returns purchased video" do
        get '/api/v1/purchases.json', params: { user_id: user_id }
        expect(response).to have_http_status(200)
        expect(json_body['records'][0]['video']['id']).to eql(video.id)
      end
      it "returns purchased video" do
        get api_v1_purchase_path(purchase), params: { user_id: user_id }
        expect(response).to have_http_status(200)
        expect(json_body['video']['id']).to eql(video.id)
      end
    end
    describe 'create' do
      let(:video) { create(:video, :purchase_options) }
      let(:purchase_option) { video.purchase_options.first }
      context 'valid params' do
        let(:purchase_params) do
          { purchase_option_id: purchase_option.id }
        end
        it 'creates purchase record' do
          post '/api/v1/purchases.json', params: { user_id: user.id, purchase: purchase_params }
          expect(response).to have_http_status(201)
        end
        it 'returns 422 when video already purchased' do
          create :purchase, user: user, video: video
          post '/api/v1/purchases.json', params: { user_id: user.id, purchase: purchase_params }
          expect(response).to have_http_status(422)
        end
      end
    end
  end

end