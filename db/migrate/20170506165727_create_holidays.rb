class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.date :holiday_date

      t.timestamps null: false
    end
  end
end
