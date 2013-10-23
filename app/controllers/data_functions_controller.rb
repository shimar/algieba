class DataFunctionsController < ApplicationController

  def new
    @software = current_user.softwares.find(params[:software_id])
    @data_function = @software.data_functions.build
  end

end
