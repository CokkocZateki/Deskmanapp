# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'time.rb'
shift_lengths = [0,4,8,10,12,13,14,15,16,18,20,22,24]
def timeed(startTime,day)
  nt = Time.now
  puts Time.mktime(nt.year,nt.month,nt.day.to_i + day,startTime).iso8601
  Time.mktime(nt.year,nt.month,nt.day.to_i + day,startTime,0,0,"+4:00").iso8601
end

week = (1..7)
week.each do |day|
  shift_lengths.each_with_index do |a,i|
    #puts timeed(a,day)
    break if a == 24
    Shift.create(shift_start: timeed(a,day), shift_end: timeed(shift_lengths[i+1],day), desk: "Residence on Fifth", specialpay: false, graveyardshift: false)
  end
end
