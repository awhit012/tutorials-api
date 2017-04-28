module Response
  def json_response(object, status = :ok, included_data = [])
    render json: object, status: status,  :include => included_data
  end
end