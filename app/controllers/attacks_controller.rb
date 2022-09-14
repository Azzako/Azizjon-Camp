class AttacksController < ApplicationController
  before_action :set_project
  before_action :set_attack, only: [:show, :edit, :update, :destroy]


  # GET projects/1/tasks
  def index
    @attack = @project.attacks.build
    @attacks = @project.attacks
  end

  # GET projects/1/tasks/1
  def show
    @attack = @project.attacks.build
    @attacks = @project.attacks
  end

  # GET projects/1/tasks/new
  def new
 
  end

  # GET projects/1/tasks/1/edit
  def edit
  end

  # POST projects/1/tasks
  def create
    @attack = @project.attacks.build(attack_params)

    if @attack.save
      redirect_to project_attacks_path
    else
      render action: 'new'
    end
  end

  # PUT projects/1/tasks/1
  def update
    if @attack.update(attack_params)
      redirect_to(@attack.project)
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/tasks/1
  def destroy
    @attack.destroy
    redirect_to root_path
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.projects.find(params[:project_id])
    end

    def set_attack
      @attack = @project.attacks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attack_params
      params.require(:attack).permit(:name, :upload)
    end
end
