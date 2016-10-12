class UserApplicationController < ApplicationController

  before_action :check_if_admin

  def check_if_admin
    if current_user && current_user.admin?
     redirect_to  admins_statics_path and return
    end
  end

end
