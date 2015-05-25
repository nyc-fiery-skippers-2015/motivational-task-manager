





>>>>>>> updates_to_delete_features_and_time

post '/comments' do
  new_comment = Comment.new(params[:comment])
  return [500, "Invaild User"] unless new_comment.save
  redirect "/users/#{new_comment.author_id}"
end


delete '/comments/:user_id/:comment_id/delete' do
  if session[:user_id] == params[:user_id]
    comment = Comment.find_by(id: params[:comment_id] )
    user_id = params[:user_id]
    comment.destroy
    redirect "/users/#{user_id}"
  end
end
