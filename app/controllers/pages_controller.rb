class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :dashboard ]

  def home
    redirect_to dashboard_path if user_signed_in?
  end

  def about
  end

  def dashboard
    @my_matches = Match.where("team_1 = :team or team_2 = :team", team: current_user.team)

    @other_matches = Match.where("played_at >= ?", Time.current)
                          .order(:played_at)
                          .limit(2)
    @attendances = current_user.attendances.includes(:event)
  end
end
