class EventoController < ApplicationController
     Ruta_directorio_archivos = "public/archivos/";
     def listar
     @eventos = Evento.all
     end
     
     def nuevo
     @fecha = params[:dato1]
     session[:fecha]=@fecha
     @evento = Evento.new
     end
     
     def crear
     
     if request.post?
      @mostrar = "Algo"
      @archivo = params[:archivo]
      if @archivo.nil?
      @nombre = "vacio";
      else
           #Archivo subido por el usuario.
       archivo = params[:archivo];
      #Nombre original del archivo.
      @nombre = archivo.original_filename;
      nombre = archivo.original_filename;
               #render plain: @nombre.inspect
      #Directorio donde se va a guardar.
       directorio = Ruta_directorio_archivos;
      #Extensión del archivo.
       extension = nombre.slice(nombre.rindex("."), nombre.length).downcase;
      #Verifica que el archivo tenga una extensión correcta.
    #   if extension == ".pdf" or extension == ".doc" or extension == ".docx" or extension == ".jpg"
         #Ruta del archivo.
          path = File.join(directorio, nombre);
         #Crea el archivo en el directorio. Guardamos el resultado en una variable, será true si el archivo se ha guardado correctamente.
          resultado = File.open(path, "wb") { |f| f.write(archivo.read) };
         #Verifica si el archivo se subió correctamente.
          if resultado
             subir_archivo = "ok";
          else
             subir_archivo = "error";
          end
           end      # end
           @hora=params[:inicio]
           @inicio = @hora['mostrar(4i)']+':'+@hora['mostrar(5i)']
      @datos = {
          :titulo => params[:titulo],
          :cuerpo => params[:cuerpo],
         :fecha => params[:fecha],
           :inicio => @inicio,
           :archivo => @nombre
      };
      @evento = Evento.new(@datos)
       if @evento.save
           redirect_to principal_index_path
        else
         @mensaje="Problemas al ingresar el evento"
       end
      end
       session[:fecha]=nil
     end
     
     def eliminar
     
     end
     
     def mostrar
      @evento = Evento.find(params[:id])
   # render plain: @evento.inspect
    # redirect_to evento_verevento_path
     # if request.post?
    # @fecha = params[:dato1]
    # session[:fecha]=@fecha
    # redirect_to evento_nuevo_path() 
     #end
    end
end
