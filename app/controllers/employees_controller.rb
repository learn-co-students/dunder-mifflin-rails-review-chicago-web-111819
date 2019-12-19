class EmployeesController < ApplicationController

    def new
        @emp = Employee.new
        @dogs = Dog.all
        @errors = flash[:errors]
    end

    def create
        @emp = Employee.new(employee_params)
        # @emp.save
        # redirect_to employee_path(@emp)

        if @emp.valid?
            @emp.save
            redirect_to @emp
        else
            flash[:errors] = @emp.errors.full_messages
            redirect_to new_employee_path
        end
    end

    def show
        @emp = Employee.find_by(id: params[:id])
    end

    def index
        @employees = Employee.all
    end

    def edit
        @emp = Employee.find_by(id: params[:id])
        @errors = flash[:errors]
    end

    def update
        @emp = Employee.find_by(id: params[:id])
        @emp.update(employee_params)
        # @emp.update(employee_params)
        # redirect_to employee_path(@emp)

        if @emp.valid?
            redirect_to @emp
        else
            flash[:errors] = @emp.errors.full_messages
            redirect_to edit_employee_path
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
    
end
