module ApplicationHelper
  def user_login_or_logout
    if session[:user]
      content_tag(:p, "Currently logged in as 
                       #{session[:user]}") +
      form_tag('/log_out', method: :delete) do 
        submit_tag 'log out' 
      end
    else 
      link_to 'log in', '/login' 
    end
  end
end
