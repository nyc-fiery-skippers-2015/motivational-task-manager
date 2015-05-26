get '/users' do
  all_users = User.all
  erb :'users/index', locals: {users: all_users}
end

get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
  require_logged_in
  #ZM: Use the current_user helper
  current_user = User.find_by(id: params[:id])
  user_list = current_user.lists
  return [500, "No User Found"] unless current_user
  erb :'users/_show', locals: {user: current_user, list: user_list }
end

post '/users' do
  new_user = User.new(params[:user])
  return [500, "Invaild User"] unless new_user.save
  session[:user_id] = new_user.id
  redirect "/users/#{new_user.id}"
end

get '/users/:id/edit' do
  current_user = User.find_by(id: params[:id])
  #ZM: Remove the p statements from your code. 
  p current_user
  return [500, "No User Found"] unless current_user
  erb :'users/edit', locals: {user: current_user}
end

put '/users/:id' do
  current_user = User.find_by(id: params[:id])
  return [500, "No User Found"] unless current_user
  return [500, "User Could not Save"] unless current_user.update(params[:user])
  redirect "/users/#{current_user.id}"
end

delete '/users/:id' do
  current_user = User.find_by(id: params[:id])
  return [500, "No User Found"] unless current_user
  current_user.destroy
  redirect "/"
end
