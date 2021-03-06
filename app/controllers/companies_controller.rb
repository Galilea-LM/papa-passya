# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :load_resource, except: %i[index]
  before_action :valid_user?, except: %i[index show]

  def index
    @companies = Company.all
  end

  def show
    @last_event_on_company = Event.search_by_company(@company).last(5)
  end

  def new; end

  def create
    if @company.save
      redirect_to companies_path, notice: 'Company was created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @company.update(params_company)
      redirect_to company_path(@company), notice: 'Company was updated'
    else
      render :edit
    end
  end

  def destroy
    if @company.destroy
      redirect_to companies_path, notice: 'Company was deleted'
    else
      render :show
    end
  end

  private

  def load_resource
    return @company = Company.find(params[:id]) if params[:id].present?
    return @company = Company.new(params_company) if params[:company].present?

    @company = Company.new
  end

  def valid_user?
    redirect_to root_path unless current_user.role == 'admin'
    true
  end

  def params_company
    params.require(:company).permit(:name, :address, :image)
  end
end
