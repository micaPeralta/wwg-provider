class Api::V1::ManufactureController < ApplicationController

  def index
    if (!params['fromDate'].present?)
      render json: {error: 'fromDate  is required'}, status: 400
      return
    end
    if (!params['toDate'].present?)
      render json: {error: 'toDate  is required'}, status: 400
      return
    end
    render json: { result: "ok"}, status: :ok
  end

end