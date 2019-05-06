class ApplicationController < ActionController::Base

  helper_method :profile_is_admin?

  # def require_user
  #   redirect_to '/login' unless current_user
  # end
  # def require_profile
  #   if signed_in?
  #     redirect_to new_profile_path unless current_user.profile
  #   end
  # end

end
