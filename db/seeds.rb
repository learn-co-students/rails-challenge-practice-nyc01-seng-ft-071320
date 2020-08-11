weworks = [
  {name: "Finsbury Pavement", 
   country: "UK", 
   address: "131 Finsbury Pavement",
   rent_per_floor: 18000,
   number_of_floors: 8
  }, 
  {name: "Chelsea HQ", 
   country: "US", 
   address: "29 West 28th Street",
   rent_per_floor: 20000,
   number_of_floors: 20
  }, 
  {name: "Broadway", 
   country: "US", 
   address: "85 Broadway",
   rent_per_floor: 25000,
   number_of_floors: 6
  }
]

weworks.each do |we|
  Building.create(we)
end

puts "#{Building.all.count} buildings created"

companies = [
  "Microsoft",
  "Flatiron",
  "Green Peace",
  "FinFund LLC",
  "Inc'd Comics",
  "Blue Apron",
  "Dog the Bounty Hunter LLC"
]

companies.each do |company|
  Company.create(name: company)
end

puts "#{Company.all.count} companies created"

titles = [
  "CEO",
  "Engineer",
  "HR specialist",
  "Graphic designer",
  "CFO",
  "COO",
  "Instructor"
]

10.times do 
  random_building = Building.all.sample
  random_building_floors_array = (1..random_building.number_of_floors).to_a
  Office.create(
    company: Company.all.sample,
    building: random_building,
    floor: random_building_floors_array.delete(random_building_floors_array.sample)
    )
end

puts "#{Office.all.count} offices created"


100.times do 
  company = Company.all.sample

  Employee.create(
    name: Faker::Name.name_with_middle,
    title: titles.sample,
    company: company,
    office_id: company.id
  )
end

puts "#{Employee.all.count} employees created"