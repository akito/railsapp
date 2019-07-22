class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Login succeeded'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logout Succeeded'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
