class DojoController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def new 
  end

  def create
    @dojo = Dojo.create(branch: params[:branch], street: params[:street], city: params[:city], state: params[:state])
    redirect_to '/'
  end

  def show
    @dojo = Dojo.find(params[:id])
    @students = Student.where(dojo_id:params[:id])
    @dojo_id = params[:id]
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
    Dojo.find(params[:id]).update(branch: params[:branch], street: params[:street], city: params[:city], state: params[:state])
    redirect_to '/'
  end
    
  def destroy
    Dojo.find(params[:id]).destroy
    redirect_to '/'
  end
end
