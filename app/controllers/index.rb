get '/' do
  @notice = params[:notice] if params[:notice] 
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end


