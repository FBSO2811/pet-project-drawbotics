class PagesController < ApplicationController
  skip_before_action :authenticate_interviewer!, only: [:home,  :my_candidatures, :dashboard, :list_candidates]
  skip_before_action :authenticate_candidate!, only: [:home, :my_candidatures, :dashboard, :list_candidates]

  def home
  end

  def my_candidatures
  end

  def dashboard
  end

  def list_candidates
    @candidates = Candidate.all
  end

end
