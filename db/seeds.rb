
u1 = User.create!(name:'james', email:'james@james.com', password: "password", role:'admin')
u2 = User.create!(name:'cheryl', email:'cheryl@cheryl.com', password: "password", role:'admin')
u3 = User.create!(name:'elena', email:'elena@elena.com', password: "password", role:'admin')

f1 = Facility.create!(name:'quiet', coffeeshops: Coffeeshop.where(name: 'canvas'))
f2 = Facility.create!(name:'power')
f3 = Facility.create!(name:'wifi')


c1 = Coffeeshop.create!(name: 'canvas', latitude: '', longitude:'', address:'brick lane 132', description: 'asdfghjkl', picture: '', user_id: '1', facilities: Facility.where(name: 'quiet'))

c2 = Coffeeshop.create!(name: 'coolio cafe', latitude: '', longitude:'', address:'12 joo chiat road', description: 'asdfghjkl', picture: '', user_id: '2', facilities: Facility.where(name: 'wifi'))

c3 = Coffeeshop.create!(name: 'la magnée', latitude: '', longitude:'', address:'12 paris road', description: 'asdfghjkl', picture: '', user_id: '3', facilities: Facility.where(name: 'power'))

