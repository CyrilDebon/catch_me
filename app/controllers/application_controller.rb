class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  set_callback :logging_in_user, :before do
    guest_user.favorites.each do |favorite|
      favorite.user = current_user
      favorite.save
    end
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

end
