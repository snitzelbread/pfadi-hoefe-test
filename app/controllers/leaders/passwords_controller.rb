# frozen_string_literal: true

class Leaders::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  def new
    super
  end

  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
      flash.now[:notice] = "If your email address exists in our database, you will receive a password recovery link shortly."
    else
      respond_with(resource)
      flash.now[:alert] = "There was an error sending the password reset instructions. Please try again."
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    super
  end

  # PUT /resource/password
  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      if resource_class.sign_in_after_reset_password
        flash[:notice] = "Your password has been successfully reset."
        sign_in(resource_name, resource)
      else
        flash[:alert] = "Password reset successful, but your account is not active."
      end
      respond_with resource, location: after_resetting_password_path_for(resource)
    else
      flash[:alert] = "There was an error resetting your password. Please try again."
      respond_with resource
    end
  end

  protected

  def after_resetting_password_path_for(resource)
    super
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    super
  end
end
