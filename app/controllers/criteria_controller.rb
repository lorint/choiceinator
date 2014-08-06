class CriteriaController < ApplicationController
  before_action :get_decision, :check_security

  def index
  	@criteria = @decision.criteria
  end

  def new
  	@criterion= Criterion.new
  end

  def create
  	criterion = Criterion.new(
  		params.require(:criterion).permit(:text, :importance)
  		)
    # Attach this criterion to a decision
    criterion.decision = @decision
  	if criterion.save
	  	redirect_to decision_criteria_path(@decision.id)
  	end
  end

  def destroy
  	Criterion.find(params[:id]).destroy
  	redirect_to decision_criteria_path(@decision.id)
  end

private
  def get_decision
    # Find our parent decision that we should attach to
    @decision = Decision.find(params[:decision_id])
  end

  def check_security
    # If they're not logged in or they don't own this decision, boot them to the home page
    if (!current_user) || (@decision.user != current_user)
      redirect_to home_path
    end
  end
end

