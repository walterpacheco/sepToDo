
class CompleteController < ApplicationController
   before_action :authenticate_user!
   
   def index
    @completes = Complete.where({
        user_id: current_user.id
     })
   end


#    def update
#     completes = Complete.find(params[:id])
#     completes.update({
#         listo: true,
#       })
#       redirect_to root_path

#    end 
   


   def update  
    completes = Complete.find(params[:id])

    if completes.listo

        completes.update({
        listo: false,
    })

    else

        completes.update({
        listo: true,
    })
    end

    completes.save
    redirect_to root_path
end
end