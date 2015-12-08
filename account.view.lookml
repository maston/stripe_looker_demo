- view: account
  sql_table_name: ACCOUNT
  fields:

  - dimension: id
    primary_key: true
    sql: ${TABLE}.ID

  - dimension: account_status_c
    sql: ${TABLE}.ACCOUNT_STATUS_C

  - dimension: annual_revenue
    sql: ${TABLE}.ANNUAL_REVENUE

  - dimension: campaign2_c
    sql: ${TABLE}.CAMPAIGN2_C

  - dimension: city
    sql: ${TABLE}.CITY

  - dimension: country
    sql: ${TABLE}.COUNTRY

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CREATED_AT

  - dimension: current_customer_c
    sql: ${TABLE}.CURRENT_CUSTOMER_C

  - dimension: customer_end_date_c
    sql: ${TABLE}.CUSTOMER_END_DATE_C

  - dimension: customer_reference_c
    sql: ${TABLE}.CUSTOMER_REFERENCE_C

  - dimension: customer_start_date_c
    sql: ${TABLE}.CUSTOMER_START_DATE_C

  - dimension: engagement_stage_c
    sql: ${TABLE}.ENGAGEMENT_STAGE_C

  - dimension: is_partner
    sql: ${TABLE}.IS_PARTNER

  - dimension: market_segment_c
    sql: ${TABLE}.MARKET_SEGMENT_C

  - dimension: name
    sql: ${TABLE}.NAME

  - dimension: number_of_employees
    sql: ${TABLE}.NUMBER_OF_EMPLOYEES

  - dimension: ownerid
    sql: ${TABLE}.OWNERID

  - dimension: state
    sql: ${TABLE}.STATE

  - dimension: type
    sql: ${TABLE}.TYPE

  - dimension: url
    sql: ${TABLE}.URL

  - dimension: vertical_c
    sql: ${TABLE}.VERTICAL_C

  - dimension: zendesk_organization
    sql: ${TABLE}.ZENDESK_ORGANIZATION

  - measure: count
    type: count
    drill_fields: [id, name, lead.count, opportunity.count]

