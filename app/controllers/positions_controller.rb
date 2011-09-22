class PositionsController < ApplicationController
  before_filter :load_resource
  respond_to :html

  def update
    action = params[:go]
    if action == 'up'
      @resource.move_higher
    elsif action == 'down'
      @resource.move_lower
    elsif action == 'top'
      @resource.move_to_top
    elsif action == 'bottom'
      @resource.move_to_bottom
    end
    respond_with [@project, @resource], :location => @location
  end

  # disable activities
  def paper_trail_enabled_for_controller
    false
  end

  private
  def load_resource
    @project = Project.get params[:project_id]
    if params[:page_id].present?
      @resource = @project.pages.find params[:page_id]
      @location = project_pages_path(@project)
    else
      @resource = Project.find -1
    end
  end
end