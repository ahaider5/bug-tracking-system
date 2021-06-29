class ProjectsController < ApplicationController
  load_and_authorize_resource  
  before_action :set_resource, only: [:show, :edit, :destroy]

  def index
    @projects = Project.order("id ASC").all
  end

  def show;end
  
  def new
    @project = Project.new()
    @qas = User.find_by(user_type: 1)
    @devs = User.find_by(user_type: 2)
  end

  def edit;end
  
  def create
    # byebug
    @project = Project.new(params.permit(:name, :description, :qas, :devs))
    @project.created_by = current_user
    if @project.save
      qas = params['qas']
      devs = params['devs']
      qas.each do |a|
        @project.qas << User.find_by(id: a)
      end
      devs.each do |b|
        @project.devs << User.find_by(id: b)
      end
      redirect_to projects_path
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render "new"
    end
  end

  def update
    @project.update(project_params)
    redirect_to projects_path
  end

  def update2
    ProjectQa.delete_by(project_id: params['id'])
    ProjectDev.delete_by(project_id: params['id'])
    qas = params['qas']
    devs = params['devs']
    qas.each do |a|
      @project.qas << User.find_by(id: a)
    end
    devs.each do |b|
      @project.devs << User.find_by(id: b)
    end
    redirect_to projects_path
  end

  def destroy
    @project.destroy!
    respond_to do |format|
      format.html { redirect_to projects_path, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_resource
    @project = Project.find params[:id]
  end

  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  def project_params
    params.permit(:name, :description, :project_qas_attributes,:project_devs_attributes )
  end
end
