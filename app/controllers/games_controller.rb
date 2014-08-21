class GamesController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    @game = Game.new
  end

  def create

    pgn = params[:full_pgn]

    if pgn == ""
      flash[:notice] = "The PGN can not be blank!"
      redirect '/create_game'
    end

    pgn.gsub!(/\u201c/, "\"")
    pgn.gsub!(/\u201d/, "\"")
    pgn.gsub!(/\r/, "")
    pgn.gsub!(/\n/, " ")
    # pgn.gsub!(/{.*?}/, "") #removes annotation comments
    pgn.gsub!(/\$\d+\s/, "") #removes NAG
    pgn.gsub!(/0-0/, "O-O")
    pgn.gsub!(/0-0-0/, "O-O-O")

    begin
      game = PGN.parse(pgn).first
    rescue
      flash[:notice] = "The PGN file could not be parsed! Comments cannot be parsed at this time. Please check your formatting."
      redirect '/create_game'
    end

    pgn.gsub!(/\]\s+1/, "]\n1")
    pgn = pgn.scan(/^1\.\D.*$/).first

    @game = Game.new(user_id: session[:user_id], event: game.tags["Event"], site: game.tags["Site"], date: game.tags["Date"], round: game.tags["Round"], white: game.tags["White"], black: game.tags["Black"], result: game.tags["Result"], pgn: pgn)

    @game.save

    redirect_to '/'


  end

end