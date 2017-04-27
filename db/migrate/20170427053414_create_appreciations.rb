class CreateAppreciations < ActiveRecord::Migration
  def change
    create_table :appreciations do |t|
      t.string :title
      t.integer :answer_id

      t.timestamps null: false
    end
  end
end
