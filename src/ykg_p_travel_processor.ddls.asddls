@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Processor Projection view for travel'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity YKG_P_TRAVEL_PROCESSOR
  provider contract transactional_query
  as projection on YKG_I_TRAVEL
{
      @ObjectModel.text.element: [ 'Description' ]
  key TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Consumption.valueHelpDefinition: [{
          entity: {
          name: '/DMO/I_Agency',
          element: 'Name'
      }
       }]
      AgencyId,
      @Semantics.text: true
      _Agency.Name        as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      @Consumption.valueHelpDefinition: [{
        entity: {
                  name: '/DMO/I_Customer',
                  element: 'CustomerID'
                }
       }]
      CustomerId,
      @Semantics.text: true
      _Customer.FirstName as CustomerName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      @ObjectModel.text.element: [ 'StatusText' ]
      @Consumption.valueHelpDefinition: [{
          entity: {
                    name: '/DMO/I_Overall_Status_VH_Text',
                    element: 'OverallStatus'
                  }
       }]
      OverallStatus,
      @Semantics.text: true
      StatusText,
      StatusCriticality,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child YKG_P_BOOKING_PROCESSOR,
      _Currency,
      _Customer,
      _OverallStatus
}
