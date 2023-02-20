class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews or /reviews.json
  def index
    @reviews = if params[:book_id].present?
                  Review.where(book_id: params[:book_id])
               elsif params[:book].present?
                  Review.joins(:book).where(books: {name: params[:book]})
               elsif params[:user].present?
                  Review.joins(:user).where(users: {username: params[:user]})
               elsif params[:user_id].present?
                  Review.where(user_id: current_user.id)
               else
                 Review.all
               end
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
    @review.book_id = params[:book_id]
    @num = params[:book_id]
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    @book = Book.find(params[:review]["book_id"])
    if current_user
      @review.user_id = current_user.id
      @review.book_id = @book.id
    elsif admin_user
        @review.user_id = admin_user.id
        @review.book_id = @book.id
    end
     respond_to do |format|
      if @review.save
        @book.average_rating = @book.average_rating + @review.rating
        @book.average_rating = @book.average_rating / Review.where(book_id: @book.id).count
        @book.average_rating = @book.average_rating.round(2)
        @book.save!
        format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating, :review)
    end
end
