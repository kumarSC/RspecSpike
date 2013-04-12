module Sections
  def sections
    {
        "language_preference" => "TB_iframeContent",
        "select_language" => "//*[@id='us']/ul/li[1]/a",
        "book_a_trip" => "nav-widget-booking",
        #Flight Search
        "one_way" => "oneWayBtn",
        "origin" => "//input[@id='originCity']",
        "destination" => "destinationCity",
        "departure_date" => "departureDate",
        "todays_date" => "//*[@class='calcell today']",
        "submit" => "findFlightsSubmit",

        #Flight Result
        "select_flight" => "fareBtnRight",
        #Flight Detail
        "continue" => "//input[@id='continue_button']",

        # Passenger Info
        "pax_first_name" => "paxFirstName[0]",
        "pax_last_name" => "paxLastName[0]",
        "gender" => "secureFltGender[0]",
        "telephone" => "telephone[0]",
        "dob_month" => "secureFltDOBmm[0]",
        "dob_day" => "secureFltDOBdd[0]",
        "dob_year" => "secureFltDOByy[0]",
        "email" => "email",
        "verify_email" => "emailVerify",
        "purchase" => "purchase_button",

        #Payment Info
        "cc_first_name" => "ccFirstMiddleName",
        "cc_last_name" => "ccLastName",
        "credit_card_number" => "ccNumber",
        "credit_card_expiry_month" => "newCcExpiryMonth",
        "credit_card_expiry_year" => "newCcExpiryYear",
        "security_code" => "ccNumberFieldNew",
        "address" => "addr1",
        "city" => "cityCountyWard",
        "state_province" => "stateProv",
        "postal_code" => "postal",
        "trip_insurance_frame" => "ntrMerchandisingPurchaseTripInsuranceFrame",

        #Purchase Confirmation
        "purchase_confirmation" => "confirmation_purchase"
    }
  end
end
