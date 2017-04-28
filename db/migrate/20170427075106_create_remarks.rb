class CreateRemarks < ActiveRecord::Migration
  def change
    create_table :remarks do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
