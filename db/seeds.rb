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