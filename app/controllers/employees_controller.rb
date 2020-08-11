class EmployeesController < ApplicationController
  def create
    @employee = Employee.create(employee_params)
    redirect_to @employee.company
  end
  
  def destroy
    @employee = Employee.find(params[:id])
    @company = @employee.company
    @employee.destroy
    redirect_to @company 
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :title, :company_id)
  end
end
