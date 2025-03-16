@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Travel'
@Metadata.ignorePropagatedAnnotations: true
define root view entity YKG_I_TRAVEL
  as select from /dmo/travel_m
  composition[0..*] of YKG_I_BOOKING as _Booking 
  association [1] to /DMO/I_Agency            as _Agency        on _Agency.AgencyID = $projection.AgencyId
  association [1] to /DMO/I_Customer          as _Customer      on _Customer.CustomerID = $projection.CustomerId
  association [1] to I_Currency               as _Currency      on _Currency.Currency = $projection.CurrencyCode
  association [1] to /DMO/I_Overall_Status_VH as _OverallStatus on _OverallStatus.OverallStatus = $projection.OverallStatus
{
  key travel_id       as TravelId,
      agency_id       as AgencyId,
      customer_id     as CustomerId,
      begin_date      as BeginDate,
      end_date        as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee     as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price     as TotalPrice,
      currency_code   as CurrencyCode,
      description     as Description,
      case overall_status
        when 'O' then 'Open'
        when 'A' then 'Approved'
        when 'R' then 'Rejected'
        when 'X' then 'Cancelled'
        end as StatusText,
      case overall_status
        when 'O' then 1
        when 'A' then 3
        when 'R' then 2
        when 'X' then 2 
        end as StatusCriticality,
      overall_status  as OverallStatus,
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      //Associations
      _Agency,
      _Customer,
      _Currency,
      _OverallStatus,
      _Booking
}
