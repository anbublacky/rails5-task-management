require 'application_responder'
# Application controller
class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :rescue_from_fk_contraint, only: [:destroy]

  def rescue_from_fk_contraint
    begin
      yield
    rescue ActiveRecord::InvalidForeignKey
    	redirect_to :back
      flash[:alert] = 'You have associated records, so cant destroy'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:name, :email, :password, :password_confirmation]
    )
  end
end
