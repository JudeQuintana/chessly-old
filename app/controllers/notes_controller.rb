class NotesController < ApplicationController

  def update

    Game.find(params[:game_id]).update(notes: params[:notes])

    render nothing: true
  end


end