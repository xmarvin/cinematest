require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:user) { create(:user) }
  let(:video) { create(:video) }

  describe 'validation' do
    let(:purchase) { Purchase.new(user: user, expires_at: 3.days.from_now, video: video, price: 1, video_quality: 'hd') }
    context 'with expired purchase' do
      before do
        Purchase.create!(user: user, expires_at: 3.minutes.ago, video: video, price: 1, video_quality: 'hd')
      end
      it 'purchase valid' do
        expect(purchase.valid?).to be_truthy
      end
    end

    context 'with active purchase' do
      before do
        Purchase.create!(user: user, expires_at: 3.minutes.from_now, video: video, price: 1, video_quality: 'hd')
      end
      it 'returns error on duplicate purchase' do
        expect(purchase.valid?).to be_falsey
      end
    end
  end
end