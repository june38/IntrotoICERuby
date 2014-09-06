require 'csv'
data = CSV.read('data.csv')
max = 0 
mostPop = nil
lessPop = nil
mean = 0

score = Array.new(data.length-1)
for i in 1...data.length
	score[i-1]=data[i][1]
end
color = Array.new(data.length-1)
for i in 1...data.length
	color[i-1]=data[i][2]
end

puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "Please choose the Question number"
puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "1. Which student has the highest score in the class? Lowest?!"
puts "2. What is the mean of all student’s scores?!"
puts "3. What is the most popular color among students? Least popular?!"
puts "4. Capitalize the last letter of first name and last name, and lowercase the first letter of first"
puts ""

choose = gets.chomp.to_i

if choose==1 
	for i in 1...data.length
		if score.max == data[i][1]
			puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
			print "Highest score student is "
			puts data [i][0]
		end
	end
	for i in 1...data.length
		if score.min == data[i][1]
			print "Lowest score student is"
			puts data [i][0]
			puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		end
	end
elsif choose ==2
	for i in 1...data.length
		mean = score[i-1].to_f+mean
	end
	puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	print "Mean score is "
	puts mean/5
	puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
elsif choose ==3
	count = Hash.new(0)
	color.each {|word| count[word] += 1}
	topColor, trash = count.first
	puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	print "Most Favourite Color: " 
	puts topColor
	leastColor, trash = count.to_a.last
	print "Least Favourite Color: " 
	puts leastColor;
	puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
else
	puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	for i in 1...data.length
		
		puts data[i][0].reverse.split(/\b/).map(&:capitalize).join.reverse
		
	end
	puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
end

