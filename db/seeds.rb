# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create!(
	last_name: '小林',
	first_name: '勃也',
	lastname_kana: 'コバヤシ',
	firstname_kana: 'タツヤ',
	post_code: '000-0000',
	address: '長野県千曲市xxxxxx',
	telephone: 'xxx-xxxx-xxxx',
	email: 'kobaba@hotmail.ppp',
	password: '111111',
	)
