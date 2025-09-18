class MatchesController < ApplicationController

  def index
    @matches = Match.all
    if params[:date].present?
      begin
        date = Date.parse(params[:date])
        @matches = @matches.where(played_at: date.all_day)
      rescue ArgumentError
      end
    end
  end

  def new
  end

  def create
  end
end
