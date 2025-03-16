@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Bookings'
@Metadata.ignorePropagatedAnnotations: true
define view entity YKG_I_BOOKING
  as select from /dmo/booking_m
  composition[0..*] of YKG_I_BOOKINGSUPP as _BookingSupp
  association to parent YKG_I_TRAVEL as _Travel on _Travel.TravelId = $projection.TravelId
  association [1..1] to /DMO/I_Customer          as _Customer      on _Customer.CustomerID = $projection.CustomerId
  association [1..1] to /DMO/I_Carrier           as _Carrier       on _Carrier.AirlineID = $projection.CarrierId
  association [1..1] to /DMO/I_Connection        as _Connection    on _Connection.ConnectionID = $projection.ConnectionId
  association [1..1] to /DMO/I_Booking_Status_VH as _BookingStatus on _BookingStatus.BookingStatus = $projection.BookingStatus
{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      //Association
      _Customer,
      _Carrier,
      _Connection,
      _BookingStatus,
      _Travel,
      _BookingSupp
}
