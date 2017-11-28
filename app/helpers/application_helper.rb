module ApplicationHelper
	def login_helper style
		if current_user.is_a?(GuestUser)
  		(link_to "Register", new_user_registration_path, class: style) +
  		" ".html_safe +
  		(link_to "Login", new_user_session_path, class: style)
  	else
  		 link_to "Logout", destroy_user_session_path, method: :delete, class: style 
  	end 
	end

	def copyright_generator	
 		JarysSatreViewTool::Renderer.copyright 'Jarys Satre ', 'All rights reserved'
 	end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "J. Satre | Portfolio", time: 3000)
  end
end