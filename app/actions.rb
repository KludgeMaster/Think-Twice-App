# Homepage (Root path)
helpers do
  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end
end

get '/', '/index', '/home','/main' do
  unless current_user
    @user = User.find(1)
    session[:user_id] = @user.id
  end
  erb :'home'
end

get '/expenses' do
  @expenses = Expense.where(user_id: 1)
  erb :expenses
end

post '/expenses/add' do
  @expense = Expense.new(
    user_id: 1,
    name: params[:name],
    value: params[:value].to_i,
    interval: params[:interval]
  )
  @expense.save
  redirect '/expenses'
end

post '/expenses/delete/:id' do
  binding.pry
  Expense.find(params[:id]).destroy
  redirect '/expenses'
end

post '/think-twice/' do
  @expenses = Expense.where(user_id: 1)
  if params[:amount].to_i > 0
    @tt = params[:amount]
    erb :'/results'
  else
    redirect '/'
  end
end