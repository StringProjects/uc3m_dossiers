class DossiersController < ApplicationController

  def index
    @dossiers = Dossier.all
  end
  
end
