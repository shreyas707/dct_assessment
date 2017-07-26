require 'httparty'

HTTParty.post("http://localhost:3001/sms", headers: { "Content-Type" => "application/json" },
	  body:  { 
	  	"sm" => {
			"number" => "9740411566",
			"message" => "From HTTParty"
		}
	}.to_json)