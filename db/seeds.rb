headmaster = Role.new(name: "Headmaster").save
teacher = Role.new(name: "Teacher").save
student = Role.new(name: "Student").save
puts "Roles successfully created"
User.create({username: "headmaster", password: "123456", role_id: headmaster})
User.create({username: "teacher", password: "123456", role_id: teacher})
User.create({username: "student", password: "123456", role_id: student})
puts "Users successfully created"
puts "========================="
puts "Seed file successfully loaded!!!"
puts "========================="