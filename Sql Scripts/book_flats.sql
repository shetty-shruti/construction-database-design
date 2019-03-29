select * from customer;

select * from flats;

call SP_PLACE_ORDERS(2,12);
call SP_PLACE_ORDERS(3,13);
call SP_PLACE_ORDERS(4,16);
call SP_PLACE_ORDERS(5,17);
call SP_PLACE_ORDERS(6,18);
call SP_PLACE_ORDERS(1,20);
call SP_PLACE_ORDERS(2,330);
call SP_PLACE_ORDERS(4,123);
call SP_PLACE_ORDERS(5,100);

CALL SP_CANCEL_ORDER(15,100);

select * from flats where FLAT_BOOKED_STATUS='Y';
select * from orders;


