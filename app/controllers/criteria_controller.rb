class CriteriaController < ApplicationController
  def index
  	@criteria = Criterion.all
  end

  def new
  	@criterion= Criterion.new
  end

  def create
  	criterion = Criterion.new(
  		params.require(:criterion).permit(:text, :importance, :decision_id)
  		)
  	if criterion.save
	  	redirect_to criteria_path
  	end
  end

  def destroy
  	Criterion.find(params[:id]).destroy
  	redirect_to criteria_path
  end
end
