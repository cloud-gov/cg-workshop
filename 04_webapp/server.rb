require 'sinatra'

get '/' do
  %q{
    <h1>Hello World from Sinatra!</h1>
    <form method="post">
      Enter your name: <input type="text" name="name" />
      <input type="submit" value="Go!" />
    </form>
  }
end

post "/" do
  %Q{
    <h1>Hello #{params[:name]}</h1>
    <p><a href="/">Return home</a>
  }
end