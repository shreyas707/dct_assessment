fname = File.open("temporary/13_43.txt","w")
$stderr = fname
$stdout = fname
puts "hi"
fname.close
