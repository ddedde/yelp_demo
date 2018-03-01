class ReviewsController < ApplicationController
  before_action :current_user_must_be_review_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_review_user
    review = Review.find(params[:id])

    unless current_user == review.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @reviews = Review.all

    render("reviews/index.html.erb")
  end

  def show
    @response = Response.new
    @pic = Pic.new
    @review = Review.find(params[:id])

    render("reviews/show.html.erb")
  end

  def new
    @review = Review.new

    render("reviews/new.html.erb")
  end

  def create
    @review = Review.new

    @review.user_id = params[:user_id]
    @review.restaurant_id = params[:restaurant_id]
    @review.content = params[:content]
    @review.num_stars = params[:num_stars]

    save_status = @review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reviews/new", "/create_review"
        redirect_to("/reviews")
      else
        redirect_back(:fallback_location => "/", :notice => "Review created successfully.")
      end
    else
      render("reviews/new.html.erb")
    end
  end

  def edit
    @review = Review.find(params[:id])

    render("reviews/edit.html.erb")
  end

  def update
    @review = Review.find(params[:id])
    @review.restaurant_id = params[:restaurant_id]
    @review.content = params[:content]
    @review.num_stars = params[:num_stars]

    save_status = @review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reviews/#{@review.id}/edit", "/update_review"
        redirect_to("/reviews/#{@review.id}", :notice => "Review updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Review updated successfully.")
      end
    else
      render("reviews/edit.html.erb")
    end
  end

  def destroy
    @review = Review.find(params[:id])

    @review.destroy

    if URI(request.referer).path == "/reviews/#{@review.id}"
      redirect_to("/", :notice => "Review deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Review deleted.")
    end
  end
end
