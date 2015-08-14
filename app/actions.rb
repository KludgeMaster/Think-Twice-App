# Homepage (Root path)
helpers do
  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end
end

get '/', '/index', '/home','/main' do
  erb :'home'
end

get '/login' do
  @user = User.first
  session[:user_id] = @user.id
  redirect :'home'
end

get '/logout' do
  @user = nil
  session.clear
  redirect :'home'
end

get '/expenses' do
  current_user
    @expenses = Expense.where(user_id: current_user.id)
  erb :expenses
end

post '/expenses/add' do
  @expense = Expense.new(
    user_id: current_user.id,
    name: params[:name],
    value: params[:value].to_i,
    interval: params[:interval]
  )
  @expense.save
  redirect '/expenses'
end

post '/expenses/delete/:id' do
  Expense.find(params[:id]).destroy
  redirect '/expenses'
end

post '/user_input' do
  if current_user
    @expenses = Expense.where(user_id: current_user.id)
  else
    @expenses = Expense.where(user_id: 0)
 end
  if params[:amount].to_i > 0
    @tt = params[:amount]
    erb :'/results'
  else
    redirect '/'
  end
end