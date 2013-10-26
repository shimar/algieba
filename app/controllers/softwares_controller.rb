class SoftwaresController < ApplicationController
  before_action :set_user,                    only: [:show, :edit, :update, :destroy]
  before_action :set_software,                only: [:show, :edit, :update, :destroy]
  before_action :set_data_functions,          only: [:show, :edit]
  before_action :set_transactional_functions, only: [:show, :edit]

  # GET /softwares
  # GET /softwares.json
  def index
    @softwares = Software.all
  end

  # GET /softwares/1
  # GET /softwares/1.json
  def show
  end

  # GET /softwares/new
  def new
    @software = current_user.softwares.build
  end

  # GET /softwares/1/edit
  def edit
  end

  # POST /softwares
  # POST /softwares.json
  def create
    @user = current_user
    @software = @user.softwares.build(software_params)
    logger.debug(@software.data_functions.size)
    respond_to do |format|
      if @software.save
        format.html { redirect_to root_url, notice: 'Software was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /softwares/1
  # PATCH/PUT /softwares/1.json
  def update
    respond_to do |format|
      if @software.update(software_params)
        format.html { redirect_to @software, notice: 'Software was successfully updated.' }
        format.json { head :no_content }
      else
        logger.error(@software.errors.keys)
        format.html { render action: 'edit' }
        format.json { render json: @software.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /softwares/1
  # DELETE /softwares/1.json
  def destroy
    @software.destroy
    respond_to do |format|
      format.html { redirect_to softwares_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(current_user)
  end

  def set_software
    @software = @user.softwares.includes(:ilfs, :elfs).find(params[:id])
  end

  def set_data_functions
    @data_functions = @software.data_functions
  end

  def set_transactional_functions
    @transactional_functions = @software.transactional_functions
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def software_params
    params.require(:software)
      .permit(:name,
              :description,
              :measure_method,
              data_functions_attributes: [
                :id,
                :user_id,
                :name,
                :type,
                :det,
                :ret,
                :_destroy
              ],
              transactional_functions_attributes: [
                :id,
                :user_id,
                :name,
                :type,
                :det,
                :ftr,
                :_destroy
              ])
  end

end
