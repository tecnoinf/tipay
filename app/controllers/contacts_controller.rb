class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Gracias por el mensaje. Nos comunicaremos a la brevedad'
    else
      flash.now[:error] = 'No se pudo enviar el mensaje.'
      render :new
    end
  end
end

