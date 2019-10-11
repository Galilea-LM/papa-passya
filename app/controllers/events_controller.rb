# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :load_resource, except: [:index]

  def new; end

  def create
    if @event.save
      redirect_to events_path, notice: 'Event was succesfully created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @event.update(params_event)
      redirect_to event_path(@event), notice: 'Event wass succesfully edited'
    else
      render :edit
    end
  end

  def delete
    if @event.destroy
      redirect_to events_path, notice: 'Event wass succesfully deleted'
    else
      render :show
    end
  end

  private

  def load_resource
    return @event = Event.find(params[:id]) if params[:id].present?
    return @event = Event.new(params_event) if params[:event].present?

    @event = Event.new
  end

  def params_event
    params.require(:event).permit(:name, :date_start, :date_end, :date, :description)
  end
end
