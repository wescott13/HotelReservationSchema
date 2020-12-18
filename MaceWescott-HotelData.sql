USE MaceWescottHotelData
GO


INSERT INTO GUESTS (FirstName, LastName, [Address], City, StateAbbr, PostalCode, Phone) VALUES 
	('Mace', 'Wescott', '123 Main Street', 'Anywhere', 'MN', '56764','(111) 111-1111'),
	('Mack', 'Simmer', '379 Old Shore Street',	'Council Bluffs', 'IA',	'51501', '(291) 553-0508'),
	('Bettyann', 'Seery', '750 Wintergreen Dr.', 'Wasilla',	'AK', '99654', '(478) 277-9632'),
	('Duane', 'Cullison', '9662 Foxrun Lane',	'Harlingen',	'TX',	'78552',	'(308) 494-0198'),
	('Karie', 'Yang',	'9378 W. Augusta Ave.',	'West Deptford',	'NJ',	'08096',	'(214) 730-0298'),
	('Aurore', 'Lipton',	'762 Wild Rose Street',	'Saginaw',	'MI',	'48601',	'(377) 507-0974'),
	('Zachery', 'Luechtefeld',	'7 Poplar Dr.',	'Arvada',	'CO',	'80003',	'(814) 485-2615'),
	('Jeremiah', 'Pendergrass',	'70 Oakwood St.',	'Zion',	'IL',	'60099',	'(279) 491-0960'),
	('Walter', 'Holaway',	'7556 Arrowhead St.',	'Cumberland',	'RI',	'02864',	'(446) 396-6785'),
	('Wilfred', 'Vise',	'77 West Surrey Street',	'Oswego',	'NY',	'13126	',	'(834) 727-1001'),
	('Maritza', 'Tilton',	'939 Linda Rd.',	'Burke',	'VA',	'22015	',	'(446) 351-6860'),
	('Joleen', 'Tison',	'87 Queen St.',	'Drexel Hill',	'PA',	'19026',	'(231) 893-2755');

INSERT INTO AMENITY(Amenity) VALUES
	('Microwave'),		--1 Microwave
	('Jacuzzi'),		--2 Jacuzzi
	('Refrigerator'),	--3 Refrigerator
	('Oven');			--4 Oven

INSERT INTO ROOMTYPE(RoomType) VALUES
	('Single'), --1
	('Double'),  --2
	('Suite');  --3

INSERT INTO ROOMS(RoomNumber, RoomTypeID, ADA, StandardOccupancy, MaximumOccupancy, BasePrice, ExtraPerson) VALUES
	('201', 2, 0, 2, 4, 199.99, 10),
	('202', 2, 1, 2, 4, 174.99, 10),
	('203', 2, 0, 2, 4, 199.99, 10),
	('204', 2, 1, 2, 4, 174.99, 10),
	('205', 1, 0, 2, 2, 174.99, null),
	('206', 1, 1, 2, 2, 149.99, null),
	('207', 1, 0, 2, 2, 174.99, null),
	('208', 1, 1, 2, 2, 149.99, null),
	('301', 2, 0, 2, 4, 199.99, 10),
	('302', 2, 1, 2, 4, 174.99, 10),
	('303', 2, 0, 2, 4, 199.99, 10),
	('304', 2, 1, 2, 4, 174.99, 10),
	('305', 1, 0, 2, 2, 174.99, null),
	('306', 1, 1, 2, 2, 149.99, null),
	('307', 1, 0, 2, 2, 174.99, null),
	('308', 1, 1, 2, 2, 149.99, null),
	('401', 3, 1, 3, 8, 399.99, 20),
	('402', 3, 1, 3, 8, 399.99, 20);


INSERT INTO ROOM_AMENITY(RoomID, AmenityID) VALUES
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '201'),1), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '201'),2),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '202'),1),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '203'),1), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '203'),2),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '204'),3),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '205'),1), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '205'),2), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '205'),3),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '206'),1), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '206'),3),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '207'),1), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '207'),2), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '207'),3),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '208'),1), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '208'),3),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '301'),1), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '301'),2),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '302'),3),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '303'),1), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '303'),2),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '304'),3),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '305'),1), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '305'),2), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '305'),3),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '306'),1), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '306'),3),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '307'),1), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '307'),2), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '307'),3),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '308'),1), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '308'),3),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '401'),1), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '401'),3), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '401'),4),
	((SELECT RoomID FROM ROOMS WHERE RoomNumber = '402'),1), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '402'),3), ((SELECT RoomID FROM ROOMS WHERE RoomNumber = '402'),4);

INSERT INTO GUEST_RESERVATION(GuestID, StartDate, EndDate) VALUES
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Mack' and LastName='Simmer') ,'2/2/2023',	'2/4/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Bettyann' and LastName='Seery') ,'2/5/2023',	'2/10/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Duane' and LastName='Cullison') ,'2/22/2023',	'2/24/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Karie' and LastName='Yang') ,'3/6/2023',	'3/7/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Mace' and LastName='Wescott') ,'3/17/2023',	'3/20/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Aurore' and LastName='Lipton') ,'3/18/2023',	'3/23/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Zachery' and LastName='Luechtefeld') ,'3/29/2023',	'3/31/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Jeremiah' and LastName='Pendergrass') ,'3/31/2023',	'4/5/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Walter' and LastName='Holaway') ,'4/9/2023',	'4/13/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Wilfred' and LastName='Vise') ,'4/23/2023',	'4/24/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Maritza' and LastName='Tilton') ,'5/30/2023',	'6/2/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Joleen' and LastName='Tison') ,'6/10/2023',	'6/14/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Aurore' and LastName='Lipton') ,'6/17/2023',	'6/18/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Mace' and LastName='Wescott') ,'6/28/2023',	'7/2/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Walter' and LastName='Holaway') ,'7/13/2023',	'7/14/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Wilfred' and LastName='Vise') ,'7/18/2023',	'7/21/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Bettyann' and LastName='Seery') ,'7/28/2023',	'7/29/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Bettyann' and LastName='Seery') ,'8/30/2023',	'9/1/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Mack' and LastName='Simmer') ,'9/16/2023',	'9/17/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Karie' and LastName='Yang') ,'9/13/2023',	'9/15/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Duane' and LastName='Cullison') ,'11/22/2023',	'11/25/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Mack' and LastName='Simmer') ,'11/22/2023',	'11/25/2023'),
((SELECT GUESTID FROM GUESTS WHERE FirstName = 'Maritza' and LastName='Tilton') ,'12/24/2023',	'12/28/2023');

