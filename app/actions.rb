# Homepage (Root path)
helpers do
  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end
  def all_songs
    @songs = Song.all
  end
end

get '/' do
  erb :index
end

get '/expenses' do
  @expenses = Expense.find_by(user: current_user)
  erb :expenses
end

post '/input' do
  if input.is_i? && input > 0
    redirect '/result'
  else
    redirect '/'
  end
end


post 'expenses/add' do
  @expense = Expenses.new(
    name: params[:name],
    value: params[:value],
    interval: params[:interval]
  )
  @expense.save
  redirect '/expenses'
end

post 'expenses/delete/:id' do
  Expenses.find(:id).destroy
  redirect '/expenses'
end
