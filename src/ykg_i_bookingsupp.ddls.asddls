@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Booking Suppliments'
@Metadata.ignorePropagatedAnnotations: true
define view entity YKG_I_BOOKINGSUPP
  as select from /dmo/booksuppl_m
  association to parent YKG_I_BOOKING as _Booking on _Booking.TravelId = $projection.TravelId and _Booking.BookingId = $projection.BookingId
    association [1..1] to YKG_I_TRAVEL as _Travel on _Travel.TravelId = $projection.TravelId
    association [1..1] to /DMO/I_Supplement as _Suppliment on _Suppliment.SupplementID = $projection.SupplementId
    association [1..1] to /DMO/I_SupplementText as _SupplimentText on _SupplimentText.SupplementID = $projection.SupplementId
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      //Associations
      _Travel,
      _Suppliment,
      _SupplimentText,
      _Booking
}
