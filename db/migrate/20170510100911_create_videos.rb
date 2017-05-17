class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :question_id
      t.string :youtube_url

      t.timestamps null: false
    end
  end
end
