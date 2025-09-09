class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def new
  end

  def create
  end
end
