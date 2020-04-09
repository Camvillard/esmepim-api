class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update]

  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    render json: @order
  end

  def create
    @order = Order.new
    @order.email = params[:order][:user_email].strip
    @order.quantity = 1

    @product = Product.find_by(name: 'livre de recettes')
    @order.product = @product

    @order.save!
    @product.update(price_cents: params[:order][:amount] * 100)


    if charge_order
      mail = UserMailer.with(email: @order.email, amount: @order.product.price_cents, order: @order).recipe_book
      mail.deliver_now
      render json: @order, status: :created
    else
      render json: @order, status: :unprocessable_entity
    end

  end

  def charge_order
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    begin

      customer = Stripe::Customer::create(
        email: @order.email,
        source: params[:order][:token]
      )

      charge = Stripe::Charge::create({
        customer: customer.id,
        amount: @order.product.price_cents,
        currency: 'cad'
      })

    end

  end


  def update

  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_email, :quantity)
  end

end
