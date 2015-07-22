class RecommendationsController < ApplicationController
  def create
    @recommendation = Recommendation.new recommendation_params
    if @recommendation.valid?
      flash[:info] = 'Recommendation sucessfuly sent.'
      redirect_to root_path
    else
      @job_offer = JobOffer.find(recommendation_params[:job_offer_id].to_i)
      render 'job_offers/random'
    end
  end

  private
    def recommendation_params
      params.require(:recommendation).permit(:male, :email, :first_name, :last_name, 
        :phone, :company, :job_title, :linkedin_url, :job_offer_id)
    end
end