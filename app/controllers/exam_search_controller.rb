class ExamSearchController < ApplicationController
  
  def search
    from = params[:from_date]
    to = params[:to_date]
    @examinations = Examination.where(["created_at < ? and created_at > ?", to, from])
  end
end

