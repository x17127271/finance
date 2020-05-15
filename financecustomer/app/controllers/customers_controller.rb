class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(params.require(:customer).permit(:name, :phone, :city))
    if @customer.valid?
      redirect_to customers_path
    else
      flash[:errors] = @customer.errors.full_messages
      redirect_to new_customer_path
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(params.require(:customer).permit(:name, :phone, :city))
    redirect_to customer_path(@customer)
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end
end
