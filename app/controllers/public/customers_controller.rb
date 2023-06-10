class Public::CustomersController < ApplicationController

def show
end

def edit
 @customer = Customer.find(current_customer.id)
end

def update
    customer = Customer.find(current_customer.id)
    customer.update(customer_params)
    redirect_to customers_my_page_path
end

def unsubscribe
end

def withdraw
    @customer = User.find(current_customer.id)
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
end


private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana)
  end

end