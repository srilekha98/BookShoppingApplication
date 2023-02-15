class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions or /transactions.json
  def index
    if admin_user
      if admin_user.id != nil
        @transactions = Transaction.all
      end
    end
    if current_user
      if current_user.id != nil
        @transactions = Transaction.where(user_id: current_user.id)
      else
        @transactions = Transaction.all
      end
    end
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    if @book.nil?
      @book = Book.find(params[:book_id])
    end
    if current_user.cc_num != nil
      @credit_cards = current_user.cc_num
    end
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.transaction_number = Array.new(10){[*"A".."Z", *"0".."9"].sample}.join
    @book = Book.find(params[:transaction]["book_id"])
    @transaction.user_id = current_user.id
    @transaction.book_id = @book.id

    respond_to do |format|
      if @transaction.save
        @book.stock = @book.stock - @transaction.quantity
        @book.save!
        format.html { redirect_to transaction_url(@transaction), notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transaction_url(@transaction), notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:transaction_number, :credit_card_number, :address, :phone_number, :quantity, :total_price)
    end
end