INSERT INTO ROOM_RESERVATIONS(GuestReservationID, RoomID, Adults, Children, TotalRoomCost) VALUES
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '2/2/2023' and EndDate = '2/4/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Mack' and GUESTS.LastName = 'Simmer')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '308'),
	1,0,299.98),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '2/5/2023' and EndDate = '2/10/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Bettyann' and GUESTS.LastName = 'Seery')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '203'),
	2,1,999.95),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '2/22/2023' and EndDate = '2/24/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Duane ' and GUESTS.LastName = 'Cullison')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '305'),
	2,0,349.98),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '3/6/2023' and EndDate = '3/7/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Karie' and GUESTS.LastName = 'Yang')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '201'),
	2,2,199.99),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '3/17/2023' and EndDate = '3/20/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Mace' and GUESTS.LastName = 'Wescott')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '307'),
	1,1,524.97),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '3/18/2023' and EndDate = '3/23/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Aurore' and GUESTS.LastName = 'Lipton')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '302'),
	3,0,924.95),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '3/29/2023' and EndDate = '3/31/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Zachery' and GUESTS.LastName = 'Luechtefeld')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '202'),
	2,2,349.98),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '3/31/2023' and EndDate = '4/5/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Jeremiah' and GUESTS.LastName = 'Pendergrass')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '304'),
	2,0,874.95),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '4/9/2023' and EndDate = '4/13/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Walter' and GUESTS.LastName = 'Holaway')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '301'),
	1,0,799.96),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '4/23/2023' and EndDate = '4/24/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Wilfred' and GUESTS.LastName = 'Vise')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '207'),
	1,1,174.99),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '5/30/2023' and EndDate = '6/2/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Maritza' and GUESTS.LastName = 'Tilton')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '401'),
	2,4,1199.97),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '6/10/2023' and EndDate = '6/14/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Joleen' and GUESTS.LastName = 'Tison')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '206'),
	2,0,599.96),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '6/10/2023' and EndDate = '6/14/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Joleen' and GUESTS.LastName = 'Tison')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '208'),
	1,0,599.96),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '6/17/2023' and EndDate = '6/18/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Aurore' and GUESTS.LastName = 'Lipton')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '304'),
	3,0,184.99),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '6/28/2023' and EndDate = '7/2/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Mace' and GUESTS.LastName = 'Wescott')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '205'),
	2,0,699.96),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '7/13/2023' and EndDate = '7/14/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Walter' and GUESTS.LastName = 'Holaway')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '204'),
	3,1,184.99),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '7/18/2023' and EndDate = '7/21/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Wilfred' and GUESTS.LastName = 'Vise')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '401'),
	4,2,1259.97),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '7/28/2023' and EndDate = '7/29/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Bettyann' and GUESTS.LastName = 'Seery')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '303'),
	2,1,199.99),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '8/30/2023' and EndDate = '9/1/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Bettyann' and GUESTS.LastName = 'Seery')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '305'),
	1,0,349.98),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '9/16/2023' and EndDate = '9/17/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Mack' and GUESTS.LastName = 'Simmer')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '208'),
	2,0,149.99),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '9/13/2023' and EndDate = '9/15/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Karie' and GUESTS.LastName = 'Yang')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '203'),
	2,2,399.98),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '11/22/2023' and EndDate = '11/25/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Duane' and GUESTS.LastName = 'Cullison')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '401'),
	2,2,1199.97),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '11/22/2023' and EndDate = '11/25/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Mack' and GUESTS.LastName = 'Simmer')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '206'),
	2,0,449.97),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '11/22/2023' and EndDate = '11/25/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Mack' and GUESTS.LastName = 'Simmer')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '301'),
	2,2,599.97),
	((SELECT GuestReservationID FROM GUEST_RESERVATION WHERE StartDate = '12/24/2023' and EndDate = '12/28/2023'
	and GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Maritza' and GUESTS.LastName = 'Tilton')), (SELECT RoomID FROM ROOMS WHERE RoomNumber = '302'),
	2,0,699.96)
	;

SELECT * FROM GUESTS;

DELETE FROM ROOM_RESERVATIONS WHERE GuestReservationID = (SELECT GuestReservationID FROM GUEST_RESERVATION WHERE GUESTID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Jeremiah' and GUESTS.LastName = 'Pendergrass'));
DELETE FROM GUEST_RESERVATION WHERE GuestID = (SELECT GUESTID FROM GUESTS WHERE GUESTS.FirstName = 'Jeremiah' and GUESTS.LastName = 'Pendergrass');
DELETE FROM GUESTS WHERE GUESTS.FirstName = 'Jeremiah' and GUESTS.LastName = 'Pendergrass';

SELECT * FROM GUESTS;
