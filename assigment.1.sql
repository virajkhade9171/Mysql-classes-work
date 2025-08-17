-- part A 

-- ------------------------------------------------------------ database analysis--------------------------------------------------------
/*

1.  SCHOOL DATABASE

TABLE 1: teacher( id, name, address, email, contact)
TABLE 2: student( id, name, address, contact, age)
TABLE 3: employee(id, name, address, salary, contact)
TABLE 4: Event( id, name, host, address, enddate)
TABLE 5: Clint(id, name, addresss, email, contact)
 
 
 2. COMPANY DATABASE
 
 TABLE 1: employee( id, name, salary, address , email, contact) 
 TABLE 2: client( id, name, address, contact, age)
 TABLE 3: event( id, name, host, location , time)
 TABLE 4: project(id ,name, host, end_date, start_date)
 TABLE 5: manager(id ,name, address, salary, contact)
 
 3. BANK DATABASE
 
  TABLE 1: customer( id, name, salary, address , email, contact) 
 TABLE 2: account( id, name, type, status, balance)
 TABLE 3: event( id, name, host, location , time)
 TABLE 4: loan(id ,name, type, amount, status)
 TABLE 5:transaction( id ,name receiver_name, amount, date)
 
 4. AIRLINE DATABASE
 
TABLE 1: flights( id, name, airport, status arrival_airport) 
 TABLE 2: passenger( id, name, phone_number,nationality, gender)
 TABLE 3: bookings( id, name, ticket_price, payment_method, booking_date )
 TABLE 4: aircrafts(id ,name, model,capacity,manufacturer ,status)
 TABLE 5: crew( id, name, phone_number,custmor_id, laon_type)
 
5. INDIAN ARMY DATABASE
 
 TABLE 1: Soldier (soldier_id, name ,rank_id ,unit_id ,enlist_date DATE)
TABLE 2:RANK (rank_ID,rank_name ,level ,pay_grade ,responsibilities )
TABLE 3: UNIT(unit_id,unit_name,unit_type ,location,commanding_officer_id )
TABLE 4: Mission (ID,mission_name ,location ,start_date DATE,end_date )
TABLE 5: Equipment(equipment_id ,equipment_name ,type ,quantity,assigned_unit_id)


6. TRAIN DATABASE

TABLE 1:train (train_id, train_name, train_type, source, destination) 
TABLE 2:Station (station_id, station_name, city, state, zone) VALUES
TABLE 3:Passenger (passenger_id, name, age, gender, train_id) VALUES
TABLE 4: Ticket (ticket_id, passenger_id, train_id, seat_no, status) 
TABLE 5: event( id,name , host, address, location)

7. INDAIN NAVY


 TABLE 1: Ship (ship_id, ship_name, ship_type, country, base_location) VALUES
 TABLE 2: Officer (officer_id, name, rank, ship_id, join_date) VALUES
 TABLE 3: Mission (mission_id, mission_name, region, start_date, end_date) VALUES
 TABLE 4: Base (base_id, base_name, location, capacity, command_officer) VALUES
 TABLE 5: Equipment (equipment_id, equipment_name, type, quantity, ship_id) VALUES

8. CAFE

TABLE 1:Customer (customer_id, name, phone, email, address)
TABLE 2:Menu (item_id, item_name, category, price, availability) 
TABLE 3:Order (order_id, customer_id, order_date, total_amount, payment_mode)
TABLE 4:Staff (staff_id, name, role, shift, contact)
TABLE 5:Inventory (item_id, item_name, quantity, unit, restock_date)

9. HOSPITAL
TABLE 1:Patient (patient_id, name, age, gender, contact) 
TABLE 2:Doctor (doctor_id, name, specialization, contact, department)
TABLE 3:Appointment (appointment_id, patient_id, doctor_id, date, time)
TABLE 4:Room (room_id, room_type, status, floor, rate_per_day)
TABLE 5:Billing (bill_id, patient_id, total_amount, payment_method, bill_date) 

10. HOTEL
TABLE 1: Guest (guest_id, name, contact, email, nationality)
TABLE 2:Room (room_id, room_number, room_type, status, rate_per_night) 
TABLE 3:Booking (booking_id, guest_id, room_id, check_in, check_out) 
TABLE 4:Staff (staff_id, name, role, contact, shift)
TABLE 5:Payment (payment_id, booking_id, amount, method, payment_date)

11.PETROL PUMP

TABLE 1: Customer (customer_id, name, vehicle_number, fuel_type, contact)
TABLE 2: Fuel (fuel_id, fuel_type, price_per_litre, stock_litres, last_updated)
TABLE 3: Transaction (transaction_id, customer_id, fuel_id, litres, total_amount) 
TABLE 4: Employee (employee_id, name, role, shift, contact)
TABLE 5: Supplier (supplier_id, name, fuel_type, supply_date, quantity_supplied)

12. CAKE SHOP 

TABLE 1: Menu (item_id, item_name, category, price, availability)
TABLE 2: Customer (customer_id, name, contact, email, loyalty_points)
TABLE 3: Order (order_id, customer_id, order_date, total_amount, payment_mode)
TABLE 4: Staff (staff_id, name, role, shift, contact)
TABLE 5: Inventory (item_id, item_name, quantity, unit, restock_date)

13. BIRTHDAY PARTY

TABLE 1:guest(Guest_ID	,Name	,Age	,Phone,	RSVP_Status)
TABLE 2:menu( Menu_ID, Item_Name,Type,Quantity,	Price)
TABLE 3:game( Game_ID,	Game_Name,	Host_Name,	Duration,	Prize)
TABLE 4:decor (Decor_ID,	Type,	Color,	Quantity,	Vendor)
TABLE 5:(Gift_ID,	Guest_Name,	Gift_Item,	Gift_Type,	Value)

14. invercity

TABLE 1: (Student_ID,	Name,	Age,	Department,	Contact)
TABLE 2: (Course_ID	,Course_Name,	Credits,	Department	,Semester)
TABLE 3: (Faculty_ID	,Name	,Department	,Designation,	Contact) 
TABLE 4: (Dept_ID,	Dept_Name,	HOD_Name,	Building,	Contact)
TABLE 5: (Exam_ID,	Course_ID,	Student_ID	,Marks	,Grade)

15.cricket

TABLE 1: (PlayerID,Name,age,Role,TeamID)
TABLE 2: (TeamID,TeamName,Country,Coach,Captain)
TABLE 3: (MatchID,Team1	,Team2,	Venue,	Winner)
TABLE 4: (MatchID,	PlayerID,Runs,Wickets,BallsFaced)
TABLE 5: (StadiumID,Name,Location,Capacity,	Established)


16. class 

TABLE 1: Table(Class_ID,Class_Name,Stream,Class_Teacher,Room_Number)
TABLE 2: Student (Student_ID,Student_Name,Class_Name,Age,Grade)
TABLE 3: Timetable Table(Timetable_ID,Class_Name,Day,Time,Subject_Name
TABLE 4:  Marks Table(Marks_ID,Student_Name,Subject_Name,Marks_Obtained)
TABLE 5: Subject Table(Subject_ID,Subject_Name,Subject_Teacher,subject

17.  Online Exam System
Table 1:Students: student_id, name, email, course, batch
Table 2:Exams: exam_id, subject, date, duration, total_marks
Table 3:Questions: ques_id, exam_id, text, marks, level
Table 4:Answers: ans_id, student_id, ques_id, response, correct
Table 5:Results: result_id, student_id, exam_id, score, grade

18.  Inventory Management
Table 1:Items: item_id, name, category, price, reorder_level
Table 2:Suppliers: supplier_id, name, contact, city, rating
Table 3:Stock: item_id, quantity, location, last_update, status
Table 4:Purchases: purchase_id, supplier_id, date, total_amount, status
Table 5:Shipments: shipment_id, item_id, quantity, dispatch_date, delivery_date

19. Freelance Platform
Table 1:Freelancers: freelancer_id, name, skill, rate, rating
Table 2:Clients: client_id, name, industry, location, contact
Table 3:Projects: project_id, title, client_id, freelancer_id, deadline
Table 4:Payments: payment_id, project_id, amount, mode, status
Table 5:Reviews: review_id, freelancer_id, client_id, rating, feedback

20. Transport Management
Table 1:Vehicles: vehicle_id, type, capacity, reg_no, model
Table 2:Drivers: driver_id, name, license_no, contact, experience
Table 3:Routes: route_id, source, destination, distance, stops
Table 4:Schedules: schedule_id, vehicle_id, route_id, time, day
Table 5:Bookings: booking_id, schedule_id, user_id, seat_no, fare

21. NGO Management
Table 1:Volunteers: vol_id, name, age, contact, skill
Table 2:Events: event_id, name, location, date, type
Table 3:Donors: donor_id, name, amount, contact, recurring
Table 4:Donations: donation_id, donor_id, amount, date, campaign_id
Table 5:Campaigns: campaign_id, name, goal, status, location

22. Job Portal
Table 1:Jobs: job_id, title, company_id, salary, location
Table 2:Companies: company_id, name, sector, contact, website
Table 3:Applicants: applicant_id, name, email, resume, skills
Table 4:Applications: app_id, job_id, applicant_id, date, status
Table 5:Interviews: interview_id, app_id, date, mode, result

23. Music Streaming App
Table 1:Songs: song_id, title, artist_id, duration, genre
Table 2:Artists: artist_id, name, country, debut_year, genre
Table 3:Albums: album_id, name, artist_id, release_year, type
Table 4:Playlists: playlist_id, user_id, name, created_on, genre
Table 5:Users: user_id, name, email, plan, signup_date

24. Pet Clinic
Table 1:Pets: pet_id, name, species, breed, age
Table 2:Owners: owner_id, name, contact, address, email
Table 3:Appointments: app_id, pet_id, vet_id, date, issue
Table 4:Vets: vet_id, name, specialty, contact, experience
Table 5:Treatments: treat_id, app_id, medicine, duration, cost

25. Travel Agency
Table 1:Packages: package_id, name, price, duration, type
Table 2:Destinations: dest_id, name, country, climate, rating
Table 3:Clients: client_id, name, contact, email, nationality
Table 4:Bookings: booking_id, client_id, package_id, date, members
Table 5:Payments: payment_id, booking_id, amount, method, status

26. Smart Home Management System
Table 1: Devices: device_id, name, type, status, location
Table 2: Users: user_id, name, email, access_level, registered_date
Table 3: UsageLogs: log_id, device_id, user_id, action, timestamp
Table 4: Alerts: alert_id, device_id, message, priority, date
Table 5: Rooms: room_id, name, floor, device_count, purpose

27. Digital Marketing Campaign Tracker
Table 1: Campaigns: campaign_id, name, platform, budget, duration
Table 2: Ads: ad_id, campaign_id, type, impressions, clicks
Table 3: Clients: client_id, name, industry, contact, region
Table 4: Teams: team_id, name, members_count, head_id, specialization
Table 5: Reports: report_id, campaign_id, date_generated, CTR, ROI

28. Insurance Management System
Table 1: Policies: policy_id, type, premium, duration, coverage
Table 2: Policy_Holders: holder_id, name, dob, address, contact
Table 3: Claims: claim_id, policy_id, amount, reason, status
Table 4: Agents: agent_id, name, region, clients_count, experience
Table 5: Payments: payment_id, holder_id, policy_id, amount, date

29. Real Estate Management
Table 1: Properties: property_id, type, location, price, status
Table 2: Owners: owner_id, name, contact, email, address
Table 3: Clients: client_id, name, contact, budget, preferred_location
Table 4: Deals: deal_id, property_id, client_id, agent_id, status
Table 5: Agents: agent_id, name, phone, region, license_no

30. Online Grocery Delivery System
Table 1: Products: product_id, name, category, price, stock
Table 2: Customers: cust_id, name, phone, address, email
Table 3: Orders: order_id, cust_id, order_date, total_amount, status
Table 4: Deliveries: delivery_id, order_id, delivery_person, time, feedback
Table 5: Staff: staff_id, name, role, shift, contact

*/

-- ---------------------------------------------- Database Queries ---------------------------------------------------




-- ---------------------------------------- table queris----------------------------------------------------------
-- create table 1
create table schools(
teacher_id int primary key,
 student_name varchar(100),
 address varchar(100),
 email varchar(100),
 contact varchar(10)
 );
 -- to display table data
 select * from schools
  -- insert record into table 1
  
  
  