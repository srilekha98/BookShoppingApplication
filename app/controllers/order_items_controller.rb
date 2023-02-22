class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, :only => :create
  # GET /order_items or /order_items.json
  def index
    # @order_items = OrderItem.all
    @order_items = OrderItem.all.where(user_id:current_user.id)

  end

  # GET /order_items/1 or /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items or /order_items.json
  def create
    @order = current_order
    if session[:order_id].nil?
      @order.user_id = current_user.id
      @order.save
      session[:order_id] = @order.id
    end

    @order_item = @order.order_items.new(order_params)

    @order_item.user_id = current_user.id
    respond_to do |format|

      if @order_item.save
        format.html { redirect_to order_item_url(@order_item), notice: "Order item was successfully created." }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1 or /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to order_item_url(@order_item), notice: "Order item was successfully updated." }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1 or /order_items/1.json
  def destroy
    @order_item.destroy

    respond_to do |format|
      format.html { redirect_to order_items_url, notice: "Order item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def checkout

    if current_user.cc_num != nil and current_user.phone_num != nil
      @order_items = OrderItem.all.where(user_id:current_user.id)
      @total_amount = 0
      @order_items.each do |item|
        @book = Book.find_by(id: item.book_id)
          if @book.stock < item.quantity
            item.destroy
            redirect_to order_items_url, notice: "The stock for book with id: #{@book.id} is not sufficient"
          else
            @book.stock = @book.stock - item.quantity
            @book.save
          @price =  item.unit_price * item.quantity
          @total_amount += @price
          end
        end
    else
      redirect_to order_items_url, notice: "Credit Card Number or Phone Number not present for the user"
    end
  end

  def place_order
    @transactions = Array.new
    @transaction_label = Array.new(10){[*"A".."Z", *"0".."9"].sample}.join
    @user = current_user
    @order_items = OrderItem.all.where(user_id:current_user.id)
    @order_items.each do |item|
      @book = Book.find_by(id: item.book_id)
        @transaction = Transaction.new
        @transaction.transaction_number = @transaction_label
        @transaction.user_id = current_user.id
        @transaction.phone_number = @user.phone_num
        @transaction.address = @user.address
        @transaction.book_id = @book.id
        @transaction.credit_card_number = @user.cc_num
        @transaction.quantity = item.quantity
        @transaction.total_price = @book.price * item.quantity

        if @transaction.save
          @transactions.append(@transaction)
          item.destroy
        end
    end
    flash[:alert] = "Order has been placed successfully"
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_item_params
      params.require(:order_item).permit(:order_id, :book_id, :quantity, :total, :unit_price, :user_id)
    end

    def order_params
      params.require(:order_item).permit(:book_id, :quantity)
    end

end
