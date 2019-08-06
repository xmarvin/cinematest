class AddPurchaseOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_options do |t|
      t.string :video_quality, null: false
      t.decimal :price, null: false
      t.references :video, null: false, index: true
      t.timestamps
    end
  end
end
