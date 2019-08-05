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
    describe 'index' do
      it "returns a 403 if user not found" do
        get '/api/v1/purchases.json', params: { user_id: user_id }
        expect(response).to have_http_status(200)
      end
    end
    describe 'create' do
      let(:video) { create(:video) }
      context 'valid params' do
        let(:purchase_params) do
          { video_quality: 'hd', video_id: video.id }
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