class Response
  def success(message, data)
    { success: true, message: message, data: data }
  end

  def failure(message, data)
    { success: false, message: message, data: data }
  end
end
