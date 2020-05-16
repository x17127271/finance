class CasesController < ApplicationController
  def index
    @cases = Case.all
  end

  def new
    @case = Case.new
  end

  def create
    @case = Case.create(params.require(:case).permit(:customer_id, :topic, :comments))
    if @case.valid?
      redirect_to customer_path(@case.customer)
    else
      flash[:errors] = @case.errors.full_messages
      redirect_to new_case_path
    end
  end

  def show
    @case = Case.find(params[:id])
  end

  def edit
    @case = Case.find(params[:id])
  end

  def update
    @case = Case.find(params[:id])
    @case.update(params.require(:case).permit(:topic, :comments))
    redirect_to case_path(@case)
  end

  def destroy
    @case = Case.find(params[@id])    
    @case.destroy
    redirect_to cases_path
  end
end
