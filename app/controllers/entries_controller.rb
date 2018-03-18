class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)
		puts params
	id_search = params["idparcel"]
	@searchentries = Entry.search_attr(id_search)
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
	@destis = Desti.all
  end

  # GET /entries/1/edit
  def edit
  	@destis = Desti.all
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(idparcel: entry_params["idparcel"], name: entry_params["name"], desti_id: params[:desti_id].to_i)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
  @entry = Entry.new(idparcel: entry_params["idparcel"], name: entry_params["name"], desti_id: params[:desti_id].to_i)
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def sort_column
  params[:sort] || "name"
  end
    def sort_direction
	params[:direction] || "desc"
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:idparcel, :name, :desti)
    end
end
