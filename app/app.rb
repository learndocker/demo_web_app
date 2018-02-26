class App < Sinatra::Base
  get '/' do
    Request.create!(ip: request.ip, host: Socket.gethostname, path: request.path, timestamp: Time.now)
    erb :index, locals: { requests: Request.all.order(timestamp: :desc).limit(25) }
  end
end
