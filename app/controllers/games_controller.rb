class GamesController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    @game = Game.new
  end

  def create

    pgn = params[:full_pgn]

    @user = User.find(session[:user_id])

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
      @game = Game.new
      @game.errors[:pgn] = "text could not be parsed! Please check your formatting."

      render :new
      return
    end

    if game == [] || game == nil
      @game = Game.new
      @game.errors[:pgn] = "text could not be parsed! Please check your formatting."

      render :new
      return
    end

    pgn.gsub!(/\]\s+1/, "]\n1")
    pgn = pgn.scan(/^1\.\D.*$/).first

    game_list_id = User.find(session[:user_id]).game_lists.where(title: "My Games").first.id

    @game = Game.new(user_id: session[:user_id], game_list_id: game_list_id, event: game.tags["Event"], site: game.tags["Site"], date: game.tags["Date"], round: game.tags["Round"], white: game.tags["White"], black: game.tags["Black"], result: game.tags["Result"], pgn: pgn)

    if @game.save

      redirect_to '/'

    else

      render :new

    end


  end


  def show
    @user = User.find(session[:user_id])


    # p params
    @game = Game.find(params[:id])

  end

end