# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Creates a week of shifts for development/test purposes
require 'time.rb'
shift_lengths = [0,4,8,10,12,13,14,15,16,18,20,22,24]
def timeed(startTime,day)
  nt = Time.now
  puts "Computed Day: #{(nt.day - nt.wday) + day}, nt.day = #{nt.day}, nt.wday = #{nt.wday}"
  lmd = Time.days_in_month(nt.month-1, nt.year)

  begin
  	shiftTime = Time.mktime(nt.year,nt.month,(nt.day - nt.wday) + day,startTime,0,0,"+4:00").iso8601
  rescue
    begin
      puts "Computed Day 2: #{(day - (nt.end_of_month.day - nt.day)) - 1}, nt.day = #{nt.day}, nt.wday = #{nt.wday}"
  	  shiftTime = Time.mktime(nt.year,nt.month + 1,(day - (nt.end_of_month.day - nt.day)) - 1,startTime,0,0,"+4:00").iso8601
  	rescue
  	  begin
        puts "Computed Day 3: #{(day - (nt.end_of_month.day - nt.day)) - 1}, nt.day = #{nt.day}, nt.wday = #{nt.wday}"
        shiftTime = Time.mktime(nt.year+1,1,(day - (nt.end_of_month.day - nt.day)) - 1,startTime,0,0,"+4:00").iso8601
  	  rescue
        puts "Computed Day 4: #{Time.days_in_month(nt.month-1, nt.year)-(nt.day%(day+1))}, day = #{day}, nt.day = #{nt.day}, nt.wday = #{nt.wday}"
        shiftTime = Time.mktime(nt.year,nt.month - 1,Time.days_in_month(nt.month-1, nt.year)-(nt.day%(day+1)),startTime,0,0,"+4:00").iso8601
      end
    end
  end
  puts shiftTime
  return shiftTime
end

week = (0..6)
week.each do |day|
  shift_lengths.each_with_index do |a,i|
    #puts timeed(a,day)
    break if a == 24
    if ((a==0) or (a==4)) or ((a==22) && (week==5))
      isgraveyardshift = true
    else
      isgraveyardshift = false
    end
    #puts "Day: #{day}, Shift Start: #{shift_lengths[i]}, Shift End: #{shift_lengths[i+1]}"
    Shift.create(shift_start: timeed(a,day), shift_end: timeed(shift_lengths[i+1],day), desk_id: 1, user_id: day+1, specialpay: false, sub_needed: false, graveyardshift: isgraveyardshift)
    Shift.create(shift_start: timeed(a,day), shift_end: timeed(shift_lengths[i+1],day), desk_id: 2, user_id: day+1, specialpay: false, sub_needed: false, graveyardshift: isgraveyardshift)
  end
end

puts "Finished Seeding Shifts"


# Create the desks

Desk.create(name:"Residence on Fifth",open: true)
Desk.create(name:"Hill",open: true)
Desk.create(name:"Stever",open: true)
Desk.create(name:"Morewood",open: true)
Desk.create(name:"Mudge",open: true)
Desk.create(name:"Donner",open: true)
Desk.create(name:"West Wing",open: true)
puts "Finished Seeding Desks"

# Create a user as admin

User.create(username:"cvm",email:"cvm@andrew.cmu.edu",desk_id:1,password:"cheesing",password_confirmation:"cheesing",role:"admin")
User.create(username:"blee",email:"blee@andrew.cmu.edu",desk_id:2,password:"cheesing",password_confirmation:"cheesing",role:"manager")
User.create(username:"hmiura1",email:"hmiura1@andrew.cmu.edu",desk_id:3,password:"cheesing",password_confirmation:"cheesing",role:"supervisor")
User.create(username:"omartins",email:"omartins@andrew.cmu.edu",desk_id:4,password:"cheesing",password_confirmation:"cheesing",role:"supervisor")
User.create(username:"gtaylor1",email:"gtaylor1@andrew.cmu.edu",desk_id:5,password:"cheesing",password_confirmation:"cheesing",role:"attendant")
User.create(username:"acsingh",email:"acsingh@andrew.cmu.edu",desk_id:6,password:"cheesing",password_confirmation:"cheesing",role:"attendant")
User.create(username:"krauchen",email:"krauchen@andrew.cmu.edu",desk_id:7,password:"cheesing",password_confirmation:"cheesing",role:"attendant")


puts "Finished Seeding Users"



puts "Finished Seeding Database"