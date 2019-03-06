class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
    @lines = Line.all
  end
end
