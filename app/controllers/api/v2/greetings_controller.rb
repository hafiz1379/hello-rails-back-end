class Api::V2::GreetingsController < ApplicationController
  # GET /greetings/random
  def random_greeting
    greeting = Greeting.order('RANDOM()').first
    if greeting.nil?
      render json: { error: 'Record not found' }, status: 500
    else
      render json: { message: greeting.text } and return if request.format.json?

      render html: "<p style='color: green; font-size: 30px; text-align: center;'>#{greeting.text}</p>".html_safe
    end
  end
end
