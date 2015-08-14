# Homepage (Root path)
helpers do
  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  #for enumerables
  def make_error_message(errors)
    message = "Some issues: "
      if errors.is_a?(Array)
        message << errors.join(", ") << "."
      else
        message << errors.full_messages.join(", ") <<"."
      end
  end

  def get_tt_values(expense_tt, expense_value, expense_interval)
    tt = expense_tt.to_f
    value = expense_value.to_f
    interval = expense_interval.downcase
    result = 0
    times = nil
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
      # once: (daily_value/1)*100
    }
    values.each do |interv, percentage|
      if percentage >= 40 && percentage <= 60
        result = percentage
        interval = interv
        break
      elsif percentage >= 25 && percentage < 40
        result = percentage
        interval = interv
      elsif percentage <25 && percentage > 10  
        result = percentage
        interval = interv
      elsif percentage >= 200 && percentage <= 300 
        result = percentage
        interval = interv
      elsif percentage < 100
        result = percentage
        interval = interv
      else
        result = percentage
        interval = interv
      end
    end  
    if expense_interval == 'Once'
      interval = ""
      result = (tt * 100) / expense_value.to_f
    end  
    [result.round(1),interval,times]
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
    value: params[:value].to_f,
    interval: params[:interval]
  )

  if @expense.save
    flash[:success] = "#{@expense.name} added!"
  else
    flash[:errors] = make_error_message(@expense.errors)
  end
  
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
    flash[:errors] = "Sorry but we need a number greater than 0..."
    redirect '/'
  end
end