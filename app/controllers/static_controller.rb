class StaticController < ApplicationController
  def home
  	@shift = Shift.new
  end

  def calendar
  end
end
