class HomeController < ApplicationController
  before_action :require_login, except: [:welcome]
  def welcome
  end
end
