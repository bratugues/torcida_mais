class ReviewsController < ApplicationController
  before_action :set_event, only: [:create]
  def index
    @reviews = @event.reviews.includes(:user)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.event = @event
    @review.user = current_user
    if @review.save
      redirect_to event_path(@event)
    else
      @attendance = Attendance.new
      render "events/show", status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content, :title)
  end
end
