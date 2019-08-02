class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.datetime :expires_at, null: false
      t.string :video_quality, null: false
      t.decimal :price, null: false
      t.references :user, null: false
      t.references :video, null: false

      t.timestamps
    end
  end
end
