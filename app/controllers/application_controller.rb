class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from ActiveRecord::RecordNotFound do |exception|
    if Rails.env.to_s == "development"
      raise exception 
    else
      render file: Rails.root.join("public", "404.html"), status: 404
    end
  end 
end
