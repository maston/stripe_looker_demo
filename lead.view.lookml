- view: lead
  sql_table_name: LEAD
  fields:

  - dimension: id
    primary_key: true
    sql: ${TABLE}.ID

  - dimension: account_id
    # hidden: true
    sql: ${TABLE}.ACCOUNT_ID

  - dimension: analyst_name_c
    sql: ${TABLE}.ANALYST_NAME_C

  - dimension: annual_revenue
    sql: ${TABLE}.ANNUAL_REVENUE

  - dimension: city
    sql: ${TABLE}.CITY

  - dimension: company
    sql: ${TABLE}.COMPANY

#   - dimension: converted_account_id
#     sql: ${TABLE}.CONVERTED_ACCOUNT_ID
    
  - dimension: converted_contact_id
    sql: ${TABLE}.CONVERTED_CONTACT_ID

  - dimension: converted_opportunity_id
    sql: ${TABLE}.CONVERTED_OPPORTUNITY_ID

  - dimension: country
    sql: ${TABLE}.COUNTRY

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CREATED_AT

  - dimension: current_customer_c
    sql: ${TABLE}.CURRENT_CUSTOMER_C

  - dimension: department_c
    sql: ${TABLE}.DEPARTMENT_C

  - dimension: email
    sql: ${TABLE}.EMAIL

  - dimension: grouping_c
    sql: ${TABLE}.GROUPING_C

  - dimension: intro_meeting_c
    sql: ${TABLE}.INTRO_MEETING_C

  - dimension: is_converted
    sql: ${TABLE}.IS_CONVERTED

  - dimension: job_function_c
    sql: ${TABLE}.JOB_FUNCTION_C

  - dimension: lead_processing_status_c
    sql: ${TABLE}.LEAD_PROCESSING_STATUS_C

  - dimension: name
    sql: ${TABLE}.NAME

  - dimension: number_of_employees
    type: int
    sql: ${TABLE}.NUMBER_OF_EMPLOYEES

  - dimension: state
    sql: ${TABLE}.STATE

  - dimension: status
    sql: ${TABLE}.STATUS

  - dimension: territory_c
    sql: ${TABLE}.TERRITORY_C

  - dimension: title
    sql: ${TABLE}.TITLE

  - dimension: year_founded_c
    sql: ${TABLE}.YEAR_FOUNDED_C

  - dimension: zendesk_organization
    type: int
    sql: ${TABLE}.ZENDESK_ORGANIZATION

  - measure: count
    type: count
    drill_fields: [id, name, account.name, account.id]

