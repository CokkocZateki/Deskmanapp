module StaticHelper
  def get_record
    d = Shift.all.select("shift_start", "shift_end","id").to_json.html_safe
    d.gsub(/(shift_)/, '').html_safe
  end
end
