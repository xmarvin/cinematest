require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:user) { create(:user) }
  let(:video) { create(:video, :purchase_options) }

  describe 'validation' do
    let(:purchase_option) { video.purchase_options.first }
    let(:purchase) { Purchase.new(user: user, expires_at: 3.days.from_now, purchase_option: purchase_option) }
    context 'with expired purchase' do
      before do
        Purchase.create!(user: user, expires_at: 3.minutes.ago, purchase_option: purchase_option)
      end
      it 'purchase valid' do
        expect(purchase.valid?).to be_truthy
      end
    end

    context 'with active purchase' do
      before do
        Purchase.create!(user: user, expires_at: 3.minutes.from_now, purchase_option: purchase_option)
      end
      it 'returns error on duplicate purchase' do
        expect(purchase.valid?).to be_falsey
      end
    end
  end
end