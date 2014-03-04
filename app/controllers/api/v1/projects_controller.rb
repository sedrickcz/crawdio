class Api::V1::ProjectsController < Api::V1::ApplicationController
  # API CALL curl -X GET http://localhost:3000/api/projects
	def index
		render json: Refinery::Projects::Project.where(active: true), each_serializer: ProjectSerializer, status: 200
	end

  # API CALL curl -X GET http://localhost:3000/api/projects/:id
  def show
    project = Refinery::Projects::Project.where(id: params[:id], active: true).first

    if project
      render json: project, serializer: ProjectSerializer, status: 200
    else
      render json: {error: "Project not exists!"}, status: 401
    end
  end
end


