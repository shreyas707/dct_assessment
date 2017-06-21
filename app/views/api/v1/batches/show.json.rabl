object @batch 
attributes :id, :title, :start_date, :end_date

child :students do 
	attributes :name, :email, :dob, :mobile
end