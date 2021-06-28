class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_resource, only: [:create, :show, :edit, :destroy]
  
  def index
    @users = User.order("id ASC").all
  end

  def create
    @project = Project.new(params[:client])
    if @project.save
      redirect_to @project
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render "new"
    end
  end

  def show;end

  def edit;end

  def destroy
    @user.destroy!
    respond_to do |format|
      format.html { redirect_to users_path, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_resource
    @user = User.find params[:id]
  end
end
