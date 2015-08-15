# Homepage (Root path)
helpers do
  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  #Method will return percentage of your purchase compared to your expense, as well as the interval
  # it corresponds to based upon user experience.    
  def get_tt_values(expense_tt, expense_value, expense_interval)
    tt = expense_tt.to_f
    value = expense_value.to_f
    interval = expense_interval.downcase
    result = 0
    temp = {
      annual: 365,
      monthly: 30,
      biweekly: 14,
      weekly: 7,
      daily: 1,
      once: 1
    }
    daily_value = tt/(value/temp[interval.to_sym])
    values = {
      annual: (daily_value/365)*100,
      monthly: (daily_value/30)*100,
      biweekly: (daily_value/14)*100,
      weekly: (daily_value/7)*100,
      daily: (daily_value/1)*100,
    }
    #psychological preferences
    values.each do |interv, percentage|
      if percentage >= 40 && percentage <= 60
        result = percentage
        interval = interv
        break
      elsif percentage >= 25 && percentage < 40
        result = percentage
        interval = interv
        break
      elsif percentage <25 && percentage > 10  
        result = percentage
        interval = interv
        break
      else
        result = percentage
        interval = interv
      end
    end  
    if expense_interval == 'Once'
      interval = ""
      result = (tt * 100) / expense_value.to_f
    end  
    [result.round(1),interval]
  end
end

get '/', '/index', '/home','/main' do
  erb :'home'
end

#Fake login for demo purposes
get '/login' do
  @user = User.find(1)
  session[:user_id] = @user.id
  redirect :'home'
end

get '/logout' do
  @user = nil
  session.clear
  redirect :'home'
end

get '/expenses' do
  @expenses = Expense.where(user_id: current_user.id) if current_user
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

post '/think-twice/' do
  @expenses = Expense.where(user_id: current_user.id) if current_user
  if params[:amount].to_i > 0
    @tt = params[:amount].to_f
    erb :'/results'
  else
    redirect '/'
  end
end