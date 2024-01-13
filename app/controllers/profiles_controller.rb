class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  #cache search criteria
  $last_company_search
  $last_state_search
  # GET /profiles
  # GET /profiles.json
  def index
    $last_company_search = "%#{params[:company]}%"
    $last_state_search = "%#{params[:state]}%"
    @profiles = if params[:company]
                  Profile.includes(:indis).where('company LIKE ? and state LIKE ?', "%#{params[:company]}%", "%#{params[:state]}%").order('company asc')
                else
               @profiles = Profile.all
                end
  end


  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        #format.html {redirect_to :controller => 'profiles', :company => $last_company_search, :state=> $last_state_search, notice: 'Company was successfully created.' }  CANNOT GET FLASH WORK!
        format.html {redirect_to @profile, :company => $last_company_search, :state=> $last_state_search, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to :controller => 'profiles', :company => $last_company_search, :state => $last_state_search, :flash => "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to :controller => 'profiles', :company => $last_company_search, :state => $last_state_search, notice: 'Company was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:company, :address1, :address2, :city, :state, :zip, :country, :website, :status, :referredby, :pobox)
    end
end
