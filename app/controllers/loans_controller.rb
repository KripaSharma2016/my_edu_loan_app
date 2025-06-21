class LoansController < ApplicationController
  before_action :authenticate_user!

  def index
    @loans = current_user.loans
  end

  def new
    @loan = Loan.new
  end

  def create
    @loan = current_user.loans.build(loan_params)
    if @loan.save
      # Generate EMIs logic here (basic example)
      (1..@loan.duration).each do |i|
        Emi.create!(
          loan: @loan,
          due_date: Date.today + i.months,
          amount: (@loan.amount / @loan.duration),
          paid: false
        )
      end
      redirect_to loans_path, notice: "Loan successfully created!"
    else
      render :new
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:amount, :duration, :status)
  end
end