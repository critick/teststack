require 'json'

new_json=[]
 ojson = JSON.parse(File.read('cucumber.json'))

 #update location in all before tags in element
 ojson.each do |a|

#puts a["elements"].count
 a["elements"].each do |element| 	
     	
 	 if element["before"] != nil
 		element["before"].each do |before|  			
 			before["match"].each do |match| 
 			#puts match[1]["file"]
 			if match[1]["file"]!= nil			  				
 			  	to_update = match[1]["file"] 			  	
 		      	match = {"location"=>to_update,"lines"=>match[1]["lines"]} 		      	        	
 		      	
 	        end	
 	        	before["match"] = match
 	        	#puts before
 	    	end
 	        
 	        #puts element["before"]
 		end
 	end	
 	if element["after"] != nil
 		#puts element["after"]
 		element["after"].each do |after|  			
 			after["match"].each do |match| 
 			#puts match
 			if match[1]["file"]!= nil			  				
 			  	to_update = match[1]["file"]
 			  	
 		      	match = {"location"=>to_update,"lines"=>match[1]["lines"]} 		      	        	
 		      	
 	        end	
 	        	after["match"] = match
 	        	#puts before
 	    	end
 	        
 	        #puts element["before"]
 	    end
	end
	

 	if element["steps"] != nil 		
 		element["steps"].each do |step|  			
 			if  step["match"]["location"].class == Hash
	 			step["match"].each do |match|  			
 			if match[1]["file"]!= nil			  				
 			  	to_update = match[1]["file"]
 			  	
 		      	match = {"location"=>to_update,"lines"=>match[1]["lines"]} 		      	        	
 		      	
 	        end	
 	        	step["match"] = match
 	        	#puts before
 	    	end
 	        end
 	        #puts element["before"]
 	    end
	end 	



	#puts a["elements"]
  end
  #puts a["elements"]
	#puts a.count 
 
end


#puts ojson
File.open("cucumber.json","w") do |f|
  f.write(ojson.to_json)
end

