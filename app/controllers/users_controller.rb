class UsersController < ApplicationController
    
    def index
        if !current_user 
            #flash.now[:error] = 'Acceso no permitido'
            redirect_to root_path, alert: 'Acceso Restringido.'
        elsif current_user.role!=1
            #flash.now[:error] = 'Acceso no permitido2'
            redirect_to root_path, alert: 'Acceso Restringido.'
        end
        
        if params[:approved] == "false"
            #@users = User.find_by_approved(false)
            @users = User.where(approved: false)
        else
            @users = User.all
        end
        
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def edit
        if !current_user 
            #flash.now[:error] = 'Acceso no permitido'
            redirect_to root_path, alert: 'Acceso Restringido.'
        elsif current_user.role!=1
            #flash.now[:error] = 'Acceso no permitido2'
            redirect_to root_path, alert: 'Acceso Restringido.'
        end
        @user = User.find(params[:id])
    end
    
    def update 
      @user = User.find(params[:id]) 
      if @user.update(user_param)
         redirect_to user_url(@user.id), :flash => { :success => "Usuario modificado correctamente" }
      else
        redirect_to user_url(@user.id), :error => { :error => "No se ha podido editar el usuario" }
      end
    end
    
    def destroy
        @user = User.find(params[:id])
        if @user.destroy
                redirect_to user_url(current_user.id), :flash => { :success => "Usuario Borrado Satisfactoriamente" }
        end
    end
    
    
    protected
    def update_resource(resource, params)
        resource.update_without_password(params)
    end
    
    private
    def user_param
        params.require(:user).permit(:name, :last_name,:approved)
    end
    
    private
    def admin
    end

end
