class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :type, null: false, index: true
      t.string :title, null: false, unique: true
      t.string :plot, null: false

      t.timestamps
    end
  end
end
