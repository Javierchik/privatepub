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

  def subscribe
    @student_name = params[:name].capitalize
  end

  def message
    time = Time.now.strftime("%H:%M")
    message = params[:content]
    PrivatePub.publish_to("/classroom/messages", {time: time, message: message})
    render :nothing => true
  end
end