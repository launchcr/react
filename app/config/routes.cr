Launch::Server.configure do
  pipeline :web do
    # Plug is the method to use connect a pipe (middleware)
    # A plug accepts an instance of HTTP::Handler
    # plug Launch::Pipe::PoweredByLaunch.new
    # plug Launch::Pipe::ClientIp.new(["X-Forwarded-For"])
    plug Citrine::I18n::Handler.new
    plug Launch::Pipe::Error.new
    plug Launch::Pipe::Logger.new
    plug Launch::Pipe::Session.new
    plug Launch::Pipe::Flash.new
    # plug Launch::Pipe::CSRF.new
  end

  pipeline :api do
    # plug Launch::Pipe::PoweredByLaunch.new
    plug Launch::Pipe::Error.new
    plug Launch::Pipe::Logger.new
    plug Launch::Pipe::Session.new
    plug Launch::Pipe::CORS.new
  end

  # All static content will run these transformations
  pipeline :static do
    # plug Launch::Pipe::PoweredByLaunch.new
    plug Launch::Pipe::Error.new
    plug Launch::Pipe::Static.new("./public")
  end

  routes :web do
    {{ run("../generate_routes") }}
  end

  routes :api, "/api" do
  end

  routes :static do
    # Each route is defined as follow
    # verb resource : String, controller : Symbol, action : Symbol
    get "/*", Launch::Controller::Static, :index
  end
end
