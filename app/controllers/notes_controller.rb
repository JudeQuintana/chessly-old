class NotesController < ApplicationController

  def create

    @note = Note.new(user_id: params[:user_id], game_id: params[:game_id], note: params[:note][:note])

    if @note.save
      redirect_to :back
    else
      render 'games/show'
    end

  end

  def update

    Game.find(params[:game_id]).note.update(note: params[:note][:note])

    redirect_to :back
  end


end