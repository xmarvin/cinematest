class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.datetime :expires_at, null: false, index: true
      t.references :user, null: false, index: true
      t.references :purchase_option, null: false

      t.timestamps
    end
  end
end
