num = 53
result = 0 
while num > 9
	product = 1
	num.to_s.split("").each do |n|
		product *= n.to_i
	end
	num = product
end

puts num