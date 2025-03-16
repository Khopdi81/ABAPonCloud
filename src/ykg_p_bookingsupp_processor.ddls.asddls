@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Processor Booking Supp view for travel'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity YKG_P_BOOKINGSUPP_PROCESSOR
  as projection on YKG_I_BOOKINGSUPP
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Booking : redirected to parent YKG_P_BOOKING_PROCESSOR,
      _Suppliment,
      _SupplimentText,
      _Travel  : redirected to YKG_P_TRAVEL_PROCESSOR
}
