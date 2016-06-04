# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
puts "Adding Athens Clarke commissioners"
RepresentativeProfile.create(name: "Sharyn Dickerson",
 office: "Commissioner",
 district: "1",
 term: "Mon, 31 Dec 2018 00:00:00 EST -05:00",
 term_start: "Thu, 01 Jan 2015 00:00:00 EST -05:00",
 bio:
  "- President, Sharyn Dickerson & Associates, LLC (2005-present)\r\n- Assistant Solid Waste Director, Unified Government of Athens-Clarke County (1997-2005, 1994-1996)\r\n- Interim Solid Waste Director, Unified Government of Athens-Clarke County (1996-1997)\r\n- Recycling Coordinator, Unified Government of Athens-Clarke County (1991-1994)\r\n- Inside Sales Representative, Scientific Atlanta (1990-1991)",
 profession: "President, Sharyn Dickerson & Associates, LLC (2005-present)",
 party_affiliation: "",
 official_email: "sharyn.dickerson@athensclarkecounty.com")
RepresentativeProfile.create(name: "Harry Sims",
 office: "Commissioner",
 district: "2",
 term: "Mon, 31 Dec 2018 00:00:00 EST -05:00",
 term_start: "Thu, 01 Jan 2015 00:00:00 EST -05:00",
 bio:
  "- Retired Clarke County School District fifth grade teacher at Barrow Elementary School (29 years)\r\n- Crawford Coal and Mattress Works (two years)",
 profession: "- Retired Clarke County School District fifth grade teacher at Barrow Elementary School",
 party_affiliation: "",
 official_email: "harry.sims@athensclarkecounty.com")
RepresentativeProfile.create({
  name: 'Melissa Link',
  office: 'Commissioner',
  district: '3'
})
RepresentativeProfile.create({
  name: 'Allison Wright',
  office: 'Commissioner',
  district: '4'
})
RepresentativeProfile.create({
  name: 'Jared Bailey',
  office: 'Commissioner',
  district: '5'
})
RepresentativeProfile.create({
  name: 'Jerry NeSmith',
  office: 'Commissioner',
  district: '6'
})
RepresentativeProfile.create({
  name: 'Diane Bell',
  office: 'Commissioner',
  district: '7'
})
RepresentativeProfile.create({
  name: 'Andy Herod',
  office: 'Commissioner',
  district: '8'
})
RepresentativeProfile.create({
  name: 'Kelly Girtz',
  office: 'Commissioner',
  district: '9'
})
RepresentativeProfile.create({
  name: 'Mike Hamby',
  office: 'Commissioner',
  district: '10'
})