# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	Role.create(role_name: '管理者')
	Role.create(role_name: '一般')
	#User.create(student_id: 'admin', user_name: 'admin',password: 'password', role_id: 1)