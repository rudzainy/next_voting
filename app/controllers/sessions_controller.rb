class SessionsController < Clearance::SessionsController


  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        redirect_to signed_in_path
      else
        flash.now.notice = status.failure_message
        render template: "sessions/new", status: :unauthorized
      end
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  def new
    render template: "sessions/new"
  end


  private

  def signed_in_path
    if current_user.admin?
       admins_statics_path
    else
       root_path
    end
  end

end
