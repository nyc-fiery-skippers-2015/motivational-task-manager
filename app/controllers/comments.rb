
# lass CreateComments < ActiveRecord::Migration
#   def change
#     create_table :comments do |t|
#       t.string :body, null: false
#       t.belongs_to :task, null: false
#       t.integer :author_id, index: true
#       t.string :name, default: 'Anonymous'

#       t.timestamps null: false
#     end





get '/comments/new' do

  erb :'comments/new'
end

post '/comments' do
  new_comment = Comment.new(params[:comment])
  return [500, "Invaild User"] unless new_comment.save
  redirect "/users/#{new_comment.author_id}"
end
