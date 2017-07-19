class AddColumnsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :gender, :string
    add_column :students, :dob, :date
  end
end
