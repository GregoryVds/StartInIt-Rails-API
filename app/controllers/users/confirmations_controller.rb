class Users::ConfirmationsController < Devise::ConfirmationsController
  
  def getting_started
  end

  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    confirmation_getting_started_path
  end
end
