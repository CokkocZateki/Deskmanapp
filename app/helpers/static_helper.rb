module StaticHelper
  def get_record
    Shift.all.select("start", "end","id").to_json.html_safe 
  end
end
