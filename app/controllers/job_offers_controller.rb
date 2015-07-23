class JobOffersController < ApplicationController
  def random
    @recommendation = Recommendation.new
    @job_offer = JobOffer.random

    session[:checked_offers] = Array.new if !session.has_key? :checked_offers

    if !session[:checked_offers].include? @job_offer.id
      session[:checked_offers].push @job_offer.id
    else
      while session[:checked_offers].include? @job_offer.id and session[:checked_offers].count < JobOffer.count
        @job_offer = JobOffer.random
        if !session[:checked_offers].include? @job_offer.id
          session[:checked_offers].push @job_offer.id
          break
        end
      end
      @job_offer = nil if session[:checked_offers].count == JobOffer.count
    end
  end
end