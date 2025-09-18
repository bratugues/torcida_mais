class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :dashboard ]

  def home
    redirect_to dashboard_path if user_signed_in?
  end

  def about
  end

  def dashboard
    my_club = current_user.club

    if my_club
      @my_matches = Match.where("home_team_id = :club_id OR away_team_id = :club_id", club_id: my_club.id).limit(2)
    else
      @my_matches = Match.none
    end

    @other_matches = Match.where("played_at >= ?", Time.current)
                          .where.not(home_team_id: my_club&.id)
                          .where.not(away_team_id: my_club&.id)
                          .includes(:home_team, :away_team)
                          .order(:played_at)
                          .limit(5)

    @attendances = current_user.attendances.includes(:event)
  end
end
