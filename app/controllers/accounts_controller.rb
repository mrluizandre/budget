class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:show, :edit, :update, :destroy, :transactions]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = current_budget.accounts
  end

  def transactions
    transactions = @account.transactions
    transfers_to = @account.transfers_to
    transfers_from = @account.transfers_from.map{|t| t.amount = -t.amount; t}

    @transactions = transactions + transfers_to + transfers_from

    @transactions.sort_by! do |t| 
      if t.is_a? Transfer
        t.created_at
      elsif t.is_a? Transaction
        t.date
      end
    end.reverse!

    # @transactions = @account.transactions
    @scheduled_transactions = @account.scheduled_transactions.where(done: false).order(date: :desc).group_by{|a| a.date.strftime("%B/%Y")}
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to accounts_path, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to accounts_path, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :account_type, :balance)
    end
end
