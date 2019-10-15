# frozen_string_literal: true

class SpacesController < ApplicationController
  before_action :load_resource, except: [:index]
  before_action :valid_user?, except: %i[index show]

  def show
    @last_event_on_spaces = Event.search_by_space(@space).last(5)
  end

  def index
    @spaces = Space.all
  end

  def new; end

  def create
    if @space.save
      redirect_to spaces_path, notice: 'space was created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @space.update(params_space)
      redirect_to spaces_path(@space), notice: 'space was updated'
    else
      render :edit
    end
  end

  def destroy
    if @space.destroy
      redirect_to spaces_path, notice: 'space was deleted'
    else
      render :show
    end
  end

  private

  def load_resource
    return @space = Space.find(params[:id]) if params[:id].present?
    return @space = Space.new(params_space) if params[:space].present?

    @space = Space.new
  end

  def valid_user?
    redirect_to root_path unless current_user.role == 'admin'
    true
  end

  def params_space
    params.require(:space).permit(:name, :address, :place, :description, images: [])
  end
end
