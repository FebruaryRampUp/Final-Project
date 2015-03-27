


require 'rubygems'
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end


beef_count = 0
lamb_count = 0
chicken_count = 0
fish_count = 0
shrimp_count = 0
tofu_count = 0
pork_count = 0

array = client.home_timeline(count:200)
array.map! {|element| element.text.downcase}
array.each do |string|
	if string.scan(/chicken/).length >=1
		chicken_count +=1
	elsif string.scan(/beef/).length >=1
		beef_count +=1
	elsif string.scan(/lamb/).length >=1
		lamb_count +=1
	elsif string.scan(/fish/).length >=1
		fish_count +=1
	elsif string.scan(/shrimp/).length >=1
		shrimp_count +=1
	elsif string.scan(/tofu/).length >=1
		tofu_count +=1
	elsif string.scan(/pork/).length >=1
		pork_count +=1
	end
end


protein_results ={"beef" => beef_count, "lamb" => lamb_count, "chicken" => chicken_count, "fish" => fish_count, "shrimp" => shrimp_count, "tofu" => tofu_count, "pork" => pork_count}
winner = protein_results.max_by{|k, v| v}


puts "Looks like your friends are having #{winner[0]}"
puts "What vegetable do you have in your fridge?"
vege = gets.chomp
puts "What carb do you have in your cabinet?"
carb = gets.chomp


protein_sauce = ["Teriyaki", "Curry", "Lemon Pepper", "Balsamic", "Jerk", "Morrocan", "Red Pepper Tomato"]
vege_sauce = ["salt and pepper", "balsamic", "honey glazed", "siracha"]
carb_sauce = ["feta and olive", "thai", "gravy", "mushroom", "smoke roasted", "lemon and caper"]

protein_number = rand(0-protein_sauce.length+1)
vege_number = rand(0-vege_sauce.length+1)
carb_number = rand(0-carb_sauce.length+1)

message = "For dinner, I'm going to have #{protein_sauce[protein_number]} #{winner[0]} with #{vege_sauce[vege_number]} #{vege} and #{carb_sauce[carb_number]} #{carb}"

client.update(message)
puts message


