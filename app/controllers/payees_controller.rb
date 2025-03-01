class PayeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payee, only: [:show, :edit, :update, :destroy]

  # GET /payees
  # GET /payees.json
  def index
    @payees = current_budget.payees
  end

  # GET /payees/1
  # GET /payees/1.json
  def show
  end

  # GET /payees/new
  def new
    @payee = Payee.new
  end

  # GET /payees/1/edit
  def edit
  end

  # POST /payees
  # POST /payees.json
  def create
    @payee = Payee.new(payee_params)

    respond_to do |format|
      if @payee.save
        format.html { redirect_to payees_url, notice: 'Payee was successfully created.' }
        format.json { render :show, status: :created, location: @payee }
      else
        format.html { render :new }
        format.json { render json: @payee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payees/1
  # PATCH/PUT /payees/1.json
  def update
    respond_to do |format|
      if @payee.update(payee_params)
        format.html { redirect_to payees_url, notice: 'Payee was successfully updated.' }
        format.json { render :show, status: :ok, location: @payee }
      else
        format.html { render :edit }
        format.json { render json: @payee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payees/1
  # DELETE /payees/1.json
  def destroy
    @payee.destroy
    respond_to do |format|
      format.html { redirect_to payees_url, notice: 'Payee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payee
      @payee = Payee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payee_params
      params.require(:payee).permit(:name, :budget_id)
    end
end
