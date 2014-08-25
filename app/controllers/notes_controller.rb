class NotesController < ApplicationController

  def create

    # puts "here"
    # p params
    @note = Note.new(user_id: params[:user_id], game_id: params[:game_id], note: params[:note][:note])

    if @note.save
      redirect_to :back
    else
      render 'games/show'
    end

  end

  def update

    puts "here"
    p params[:note][:note]
    p params[:game_id]


    Game.find(game_id: params[:game_id]).note.update(note: params[:note][:note])

    redirect_to :back
  end


end