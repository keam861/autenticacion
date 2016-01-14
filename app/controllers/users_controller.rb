get '/signup' do
  
  erb :signup
end

get '/delete_user/:user_id' do
  user = User.find(params[:user_id])
  user.destroy
  @notice = "Usuario exitosamente borrado"
  redirect("/?notice=#{@notice}")
  # puts "p" * 50
  # p user
end

get '/update_user' do

  erb :edit
end

post '/update_user/:user_id' do
  user = User.find(params[:user_id])
  user.update(name: params[:user][:name], gender: params[:user][:gender], age: params[:user][:age], email: params[:user][:email], password_digest: params[:user][:password])
  
  # name = params[:user][:name]
  # puts name
  # puts "p" * 100
  # p user
  erb :app
end


post '/create_user' do
  # email = params[:user][:email]

  user = params[:user]
  # TEST in Console
  # puts "+" * 30 
  # p user
  @user = User.new(params[:user]) #Insert data into database
  if @user.save #Save to database
    session[:user_id] = @user.id
    # puts ">" * 50
    # puts "Welcome"
    erb :app
  else
    #@errors = @user.errors
    erb :signup 
  end
end