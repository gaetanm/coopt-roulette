class JobOffersController < ApplicationController
  def random
    @recommendation = Recommendation.new
    @job_offer = JobOffer.random
  end
end