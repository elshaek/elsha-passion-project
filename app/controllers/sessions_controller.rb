# Login page
get '/login' do
  if logged_in?
    redirect "/users/#{current_user.id}"
  else
    erb:'sessions/new'
  end
end

# Request to login, redirect to user profile
post '/login' do
  @is_user = User.authenticate(params[:email], params[:password])
  if @is_user
    login(@user)

    redirect "users/#{@user.id}"
  else
    redirect '/login'
  end
end

# Request to logout, redirect to home page
delete '/logout' do
  logout
  redirect '/'
end

get '/logout' do
  logout
  redirect '/'
end