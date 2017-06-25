# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "START!"

puts "-> Create event types"
# "旅游", "运动", "放松", "交友", "学习"... parent types
type_travel = EventType.create(name: "旅游")
["招募驴友", "徒步"].each do |type|
  EventType.create(name: type, parent_id: type_travel.id)
end

type_relax = EventType.create(name: "放松")
["喝一杯", "一起来吹牛", "不想一个人看电影", "桌游", "公共派对"].each do |type|
  EventType.create(name: type, parent_id: type_relax.id)
end

puts "-> Create events"
Event.create(
  user: User.first,
  name: "免费啤酒",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  starts_at: Time.now,
  ends_at: Time.now + 3.days,
  event_type: EventType.find_by(name: "喝一杯"),
  state: "ok",
  lat: 31.21,
  lng: 121.43,
  location: "上海市虹口区四川北SOHO 3Q"
)

puts "SEED DONE!"
