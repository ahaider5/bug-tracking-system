class BugsController < ApplicationController
  load_and_authorize_resource
  before_action :set_resource, only: [:show, :edit, :destroy]
  
  def index
    @bugs = Bug.order("created_at DESC").all
  end
  
  def show;end
  
  def new
    @bug = Bug.new()
  end
  
  def edit
  end

  def create
    @bug = Bug.new(params.permit(:project_id, :title, :description, :deadline, :screenshot, :bug_type, :feature_status, :bug_status, :solved_by ))
    @bug.created_by = current_user
    # byebug
    if @bug.save
      redirect_to bugs_path
    else
      # render plain: @bug.errors.full_message
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render "new"
    end
  end

  def update;end

  def destroy
    @bug.destroy!
    respond_to do |format|
      format.html { redirect_to bugs_path, notice: "Bug was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_resource
    @bug = Bug.find params[:id]
  end
end
