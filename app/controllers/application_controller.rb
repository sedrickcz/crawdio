class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_project, :init_pages

  private
  # Init project which shows on main page
  def init_project
    @main_project = Refinery::Projects::Project.first
  end

  # Init project pages which are shown on main page
  def init_pages
    @project_pages = Refinery::Page.where(parent_id: 8)
  end
end
