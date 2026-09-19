class ProjectsController < ApplicationController
  def index
    projects = Project.order(created_at: :desc)

    render json: projects
  end

  def create
    puts "PARAMS CLASS: #{params.class}"
    puts "PARAMS: #{params.inspect}"

    project = Project.create!(project_params)

    render json: {
      message: "Projeto criado com sucesso!",
      project: project
    }, status: :created
  end

  private

  def project_params
    params.permit(:name, :description)
  end
end
