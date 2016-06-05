require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, escape_html: true
end

helpers do
  def hide_card(card)
    first_four_numbers = card[0..3]
    "#{first_four_numbers}-****-****-****"
  end
end

before do
  session[:payments] ||= []
end

get '/' do
  erb :payments_create
end

get '/payments/create' do
  erb :payments_create
end

get '/payments/show' do
  @payments = session[:payments]
  erb :payments_show
end

post '/payments/show' do
  card_number = params[:card_number].strip

  if error = error_for_card_number(card_number)
    session[:message] = error
    erb :payments_create
  elsif error = error_for_field(params[:first_name], 'First name') ||
      error = error_for_field(params[:last_name], 'Last name') ||
      error = error_for_field(params[:exp], 'Expiry Date') ||
      error = error_for_field(params[:ccv], 'CCV')
    session[:message] = error
    erb :payments_create
  else
    full_name = get_full_name(params[:first_name], params[:last_name])
    expiry_date = params[:exp]
    created = Time.now

    session[:payments] << { full_name: full_name, created: created, card_number: card_number, exp: expiry_date }

    @payments = session[:payments]
    session[:message] = 'Thank you for your payment'
    erb :payments_show
  end
end

def get_full_name(first_name, last_name)
  first_name + ' ' + last_name
end

def error_for_card_number(card)
  if card.length != 16
    'Card number invalid, please enter 16 digits without spaces or formatting'
  end
end

def error_for_field(field, field_type)
  "#{field_type} is invalid" if field.strip.empty?
end
