module ClassroomsHelper
  def teacher_full_name(teacher)
    teacher.first_name + ' ' + teacher.last_name
  end
end
