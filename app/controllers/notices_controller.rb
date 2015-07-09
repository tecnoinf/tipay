class NoticesController < ApplicationController

    before_filter :authorize_admin, only: [:new,:create]
    #los usuarios puede ver solo si estan logueados
    #before_filter :authenticate_user! #, only: [:show, :index]
    
    def index
        #@notices = Notice.all
        @notices = Notice.order('created_at DESC').page(params[:page]).per(15)
    end
    
    def show
        @notice = Notice.find(params[:id])
    end
    
    def new
        @notice = Notice.new
    end
    
    def create
        @user = current_user
        @notice = Notice.new(allowed_params)
    
        if @notice.save
            flash[:success] = "Created new notice"
            redirect_to @notice
        else
            render 'new'
        end
    end
    
    private
        def allowed_params
            params.require(:notice).permit(:title, :body)
        end
end

