class ApplicationController < ActionController::Base

  helper_method :profile_is_admin?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  # def require_user
  #   redirect_to '/login' unless current_user
  # end
  # def require_profile
  #   if signed_in?
  #     redirect_to new_profile_path unless current_user.profile
  #   end
  # end

end
