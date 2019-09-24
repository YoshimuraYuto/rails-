class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]


  def index
    if params[:content_key]
      @apps = App.where('content LIKE ?', "%#{params[:content_key]}")
    else
      @apps = App.all
    end
  end


  def show
  end


  def new
    @app = App.new
  end


  def edit
  end

  def confirm
    @app = App.new(app_params)
    render :new if @app.invalid?
  end


  def create
    @app = App.new(app_params)


      if params[:back]
        render :new
      else
        if @app.save
          redirect_to apps_path, notice: 'App was successfully created.'

        else
          render :new

        end
      end

  end


  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_app
      @app = App.find(params[:id])
    end

    
    def app_params
      params.require(:app).permit(:content)
    end
end
