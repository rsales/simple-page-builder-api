class ProjectsController < ApplicationController
  def index
    projects = Project.order(created_at: :desc)

    render json: projects
  end

  def show
    project = Project.find(params[:id])

    render json: project
  end

  def create
    project = Project.create!(project_params)

    render json: {
      message: "Projeto criado com sucesso!",
      project: project
    }, status: :created
  end

  def update
    project = Project.find(params[:id])
    project.update!(project_params)

    render json: {
      message: "Projeto atualizado com sucesso!",
      project: project
    }
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy!

    render json: {
      message: "Projeto excluído com sucesso!"
    }
  end

  private

  def project_params
    params.permit(:name, :description)
  end
end
