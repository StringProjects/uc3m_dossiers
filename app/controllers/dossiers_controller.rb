class DossiersController < ApplicationController

  def index
    @dossiers = Dossier.all
  end

  def show
    @dossier = Dossier.find(params[:id])
  end
  
end
