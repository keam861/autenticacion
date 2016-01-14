get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

get '/destroy_session' do
  session.clear
  redirect('/')
end


post '/create_session' do

  email = params[:email]
  password = params[:password]
  # puts "+" * 30
  # p email
  user = User.authenticate(email, password)
  # puts "+" * 30
  # p @user
  if user #Save to database
    session[:user_id] = user.id
    # puts "<" * 100
    # puts "Welcome to sigin"
    erb :app

  else
    #@errors = @user.errors
    erb :signup
  end
end

