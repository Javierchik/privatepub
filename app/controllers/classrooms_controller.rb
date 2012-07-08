class ClassroomsController < ApplicationController
	def teacher
	end

	def student
	end

	def playpause
		if params[:video] == "0"
		  PrivatePub.publish_to "/classroom/video", "document.getElementById('asset').play()"
		elsif params[:video] == "1"
		  PrivatePub.publish_to "/classroom/video", "document.getElementById('asset').pause()"
		end
	  render :nothing => true
	end
end