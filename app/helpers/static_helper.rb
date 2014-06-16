module StaticHelper
  def get_record
    d = Shift.all.select("shift_start", "shift_end","id", "user_id")
    d = JSON.parse(d.to_json)
    d.each do |a|
    	a["user_id"] = (User.find_by_id(a["user_id"]).try(:username) or "1")
    end
    d = d.to_json
    d.gsub(/shift_/, '').gsub(/user_id/, 'title').html_safe
  end
end
