module StaticHelper
  def get_record
    d = Shift.all.select("shift_start", "shift_end","id", "user_id","specialpay","sub_needed","graveyardshift")
    d = JSON.parse(d.to_json)
    d.each do |a|
    	begin
    		a["user_id"] = (User.find_by_id(a["user_id"]).try(:username) or "1")
    	rescue ActiveRecord::RecordNotFound => e
    		next
    	end
    	a["user_id"] = "#{a["user_id"]} | #{"Sub Needed" if a["sub_needed"]}\n #{"Special Pay" if a["specialpay"]}"
    end
    d = d.to_json
    d.gsub(/shift_/, '').gsub(/user_id/, 'title').html_safe
  end
end
