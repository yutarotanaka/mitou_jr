class KeijibansController < ApplicationController
  before_action :set_keijiban, only: [:show, :edit, :update, :destroy]

  # GET /keijibans
  # GET /keijibans.json
  def index
    @keijibans = Keijiban.all
  end

  # GET /keijibans/1
  # GET /keijibans/1.json
  def show
  end

  # GET /keijibans/new
  def new
    @keijiban = Keijiban.new
  end

  # GET /keijibans/1/edit
  def edit
  end

  # POST /keijibans
  # POST /keijibans.json
  def create
    @keijiban = Keijiban.new(keijiban_params)

    respond_to do |format|
      if @keijiban.save
        format.html { redirect_to @keijiban, notice: 'Keijiban was successfully created.' }
        format.json { render :show, status: :created, location: @keijiban }
      else
        format.html { render :new }
        format.json { render json: @keijiban.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keijibans/1
  # PATCH/PUT /keijibans/1.json
  def update
    respond_to do |format|
      if @keijiban.update(keijiban_params)
        format.html { redirect_to @keijiban, notice: 'Keijiban was successfully updated.' }
        format.json { render :show, status: :ok, location: @keijiban }
      else
        format.html { render :edit }
        format.json { render json: @keijiban.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keijibans/1
  # DELETE /keijibans/1.json
  def destroy
    @keijiban.destroy
    respond_to do |format|
      format.html { redirect_to keijibans_url, notice: 'Keijiban was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keijiban
      @keijiban = Keijiban.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keijiban_params
      params.require(:keijiban).permit(:content, :user_id)
      params.require(:keijiban).permit(:content, :picture)
    end
end
