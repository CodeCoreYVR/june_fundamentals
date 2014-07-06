# requiring the sinatra gem
require "sinatra"
require "pony"
require "data_mapper"

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/contactor.db")

class Contact
  # Enabled DataMapper features for our class
  include DataMapper::Resource

  # Serial is for primary key with autoincrement
  property :id,         Serial
  property :first_name, String
  property :last_name,  String
  property :email,      String
  property :department, String
  property :urget,      Boolean
  property :category,   String
  property :message,    Text

end

DataMapper.finalize

Contact.auto_upgrade!


# Get request to the home page of the application
get "/" do
  # renders a file called index.erb inside views folder
  erb :index, layout: :default
end

get "/hello" do
  "Hello CodeCore"
end

get "/hello/:name" do |name|
  @name = name
  erb :hello_visitor, layout: :default
end

get "/contact" do
  erb :contact, layout: :default
end

post "/submit_contact" do
 
  subject = "category: #{params[:category]} | department: #{params[:department]}
            urget: #{params[:urgent]} | name: #{params[:first_name]} #{params[:last_name]}"

  Pony.mail(to: "tam@codecore.ca",
            reply_to: params[:email],
            subject: subject,
            body: params[:message],
            via: :smtp,
            via_options: {
              address: "smtp.gmail.com",
              port:    "587",
              user_name: "user name here",
              password: "password here",
              authentication: :plain,
              domain: "localhost",
              enable_starttls_auto: true
            })


  "Thank you for contacting us"
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




