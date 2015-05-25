
get '/comments/new' do
  erb :'comments/new'
end

post '/comments' do
  new_comment = Comment.new(params[:comment])

  return [500, "Invaild User"] unless new_comment.save
  redirect "/users/#{new_comment.author_id}/lists/#{new_comment.task.list.url}"

end
