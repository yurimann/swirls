class CartController < ApplicationController

  def index
    @user = User.new
    @carts = session[:temp_cart]
    @cart = Cart.last
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def new
    @cart = Cart.new
  end

  def create

    @cart = Cart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart }
        format.json { render json: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end

    end

  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render json: @products}
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
  end

  def add_to_cart
    @cart = Cart.new(cart_params)
    respond_to do |format|
      format.html
      format.json { render json: @cart }
      if session[:temp_cart].nil?
        session[:temp_cart] = []
      end
      session[:temp_cart] <<  @cart
    end
  end

  def clear_cart
    respond_to do |format|
      format.html
      format.json { render json: @cart }
      session[:temp_cart] = nil
    end
  end

  def remove_from_cart
    num = params[:id]
    respond_to do |format|
      format.html
      format.json { render json: @cart }
      @carts = session[:temp_cart]
      y = 0
      if @carts != nil
        until y >= @carts.length do
          if @carts[y]["product_id"] == num.to_i
            @carts.delete_at(y)
          end
          y += 1
        end
      end
      session[:temp_cart] = @carts
    end
  end

  def check_if_taxable
    respond_to do |format|
      format.html
      format.json { render json: @cart }
      non_taxable = 6
      tax_rate = 0.13
      if !self.nil?
        total = 0
        self.each do |x|
          total += x[:quantity]
        end
      end
      if total < non_taxable
        total = total + (total * tax_rate)
      end
      total
    end
  end

  private

  def cart_params
    params.permit(:order_id, :product_id, :quantity)
  end

end
