- view: opportunity
  sql_table_name: OPPORTUNITY
  fields:

  - dimension: renewal_opportunity_id
    sql: ${TABLE}.RENEWAL_OPPORTUNITY_ID

  - dimension: account_id
    # hidden: true
    sql: ${TABLE}.ACCOUNT_ID

  - dimension: acv
    type: int
    sql: ${TABLE}.ACV

  - dimension: amount
    sql: ${TABLE}.AMOUNT

  - dimension: campaign_id
    sql: ${TABLE}.CAMPAIGN_ID

  - dimension: churn_status_c
    sql: ${TABLE}.CHURN_STATUS_C

  - dimension_group: closed
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.CLOSED_DATE

  - dimension: contract_length_c
    sql: ${TABLE}.CONTRACT_LENGTH_C

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CREATED_AT

  - dimension: id
    sql: ${TABLE}.ID
    primary_key: true

  - dimension: is_cancelled_c
    sql: ${TABLE}.IS_CANCELLED_C

  - dimension: is_closed
    sql: ${TABLE}.IS_CLOSED

  - dimension: is_won
    sql: ${TABLE}.IS_WON

  - dimension: lead_source
    sql: ${TABLE}.LEAD_SOURCE

  - dimension: lost_reason_c
    sql: ${TABLE}.LOST_REASON_C

  - dimension: mrr
    type: int
    sql: ${TABLE}.MRR

  - dimension: next_step
    sql: ${TABLE}.NEXT_STEP

  - dimension: nrr
    type: int
    sql: ${TABLE}.NRR

  - dimension: probability
    type: int
    sql: ${TABLE}.PROBABILITY

  - dimension: renewal_number_c
    sql: ${TABLE}.RENEWAL_NUMBER_C

  - dimension: stage_name
    sql: ${TABLE}.STAGE_NAME

  - dimension: total_contract_value_c
    type: int
    sql: ${TABLE}.TOTAL_CONTRACT_VALUE_C

  - dimension: type
    sql: ${TABLE}.TYPE

  - measure: count
    type: count
    drill_fields: [renewal_opportunity_id, stage_name, account.name, account.id]

