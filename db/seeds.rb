# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer = Customer.create!(
	id: 1,
	last_name: '小林',
	first_name: '勃也',
	lastname_kana: 'コバヤシ',
	firstname_kana: 'タツヤ',
	post_code: '000-0000',
	prefecture_id: 1,
	municipality: '千曲市横田町',
	address: '1-2-2',
	telephone: 'xxx-xxxx-xxxx',
	email: 'koba@hotmail.ssp',
	password: 'password',
	)

delivery = customer.deliveries.new(
name: '名前',
prefecture_id: 2,
municipality: '市区町村',
address: '番地',
telephone: '111-1111',
customer_id: 1,
)

delivery.valid?
p delivery.errors



