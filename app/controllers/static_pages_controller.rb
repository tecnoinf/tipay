class StaticPagesController < ApplicationController
  def home
  end
  
  def contactenos
  end
  
  def about
  end
  
  def egresados
  end
  
  def admin
    if !current_user 
        #flash.now[:error] = 'Acceso no permitido'
        redirect_to root_path, alert: 'Acceso Restringido.'
    elsif current_user.role!=1
        #flash.now[:error] = 'Acceso no permitido2'
        redirect_to root_path, alert: 'Acceso Restringido.'
    end
  end
end
