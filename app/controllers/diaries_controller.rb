class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update]
  # before_action :set_diary, only: [:show, :edit, :update, :destroy]

  # GET /diaries
  # GET /diaries.json
  def index
    @diaries = Diary.all.order(params[:sort])
  end

  # GET /diaries/1
  # GET /diaries/1.json
  def show
    if @diary.pages != nil and @diary.month != nil
      @pages_path = @diary.pages.split(",")
      @pages_path.map!{|page| @diary.month.to_s+'/'+page+'.png'}
    else
      @pages_path = []
    end

    files = Dir.glob("app/assets/audios/*.m4a")
    if !files.include?("app/assets/audios/"+@diary.id.to_s+".m4a")
      @audio_path = ''
    else
      @audio_path = @diary.id.to_s+".m4a"
    end
  end

  # GET /diaries/new
  def new
    @diary = Diary.new
  end

  # GET /diaries/1/edit
  def edit
  end

  # POST /diaries
  # POST /diaries.json
  def create
    @diary = Diary.new(diary_params)
    respond_to do |format|
      if @diary.save
        format.html { redirect_to @diary, notice: 'Diary was successfully created.' }
        format.json { render :show, status: :created, location: @diary }
      else
        format.html { render :new }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diaries/1
  # PATCH/PUT /diaries/1.json
  def update
    respond_to do |format|
      if @diary.update(diary_params)
        format.html { redirect_to @diary, notice: 'Diary was successfully updated.' }
        format.json { render :show, status: :ok, location: @diary }
      else
        format.html { render :edit }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diaries/1
  # DELETE /diaries/1.json
  # def destroy
  #   @diary.destroy
  #   respond_to do |format|
  #     format.html { redirect_to diaries_url, notice: 'Diary was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary
      @diary = Diary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diary_params
      params.require(:diary).permit(:id, :title, :subtitle, :month, :pages, :audio_id)
    end
  end
