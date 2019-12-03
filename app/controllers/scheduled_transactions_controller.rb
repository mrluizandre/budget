class ScheduledTransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_scheduled_transaction, only: [:show, :edit, :update, :destroy, :enter_now]

  def enter_now
    @scheduled_transaction.create_transaction(due_date: Date.today)
    redirect_to transactions_account_path(@scheduled_transaction.account), notice: 'Transaction was successfully created.' 
  end

  # GET /scheduled_transactions
  # GET /scheduled_transactions.json
  def index
    @scheduled_transactions = ScheduledTransaction.where(done: false).order(date: :asc).group_by{|a| a.date.strftime("%B/%Y")}
    @scheduled_transactions_not_grouped = ScheduledTransaction.where(done: false)
  end

  # GET /scheduled_transactions/1
  # GET /scheduled_transactions/1.json
  def show
  end

  # GET /scheduled_transactions/new
  def new
    @scheduled_transaction = ScheduledTransaction.new
  end

  def new_by_installments
  end
  
  def create_by_installments
    ScheduledTransaction.create_by_installments(
      n_installments: create_by_installments_params[:n_installments],
      first_installment_date: create_by_installments_params[:first_installment_date],
      account_id: create_by_installments_params[:account_id],
      payee_id: create_by_installments_params[:payee_id],
      category_id: create_by_installments_params[:category_id],
      inflow: create_by_installments_params[:inflow],
      outflow: create_by_installments_params[:outflow],
      note: create_by_installments_params[:note])

    redirect_to transactions_account_path(create_by_installments_params[:account_id])
  end
  # GET /scheduled_transactions/1/edit
  def edit
  end

  # POST /scheduled_transactions
  # POST /scheduled_transactions.json
  def create
    @scheduled_transaction = ScheduledTransaction.new(scheduled_transaction_params)

    respond_to do |format|
      if @scheduled_transaction.save
        format.html { redirect_to transactions_account_path(@scheduled_transaction.account), notice: 'Scheduled transaction was successfully created.' }
        format.json { render :show, status: :created, location: @scheduled_transaction }
      else
        format.html { render :new }
        format.json { render json: @scheduled_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scheduled_transactions/1
  # PATCH/PUT /scheduled_transactions/1.json
  def update
    respond_to do |format|
      if @scheduled_transaction.update(scheduled_transaction_params)
        format.html { redirect_to transactions_account_path(@scheduled_transaction.account), notice: 'Scheduled transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @scheduled_transaction }
      else
        format.html { render :edit }
        format.json { render json: @scheduled_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scheduled_transactions/1
  # DELETE /scheduled_transactions/1.json
  def destroy
    @scheduled_transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_account_path(@scheduled_transaction.account), notice: 'Scheduled transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_transaction
      @scheduled_transaction = ScheduledTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scheduled_transaction_params
      params.require(:scheduled_transaction).permit(:date, :account_id, :payee_id, :category_id, :inflow, :outflow, :note)
    end

    def create_by_installments_params
      params.permit(
        :n_installments,
        :starting_n_installment,
        :first_installment_date,
        :account_id,
        :payee_id,
        :category_id,
        :inflow,
        :outflow,
        :note)
    end
end
