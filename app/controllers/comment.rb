
get '/posts/:id/comments' do
  @the_post = Post.find_by(id: params[:id])
  erb :"comment/index"
end

get '/posts/:id/comments/new' do
  @the_post = Post.find_by(id: params[:id])
  if session[:user_id]
    erb :"comment/new", layout: false
  else
    "Sorry, only AirbnL members can add comments"
  end
end

get '/posts/:id/comments/:commentid/edit' do
  @the_post = Post.find_by(id: params[:id])
  @the_comment = Comment.find_by(id: params[:commentid], post_id: @the_post.id)
  if @the_comment.user_id == session[:user_id]
    erb :"comment/edit"
  else
    "Sorry, you can only edit your own comments!"
  end
end

put '/posts/:id/comments/:commentid' do
  @the_post = Post.find_by(id: params[:id])
  @the_comment = Comment.find_by(id: params[:commentid], post_id: @the_post.id)
  if @the_comment
    @the_comment.description = params[:description]
    if @the_comment.save!
      redirect "/posts/#{@the_post.id}"
    else
      [500, "There was a problem with your update"]
    end
  else
    [404, "We couldn't update your comment"]
  end
end

post '/posts/:id/comments' do
  @the_post = Post.find_by(id: params[:id])
  @new_comment = Comment.new(description: params[:description], post_id: @the_post.id, user_id: session[:user_id])

  if @new_comment.save!
    erb :"_addcomment", layout: false
    # redirect "/posts/#{@the_post.id}"
  else
    [404, "Your comment couldn't be added."]
  end
end


delete '/posts/:id/comments/:commentid/delete' do
  @the_post = Post.find_by(id: params[:id])
  @the_comment = Comment.find_by(id: params[:commentid], post_id: @the_post.id)
  if @the_comment.user_id == session[:user_id]
    @the_comment.destroy!
  else
    "Sorry, you can only delete your own comments!"
  end
  redirect "/posts/#{@the_post.id}"
end