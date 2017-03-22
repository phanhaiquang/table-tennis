class CupPlayersController < ApplicationController
  before_action :set_cup_player, only: [:show, :edit, :update, :destroy]

  # GET /cup_players
  # GET /cup_players.json
  def index
    @cup_players = CupPlayer.all
  end

  # GET /cup_players/1
  # GET /cup_players/1.json
  def show
  end

  # GET /cup_players/new
  def new
    @cup_player = CupPlayer.new
  end

  # GET /cup_players/1/edit
  def edit
  end

  # POST /cup_players
  # POST /cup_players.json
  def create
    @cup_player = CupPlayer.new(cup_player_params)

    respond_to do |format|
      if @cup_player.save
        format.html { redirect_to @cup_player, notice: 'Cup player was successfully created.' }
        format.json { render :show, status: :created, location: @cup_player }
      else
        format.html { render :new }
        format.json { render json: @cup_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cup_players/1
  # PATCH/PUT /cup_players/1.json
  def update
    respond_to do |format|
      if @cup_player.update(cup_player_params)
        format.html { redirect_to @cup_player, notice: 'Cup player was successfully updated.' }
        format.json { render :show, status: :ok, location: @cup_player }
      else
        format.html { render :edit }
        format.json { render json: @cup_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cup_players/1
  # DELETE /cup_players/1.json
  def destroy
    @cup_player.destroy
    respond_to do |format|
      format.html { redirect_to cup_players_url, notice: 'Cup player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cup_player
      @cup_player = CupPlayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cup_player_params
      params.require(:cup_player).permit(:cup_id, :player_id, :score)
    end
end
