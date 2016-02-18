class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

   def create
    team = Team.create(team_params)
    render json: team
  end

  def destroy
    Team.find(params[:id]).destroy
    render json: Team.all.order(:created_at)
  end

  private
    def team_params
      params.require(:team).permit(:name)
    end
end
