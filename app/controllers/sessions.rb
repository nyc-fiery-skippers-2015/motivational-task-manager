get '/' do
  erb :index
end

#Get Sign-In Form
get '/login' do
  erb :'/sessions/signin'
end

#Get Sign-Up Form
get '/signup' do
  erb :'/users/new'
end

#Log User In
post '/session' do
  cur_user = User.find_by(email: params[:user][:email])
  return [500, "No Email Found"] unless cur_user
  if cur_user.authenticate(params[:user][:password])
      session[:user_id] = cur_user.id
      redirect "/users/#{cur_user.id}"
  else
      redirect "/login?error=uaa"
  end
end

get '/session/user' do
  if session[:user_id]
    cur_user = User.find(session[:user_id])
    return [200, "You're logged in as #{cur_user.name}"]
  else
    return [403, "Unauthorized Access"]
  end
end

#Log User Out
post '/session/logout' do
  session[:user_id] = nil
  redirect '/'
end
