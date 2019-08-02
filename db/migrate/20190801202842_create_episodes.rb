class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.references :video, foreign_key: true
      t.integer :number, null: false
      t.string :title

      t.timestamps
    end
    add_index :episodes, [:video_id, :number], unique: true
  end
end
