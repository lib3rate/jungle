class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_LOGIN'], password: ENV['ADMIN_PASSWORD']

  def index
  end

  def new
  end

  def create
  end
end
