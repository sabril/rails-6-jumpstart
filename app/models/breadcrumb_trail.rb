class BreadcrumbTrail < Croutons::BreadcrumbTrail

  def home_index
    breadcrumb("Home", root_path)
  end

  def devise_registrations_edit
    home_index
    breadcrumb("Profile")
  end
end