class SchemasController < ApplicationController
  def index
    schemas = PageSchema
      .where(project_id: params[:project_id])
      .order_by(created_at: :desc)

    render json: schemas
  end

  def create
    schema = PageSchema.create!(
      project_id: params[:project_id],
      name: params[:name],
      slug: params[:slug],
      type: params[:type],
      schema_fields: params[:schema_fields]
    )

    render json: {
      message: "Schema criado com sucesso!",
      schema: schema
    }, status: :created
  end

  def show
    schema = PageSchema
      .where(
        _id: params[:id],
        project_id: params[:project_id]
      )
      .first

    unless schema
      render json: {
        error: "Schema not found"
      }, status: :not_found

      return
    end

    render json: schema
  end

  def update
    schema = PageSchema
      .where(
        _id: params[:id],
        project_id: params[:project_id]
      )
      .first

    unless schema
      render json: {
        error: "Schema not found"
      }, status: :not_found

      return
    end

    schema.update!(
      name: params[:name],
      slug: params[:slug],
      type: params[:type],
      schema_fields: params[:schema_fields],
      component_name: params[:component_name]
    )

    render json: {
      message: "Schema atualizado com sucesso!",
      updatedSchema: schema
    }
  end

  def destroy
    schema = PageSchema
      .where(
        _id: params[:id],
        project_id: params[:project_id]
      )
      .first

    unless schema
      render json: {
        error: "Schema not found"
      }, status: :not_found

      return
    end

    schema.destroy!

    render json: {
      message: "Schema excluído com sucesso!"
    }
  end
end
