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
    # @app = App.find(params[:id])
  end

  def confirm
    # @app = App.new(app_params)
    # @app = App.find(params[:id])
    if params[:new]
    render :new if @app.invalid?
    else
    render :edit
    end
  end
  #
  # def edit_confirm
  #   @app = App.find(params[:id])
  #   @app.content = app_params[:content]
  # end


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

      if @app.update(app_params)
        redirect_to @app, notice: 'App was successfully updated.'
        # render :show, status: :ok, location: @app
      else
        render :edit
        # render json: @app.errors, status: :unprocessable_entity
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
