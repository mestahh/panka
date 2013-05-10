class StatisticsController < ApplicationController
  
  def new
    @statistic = Statistic.new
  end
  
  def create
    @stat = Statistic.new(params[:statistic])
    @stat.save
    redirect_to guest_path(:id => params[:statistic][:guest_id])
  end
end
