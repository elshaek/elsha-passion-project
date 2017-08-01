# Create a new user
get '/users/new' do
  erb:'users/new.html'
end

# Register a new user
post '/users' do
  @user = User.new({username: params[:username], email: params[:email]})
  @user.password = params[:password]

  if @user.save
    login(@user)
    redirect "users/#{@user.id}"
  else
    redirect "/users/new"
  end
end

# User Profile page
get '/users/:id' do
  @user = User.find(params[:id])
  erb:'users/show.html'
end


# if request.xhr?

#   content_type :json
#   {id: user_id}.to_json
# else

# end