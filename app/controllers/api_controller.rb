class ApiController < ActionController::Base
  before_action :authenticate_user_from_token!
  
  def authenticate_user_from_token!
    if params[:auth_token].present?
      user = User.find_by_authentication_token(params[:auth_token])
      # sign is used to set current user
      sign_in(user,store: false) if user
      # render :json =>{:message => "login via auth_token"}
    else
      render :json =>{:message => "do not have auth_token"}
    end
  end
end
