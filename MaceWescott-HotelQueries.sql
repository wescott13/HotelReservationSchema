USE MaceWescottHotelData
GO

--1.  Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.
SELECT
	GUESTS.FirstName,
	GUESTS.LastName,
	ROOMS.RoomNumber,
	GUEST_RESERVATION.StartDate,
	GUEST_RESERVATION.EndDate
FROM ROOMS
INNER JOIN ROOM_RESERVATIONS ON ROOMS.RoomID = ROOM_RESERVATIONS.RoomID
INNER JOIN GUEST_RESERVATION ON ROOM_RESERVATIONS.GuestReservationID = GUEST_RESERVATION.GuestReservationID
INNER JOIN GUESTS ON GUEST_RESERVATION.GuestID = GUESTS.GuestID
WHERE
	EndDate < '7/31/2023'; 

--2.  Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.
SELECT
	GUESTS.FirstName,
	GUESTS.LastName,
	ROOMS.RoomNumber,
	GUEST_RESERVATION.StartDate,
	GUEST_RESERVATION.EndDate
FROM ROOMS
INNER JOIN ROOM_AMENITY ON ROOM_AMENITY.RoomID = ROOMS.RoomID
INNER JOIN AMENITY ON ROOM_AMENITY.AmenityID = AMENITY.AmenityID
INNER JOIN ROOM_RESERVATIONS ON ROOM_RESERVATIONS.RoomID = ROOMS.RoomID
INNER JOIN GUEST_RESERVATION ON ROOM_RESERVATIONS.GuestReservationID = GUEST_RESERVATION.GuestReservationID
INNER JOIN GUESTS ON GUEST_RESERVATION.GuestID = GUESTS.GuestID
WHERE AMENITY.Amenity = 'Jacuzzi';
--11 rows

--3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.) 
SELECT
	GUESTS.FirstName,
	GUESTS.LastName,
	ROOMS.RoomNumber,
	GUEST_RESERVATION.StartDate,
	GUEST_RESERVATION.EndDate,
	ROOM_RESERVATIONS.Adults,
	ROOM_RESERVATIONS.Children,
	ROOM_RESERVATIONS.Adults + ROOM_RESERVATIONS.Children AS AllGuests
FROM ROOMS
INNER JOIN ROOM_RESERVATIONS ON ROOM_RESERVATIONS.RoomID = ROOMS.RoomID
INNER JOIN GUEST_RESERVATION ON ROOM_RESERVATIONS.GuestReservationID = GUEST_RESERVATION.GuestReservationID
INNER JOIN GUESTS ON GUEST_RESERVATION.GuestID = GUESTS.GuestID
WHERE GUESTS.FirstName = 'Mace' and GUESTS.LastName = 'Wescott';
--2 rows

--4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room. 	
SELECT
	ROOMS.RoomNumber,
	ROOM_RESERVATIONS.GuestReservationID,
	(DATEDIFF(DAY, GUEST_RESERVATION.StartDate, GUEST_RESERVATION.EndDate)* ROOMS.BasePrice) AS PerRoomCost
FROM ROOMS
LEFT OUTER JOIN ROOM_RESERVATIONS ON ROOM_RESERVATIONS.RoomID = ROOMS.RoomID
LEFT OUTER JOIN GUEST_RESERVATION ON ROOM_RESERVATIONS.GuestReservationID = GUEST_RESERVATION.GuestReservationID
--26 rows

--5.  Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.
SELECT
	ROOMS.RoomNumber,
	ROOM_RESERVATIONS.Adults,
	ROOM_RESERVATIONS.Children,
	ROOM_RESERVATIONS.Adults + ROOM_RESERVATIONS.Children AS AllGuests
FROM ROOMS
INNER JOIN ROOM_RESERVATIONS ON ROOM_RESERVATIONS.RoomID = ROOMS.RoomID
INNER JOIN GUEST_RESERVATION ON ROOM_RESERVATIONS.GuestReservationID = GUEST_RESERVATION.GuestReservationID
WHERE
	StartDate > '4/1/2023'and EndDate < '4/30/2023' and (ROOM_RESERVATIONS.Adults + ROOM_RESERVATIONS.Children) >2; 
-- No returns

--6.  Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.
SELECT
	GUESTS.FirstName + ' ' + GUESTS.LastName AS GuestName,
	COUNT(GUEST_RESERVATION.GuestID) AS ReservationsPerGuest
FROM GUEST_RESERVATION
INNER JOIN GUESTS ON GUESTS.GuestID = GUEST_RESERVATION.GuestID
GROUP BY GUESTS.LastName, GUESTS.FirstName
ORDER BY ReservationsPerGuest DESC, GUESTS.LastName
--11 rows

--7.  Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)
SELECT
	GUESTS.FirstName + ' ' + GUESTS.LastName AS GuestName,
	GUESTS.[Address],
	GUESTS.City,
	GUESTS.StateAbbr,
	GUESTS.PostalCode,
	GUESTS.Phone
FROM GUESTS
WHERE GUESTS.Phone = '(111) 111-1111'
--1 row



