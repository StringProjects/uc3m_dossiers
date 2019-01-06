class DossiersController < ApplicationController

  def index
    @dossiers = Dossier.all
  end

  def show
    @custom_class = 'detail'
    @dossier = Dossier.find(params[:id])
  end
  
end
