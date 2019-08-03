class ApplicationController < ActionController::API
  include ActionController::Caching
  before_action :authenticate_user!


  private

  def authenticate_user!
    @current_user = User.find_by(id: params[:user_id])
  end

end
