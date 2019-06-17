class ListsController < ApplicationController
  before_action :find_list ,:authenticate_user! , only:[:listo]
  def index
    @lists = List.all
  end
  def listo
    @lists.listo = true
    @lists.save
    redirect_to lists_index_path
end

private
    def list_params
        params.require(:listo).permit(:description,:listo)
    end
    def find_list
      @lists =List.find(params[:id])
    end
  
end


