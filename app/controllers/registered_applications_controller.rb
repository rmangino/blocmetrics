class RegisteredApplicationsController < ApplicationController
  load_and_authorize_resource # CanCanCan gem

  def index
    @registered_applications = RegisteredApplication.visible_to(current_user)
  end

  def show
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def edit
  end

  def create
    @registered_application.user = current_user

    if @registered_application.save
      flash[:notice] = "Registered Application was created."
      redirect_to root_path
    else
      flash[:error] = "There was an error saving the Registered Application. Please try again."
      render :new
    end
  end

  def update
    if @registered_application.update_attributes(registered_application_params)
      redirect_to @registered_application, notice: 'Registered application was successfully updated.'
    else
      flash[:error] = "There was an error saving the Registered Application. Please try again."
      render :root_path
    end
  end

  def destroy
    if @registered_application.destroy
      flash[:notice] = "Registered Application deleted."
      redirect_to root_path
    else
      flash[:error] = "There was an error deleting the Registered Application."
      redirect_to :show
    end
  end

  private

    def find_registered_application
      @registered_application = RegisteredApplication.find(params[:id])
    end

    def registered_application_params
      params.require(:registered_application).permit(:name, :url)
    end

end
