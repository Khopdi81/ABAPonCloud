@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Processor Booking view for travel'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity YKG_P_BOOKING_PROCESSOR
  as projection on YKG_I_BOOKING
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _BookingStatus,
      _BookingSupp : redirected to composition child YKG_P_BOOKINGSUPP_PROCESSOR,
      _Carrier,
      _Connection,
      _Customer,
      _Travel: redirected to parent YKG_P_TRAVEL_PROCESSOR
}
