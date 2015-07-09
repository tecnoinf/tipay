class PrincipalController < ApplicationController
  def index
    @eventos= Evento.all
  end
end
