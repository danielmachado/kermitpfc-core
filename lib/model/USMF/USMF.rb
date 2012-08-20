require_relative './user'
require_relative '../../logging'

# @author Daniel Machado Fernandez
# @version 1.0
# 
# USMF standard message from Tawlk
# @see https://github.com/Tawlk/hyve/wiki/Unified-Social-Media-Format-(USMF)
class USMF
	
  include Logging

  attr_accessor :service,:user,:to_users,:links,:id,:geo,:application,:location,:date,:source,:text,:description,:keywords,
  :category,:duration,:likes,:dislikes,:favorites,:comments,:rates,:rating,:min_rating,:max_rating 

  # Unify the fields into a string
  #
  # @return [String] resultant string
  def to_s

  	res = "\nservice: " + service.to_s + "\nid: " + id.to_s + "\ngeo: " + geo.to_s + "\napplication: " + application.to_s + "\nlocation: " + location.to_s + "\ndate: " + date.to_s + "\nsource: " + source.to_s + "\ntext: " + text.to_s + "\ndescription: " + description.to_s + "\nkeywords: " + keywords.to_s + "\ncategory: " + category.to_s + "\nduration: " + duration.to_s + "\nlikes: " + likes.to_s + "\ndislikes: " + dislikes.to_s + "\nfavorites: " + favorites.to_s + "\ncomments: " + comments.to_s + "\nrates: " + rates.to_s + "\nrating: " + rating.to_s + "\nmin_rating: " + min_rating.to_s + "\nmax_rating: " + max_rating.to_s + "\n[USER]: " + user.to_s + "\n[TO_USERS]: " + to_users.to_s + "\n[LINKS]: " + links.to_s
  	res

  end

  # Unify the fields into a hash
  #
  # @return [Hash] resultant hash
  def to_hash

  	res = { 
            "service" => service, 
      		  "id" => id,
      			"geo" => geo,
      			"application" => application,
      			"location" => location,
      			"date" => date,
      			"source" => source,
      			"text" => text,
      			"description" => description,
      			"keywords" => keywords,
      			"category" => category,
      			"duration" => duration,
      			"likes" => likes,
      			"dislikes" => dislikes,
      			"favorites" => favorites,
      			"comments" => comments,
      			"rates" => rates,
      			"rating" => rating,
      			"min_rating" => min_rating,
      			"max_rating" => max_rating
  		    }

      l = []
    
      unless :links == nil

        links.each do |link|

          l << link.to_hash

        end
    
        res["links"] = l
    
      end

      tu = []
    
      unless :to_users == nil

        to_users.each do |us|

          tu << us.to_hash

        end
    
        res["to_users"] = tu
    
      end
      begin
    
      	unless :user == nil
      	  res["user"] = user.to_hash
      	end
    
      rescue
    
     	 res["user"] = nil
      	 #Sometimes a corrupt user was found
    	 
    	 res = nil
    	
      end

  	res

  end

end