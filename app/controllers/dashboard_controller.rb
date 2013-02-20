class DashboardController < ApplicationController
  def index
    @group = Group.all.last
  end
end
