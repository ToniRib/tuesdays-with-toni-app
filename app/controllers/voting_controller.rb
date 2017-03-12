class VotingController < ApplicationController
  def index
    session[:forwarding_url] = request.url
  end
end
