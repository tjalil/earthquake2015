class ResourcesController < ApplicationController
  before_action :find_resource, only: [:show, :edit, :update, :destroy]

  def index
    @resources = Resource.all

    @donation_resources = @resources.where(main_section: "Donation")
    @donation_resources_need_to_know = @donation_resources.find_all { |resource| resource[:sub_section] == "Need to Know" }
    @donation_resources_suggested = @donation_resources.find_all { |resource| resource[:sub_section] == "Suggested Resource" }
    @donation_resources_efforts_on_the_ground = @donation_resources.find_all { |resource| resource[:sub_section] == "Efforts on the Ground" }

    @other_resources = @resources.where(main_section: "Other Resources")
    @other_resources_need_to_know = @other_resources.find_all { |resource| resource[:sub_section] == "Need to Know" }
    @other_resources_suggested = @other_resources.find_all { |resource| resource[:sub_section] == "Suggested Resource" }
    @other_resources_efforts_on_the_ground = @other_resources.find_all { |resource| resource[:sub_section] == "Efforts on the Ground" }
  end

  def show
  end

  def new
    @resource = Resource.new
  end

  def edit
  end

  def create
    @resource = Resource.new(resource_params)

    respond_to do |format|
      if @resource.save
        @resource.update_attribute(:description, params[:editor1])

        format.html { redirect_to resources_path, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @resource.update(resource_params)
        @resource.update_attribute(:description, params[:editor1])

        format.html { redirect_to resources_path, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def find_resource
      @resource = Resource.find(params[:id])
    end

    def resource_params
      params.require(:resource).permit(:title, :website_link, :contact_num, :description, :main_section, :sub_section)
    end
end
