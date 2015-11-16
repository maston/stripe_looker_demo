- view: stripe_pmts
  sql_table_name: STRIPE_PMTS
  fields:

  - dimension: id
    primary_key: true
    sql: ${TABLE}.ID

  - dimension: amount
    type: number
    sql: ${TABLE}.AMOUNT

  - dimension: amount_refunded
    type: number
    sql: ${TABLE}.AMOUNT_REFUNDED

  - dimension: captured
    sql: ${TABLE}.CAPTURED

  - dimension: card_address_city
    sql: ${TABLE}.CARD_ADDRESS_CITY

  - dimension: card_address_country
    sql: ${TABLE}.CARD_ADDRESS_COUNTRY

  - dimension: card_address_line1
    sql: ${TABLE}.CARD_ADDRESS_LINE1

  - dimension: card_address_line2
    sql: ${TABLE}.CARD_ADDRESS_LINE2

  - dimension: card_address_state
    sql: ${TABLE}.CARD_ADDRESS_STATE

  - dimension: card_address_zip
    sql: ${TABLE}.CARD_ADDRESS_ZIP

  - dimension: card_avs_line1_status
    sql: ${TABLE}.CARD_AVS_LINE1_STATUS

  - dimension: card_avs_zip_status
    sql: ${TABLE}.CARD_AVS_ZIP_STATUS

  - dimension: card_brand
    sql: ${TABLE}.CARD_BRAND

  - dimension: card_cvc_status
    sql: ${TABLE}.CARD_CVC_STATUS

  - dimension: card_fingerprint
    sql: ${TABLE}.CARD_FINGERPRINT

  - dimension: card_funding
    sql: ${TABLE}.CARD_FUNDING

  - dimension: card_issue_country
    sql: ${TABLE}.CARD_ISSUE_COUNTRY

  - dimension: converted_amount
    type: number
    sql: ${TABLE}.CONVERTED_AMOUNT

  - dimension: converted_amount_refunded
    type: number
    sql: ${TABLE}.CONVERTED_AMOUNT_REFUNDED

  - dimension: converted_currency
    sql: ${TABLE}.CONVERTED_CURRENCY

  - dimension: created__utc_
    sql: ${TABLE}.CREATED__UTC_

  - dimension: currency
    sql: ${TABLE}.CURRENCY

  - dimension: customer_description
    sql: ${TABLE}.CUSTOMER_DESCRIPTION

  - dimension: customer_id
    sql: ${TABLE}.CUSTOMER_ID

  - dimension: description
    sql: ${TABLE}.DESCRIPTION

  - dimension: destination
    sql: ${TABLE}.DESTINATION

  - dimension: dispute_date__utc_
    sql: ${TABLE}.DISPUTE_DATE__UTC_

  - dimension: dispute_evidence_due__utc_
    sql: ${TABLE}.DISPUTE_EVIDENCE_DUE__UTC_

  - dimension: dispute_reason
    sql: ${TABLE}.DISPUTE_REASON

  - dimension: dispute_status
    sql: ${TABLE}.DISPUTE_STATUS

  - dimension: disputed_amount
    sql: ${TABLE}.DISPUTED_AMOUNT

  - dimension: fee
    type: number
    sql: ${TABLE}.FEE

  - dimension: invoice_id
    sql: ${TABLE}.INVOICE_ID

  - dimension: mode
    sql: ${TABLE}.MODE

  - dimension: payment_source_type
    sql: ${TABLE}.PAYMENT_SOURCE_TYPE

  - dimension: statement_descriptor
    sql: ${TABLE}.STATEMENT_DESCRIPTOR

  - dimension: status
    sql: ${TABLE}.STATUS

  - dimension: tax
    type: int
    sql: ${TABLE}.TAX

  - dimension: transfer
    sql: ${TABLE}.TRANSFER

  - measure: count
    type: count
    drill_fields: [id]

