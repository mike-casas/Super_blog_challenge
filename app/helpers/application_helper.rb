module ApplicationHelper
  def user_owner(own)
    current_user== own
  end
end
