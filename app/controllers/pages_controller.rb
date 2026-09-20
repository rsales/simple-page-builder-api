class PagesController < ApplicationController
  def index
    pages = Page
      .where(project_id: params[:project_id])
      .order_by(created_at: :desc)

    render json: pages
  end

  def create
    data = params[:data].to_unsafe_h

    page = Page.create!(
      project_id: params[:project_id],
      schema_id: params[:schema_id],
      title: params[:title],
      slug: params[:slug],
      data: data
    )

    render json: {
      message: "Page criada com sucesso!",
      page: page
    }, status: :created
  end

  def show
    page = Page
      .where(
        _id: params[:id],
        project_id: params[:project_id]
      )
      .first

    unless page
      render json: {
        error: "Page not found"
      }, status: :not_found

      return
    end

    render json: page
  end

  def update
    page = Page
      .where(_id: params[:id], project_id: params[:project_id])
      .first

    unless page
      render json: { error: "Page not found" }, status: :not_found
      return
    end

    attributes = params[:page].to_unsafe_h

    page.update!(attributes)

    render json: {
      message: "Page atualizada com sucesso!",
      updatedPage: page
    }
  end

  def destroy
    page = Page
      .where(
        _id: params[:id],
        project_id: params[:project_id]
      )
      .first

    unless page
      render json: {
        error: "Page not found"
      }, status: :not_found

      return
    end

    page.destroy!

    render json: {
      message: "Page excluída com sucesso!"
    }
  end
end
