# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(login: 'admin', fio: 'Иван Петрович Сидоров', roles: 'admin', password: 'admin', crypted_password: 'admin')
for k in 1..100
  a=rand(1000..99999)
  b=rand(99999..9999999)
  User.create(login: a, fio: 'Иван Петрович Сидоров', roles: 'admin', password: b, crypted_password: b)
end
