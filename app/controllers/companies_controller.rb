class CompaniesController < ApplicationController
    def index
        @companies = Company.all
    end

    def show
        @company = Company.find(params[:id])
    end

    def new
        @company = Company.new
    end

    def edit
        @company = Company.find(params[:id])
    end

    def create
        @company = Company.create(strong_params)
        redirect_to company_path(@company)
    end

    def update
        @company = Company.find(params[:id])
        @company.update(strong_params)
        redirect_to company_path
    end

    def destroy
        @company = Company.find(params[:id])
        @company.destroy
        redirect_to company_path
    end

    private

    def strong_params
        params.require(:company).permit(:name)
    end
end