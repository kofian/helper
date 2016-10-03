module CurrentCart
extend ActiveSupport::Concern

private

 def set_cart
  @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
  @cart = Cart.create
  session[:cart_id] = @cart.id
  end

  def set_user_cart
  @user_cart = current_user.carts
  @cart = @user_cart.find_by(params[:cart_id])
  rescue ActiveRecord::RecordNotFound
  @cart = Cart.create
  session[:cart_id] = @cart.id
  end

end
