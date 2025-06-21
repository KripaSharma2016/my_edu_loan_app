class EmisController < ApplicationController
  before_action :authenticate_user!

  def index
    @emis = Emi.joins(:loan).where(loans: { user_id: current_user.id })
  end
end