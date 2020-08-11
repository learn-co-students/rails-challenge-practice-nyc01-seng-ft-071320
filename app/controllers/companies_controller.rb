class CompaniesController < ApplicationController
  def new
    @company = Company.new
    @buildings = Building.all
  end
  
  def create
    @company = Company.new(name: company_params[:name])

    company_params[:offices_attributes].values.each do |office_attribute|
      building_id = office_attribute[:id]
      office_attribute[:offices].reject(&:blank?).each do |floor|
        @company.offices.build(floor: floor, building_id: building_id)
      end
    end

    if @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
    @employee = Employee.new
  end

  private

  def company_params
    params.require(:company).permit(:name, offices_attributes: [:id, { offices: [] }] )
  end
end