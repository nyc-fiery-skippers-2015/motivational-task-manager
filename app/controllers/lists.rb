require 'pry'


#make new list route
get '/users/:id/lists/new' do
  require_logged_in
  current_user = User.find_by(id: params[:id])
  erb :'/lists/new', locals: {user: current_user}
end

post '/users/:id/lists/new' do
  current_user = User.find_by(id: params[:id])
  new_list = List.new(title: params[:list][:title], url: List.custom_url, author_id: current_user.id)
  return [500, "Invalid List"] unless new_list.save
  redirect "/users/#{current_user.id}"
end

put '/users/:id/list/edit' do
  current_user = User.find_by(id: params[:id])
  list_id = current_user.lists.map { |i| i.id }.first
  new_task = Task.new(title: params[:task][:title], description: params[:task][:description], list_id: list_id )
  new_task.save
  redirect "/users/#{current_user.id}"
end
