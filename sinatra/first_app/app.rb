# requiring the sinatra gem
require "sinatra"
require "pony"
require "data_mapper"

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/contactor.db")

use Rack::MethodOverride

enable :sessions

class Contact
  # Enabled DataMapper features for our class
  include DataMapper::Resource

  # Serial is for primary key with autoincrement
  property :id,         Serial
  property :first_name, String
  property :last_name,  String
  property :email,      String
  property :department, String
  property :urgent,     Boolean
  property :category,   String
  property :message,    Text

end

DataMapper.finalize

Contact.auto_upgrade!

helpers do
  def protected!
    return if authorized?
    headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
    halt 401, "Not authorized\n"
  end

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == ['admin', 'admin']
  end
end


# Get request to the home page of the application
get "/" do
  @show_alert = params[:show_alert]

  # session[:counter] = 0 unless session[:counter]
  session[:counter] ||= 0

  session[:counter] += 1

  # renders a file called index.erb inside views folder
  erb :index, layout: :default
end

get "/hello" do
  "Hello CodeCore"
end

get "/all" do
  protected!
  # Fetches all the contacts from the Database
  @contacts = Contact.all
  erb :all, layout: :default
end

get "/color_pick/:color" do |color|
  session[:color] = color
  redirect back
end

get "/contact/:id" do |id|
  protected!
  @contact = Contact.get id
  session[:last_visited_user_name] = @contact.first_name
  erb :contact_show, layout: :default
end

delete "/contact/:id" do |id|
  protected!
  contact = Contact.get id
  contact.destroy
  redirect to("/all")
end

get "/hello/:name" do |name|
  @name = name
  erb :hello_visitor, layout: :default
end

get "/contact" do
  erb :contact, layout: :default
end

post "/submit_contact" do

  puts ">>>>>>>>>>> #{params[:urgent]}"


  subject = "category: #{params[:category]} | department: #{params[:department]}
            urget: #{params[:urgent]} | name: #{params[:first_name]} #{params[:last_name]}"

  urgent_value = (params[:urgent] == "on")
  Contact.create(first_name: params[:first_name],
                 last_name:  params[:last_name],
                 email:      params[:email],
                 category:   params[:category],
                 department: params[:department],
                 message:    params[:message],
                 urgent:     urgent_value)

  Pony.mail(to: "tam@codecore.ca",
            reply_to: params[:email],
            subject: subject,
            body: params[:message],
            via: :smtp,
            via_options: {
              address: "smtp.gmail.com",
              port:    "587",
              user_name: "answerawesome",
              password: "Sup3r$ecret",
              authentication: :plain,
              domain: "localhost",
              enable_starttls_auto: true
            })


  redirect to("/?show_alert=true")
end

get "/personality_test" do
  erb :personality_test, layout: :default
end

post "/personality_test" do
  # params for each Radio button set
  # it uses the name parameters
  work_best     = params[:work_best]
  consideration = params[:consideration]
  interest      = params[:interest]

  if work_best == "with" && consideration == "rational" && interest == "ideas"
    "You Are: Rational"
  elsif work_best == "with" && consideration == "rational" && interest == "facts"
    "You are: Guardian"
  else
    "Coming soon."
  end
end

# Remaining Combinations

# Without deadline | Rational  | Ideas > Rational
# Without deadline | Rational  | Facts > Artisan


# With deadline | Compassionate  | Ideas > Idealist
# With deadline | Compassionate  | Facts > Guardian

# Without deadline | Compassionate  | Ideas > Idealist
# Without deadline | Compassionate  | Facts > Artisan




