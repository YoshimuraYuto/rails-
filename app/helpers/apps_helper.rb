module AppsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      confirm_apps_path
    elsif action_name == 'edit'
      app_path
    end
  end
end
