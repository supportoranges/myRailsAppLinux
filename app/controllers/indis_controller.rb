class IndisController < ApplicationController
  before_action :set_indi, only: [:show, :edit, :update, :destroy]

  # GET /indis
  # GET /indis.json
  #
  # cache parameters
  $last
  $first

  def index
  # cache parameters
    $last= "%#{params[:lastname]}%"
    $first = "%#{params[:firstname]}%"
    @indis = if params[:lastname] && params[:firstname]
               Indi.joins("INNER JOIN profiles ON profiles.id = profile_id").where(  'lastname LIKE ? and firstname LIKE ?', "%#{params[:lastname]}%", "%#{params[:firstname]}%" ).order('company asc')
             else
               @indis = Indi.all
             end
  end

  def search
    @indis = Indi.all
  end

  # GET /indis/1
  # GET /indis/1.json
  def show
  end

  # GET /indis/new
  def new
    @indi = Indi.new
  end
  # GET /indis/1/edit
  def edit
  end

  # POST /indis
  # POST /indis.json
  def create
    @indi = Indi.new(indi_params)
    respond_to do |format|
      if @indi.save
        if $horrible_global
          format.html { redirect_to :controller => 'profiles', :company => $last_company_search, :state => $last_state_search, :action => 'index', notice: 'Contact successfully updated.' }
        else
          format.html { redirect_to :controller => 'indis', :action => 'index', :lastname => $last, :firstname => $first, notice: 'Contact successfully updated.' }
        end
      else
        format.html { render :new }
        format.json { render json: @indi.errors, status: :unprocessable_entity }
        puts(@indi.errors.inspect)
      end
    end
  end

  # PATCH/PUT /indis/1
  # PATCH/PUT /indis/1.json
  def update            #YOU MUST SUPPLY A RESPONSE IN HTML OR YOUR API WILL BREAK
    respond_to do |format|
      if @indi.update(indi_params)
        if $horrible_global
          format.html { redirect_to :controller => 'profiles', :company => $last_company_search, :state => $last_state_search, :action => 'index', notice: "Contact successfully updated." }
        else
          format.html { redirect_to :controller => 'indis', :action => 'index', :lastname => $last, :firstname => $first, notice: 'Contact successfully updated.' }
        end
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /indis/1
  # DELETE /indis/1.json
  def destroy
# if you start getting nil class errors it probably means the list of attachments hasn't been refreshed and are stale!
# when it says purge is not a method on nil it doesn't mean purge is not a method on file, it's just that there is no file object!
# handle selective purge
    if params[:file_id]
      @indi.files.find_by_id(params[:file_id]).purge
      respond_to do |format|
          format.html { render :show, notice: 'Contact successfully updated.' }
      end
# when it says purge is not a method on nil it doesn't mean purge is not a method on file, it's just that there is no file object!

# handle purge all.  this is not implemented yet.
    else

    @indi.destroy
              respond_to do |format|
                if $horrible_global#coming from companies list
                  format.html { redirect_to :controller => 'profiles', :company => $last_company_search, :state => $last_state_search, notice: 'Contact was successfully deleted.' }
                else
                  format.html { redirect_to :controller => 'indis', :action => 'index', :lastname => $last, :firstname => $first, notice: 'Contact was successfully deleted.' }
                end
                format.json { head :no_content }
              end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indi
      @indi = Indi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indi_params
      params.require(:indi).permit(:greet, :firstname, :middle, :lastname,  :workphone, :extension, :mobilephone,:profile_id, :contact_email, :contact_suffix, :jobtitle, :department, :remarks, files: [])
    end
end
