
--Query A--

Use DAT601_Jacob_Stringer;


exec dbo.Create_New_Subscriber 7,'Yodel','Yodel@Gmail',7264815,'Yohan','Drew',21,'Joyce Place','Richmond','Nelson','7020',9;


Go

--Query B--

Use DAT601_Jacob_Stringer;


exec dbo.Sold_Subscriptions 'Jemma','Nieves';


Go

--Query C--

Use DAT601_Jacob_Stringer;


exec dbo.Contract_Drone_Locations;


Go


--Query D--

Use DAT601_Jacob_Stringer;


exec dbo.Contract_Drone_Data 'Robs Company';


Go

--Query E--

Use DAT601_Jacob_Stringer;


exec dbo.Drone_Viewers;


Go

--Query F--

Use DAT601_Jacob_Stringer;


exec dbo.Drone_Parts 1;


Go

--Query G--

Use DAT601_Jacob_Stringer;


exec dbo.Update_Location_And_Reagion_Of_Drone 1,7000,2500,'High Forest','Rain Forest'


Go

--Query H--

Use DAT601_Jacob_Stringer;


exec dbo.Delete_Contract_Saved_Data 1


Go

--Query I--

Use DAT601_Jacob_Stringer;


exec dbo.Store_Data 1


Go
