class FensController < ApplicationController

  def show

    @fen_hsh = {}

    game = Game.find(params[:game_id])

    # if params[:fen] && params[:fen] != "" #&& params[:fen] =~ /\d+/
    hsh_i = 1
    build_fen = PGN.parse("[Dummy \"Tag\"]" + game[:pgn]).first
    build_fen.positions.delete_at(0)
    build_fen.positions.each_with_index do |pos, index|

      if index % 2 == 0 #even
        @fen_hsh[hsh_i] = [pos.to_fen.to_s]
      elsif index %2 == 1
        @fen_hsh[hsh_i].push(pos.to_fen.to_s)
        hsh_i +=1
      end

    end

    # end

    respond_to do |format|

      format.json { render json: @fen_hsh }

    end

  end

end