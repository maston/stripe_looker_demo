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

  - dimension: churn_status
    sql: ${TABLE}.CHURN_STATUS_C

  - dimension_group: closed
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.CLOSED_DATE

  - dimension: contract_length
    sql: ${TABLE}.CONTRACT_LENGTH_C

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.CREATED_AT

  - dimension: id
    sql: ${TABLE}.ID
    primary_key: true

  - dimension: is_cancelled
    type: yesno
    sql: ${TABLE}.IS_CANCELLED_C = 't'

  - dimension: is_closed
    type: yesno
    sql: ${TABLE}.IS_CLOSED = 't'

  - dimension: is_won
    sql: ${TABLE}.IS_WON = 't'
    type: yesno

  - dimension: lead_source
    sql: ${TABLE}.LEAD_SOURCE

  - dimension: lost_reason
    sql: ${TABLE}.LOST_REASON_C

  - dimension: mrr
    type: int
    label: "MRR"
    sql: ${TABLE}.MRR

  - dimension: next_step
    sql: ${TABLE}.NEXT_STEP

  - dimension: nrr
    type: int
    label: "NRR"
    sql: ${TABLE}.NRR

  - dimension: probability
    type: int
    sql: ${TABLE}.PROBABILITY

  - dimension: renewal_number
    sql: ${TABLE}.RENEWAL_NUMBER_C

  - dimension: stage_name
    sql: ${TABLE}.STAGE_NAME

  - dimension: total_contract_value
    type: int
    sql: ${TABLE}.TOTAL_CONTRACT_VALUE_C

  - dimension: type
    sql: ${TABLE}.TYPE

  - measure: count
    type: count
    drill_fields: [id, stage_name, account.name]
  
  - measure: count_won
    type: count
    filter: 
      is_won: yes
    drill_fields: [opportunity.id, account.name, stage_name, type, total_acv]
  
  - measure: count_lost
    type: count
    filters:
      is_closed: Yes
      is_won: No
    drill_fields: [opportunity.id, account.name, stage_name, type, total_acv]
  
  - measure: count_open
    type: count
    filters:
      is_closed: No
    drill_fields: [opportunity.id, account.name, stage_name, type, total_acv]
  
  - measure: total_mrr
    label: 'Total MRR (Closed/Won)'
    type: sum
    sql: ${mrr}
    filters:
      is_won: Yes    
    drill_fields: [opportunity.id, account.name, stage_name, type, total_acv]
    value_format: '[>=1000000]0.00,,"M";[>=1000]0.00,"K";$0.00'
    
  - measure: average_mrr
    label: 'Average MRR (Closed/Won)'
    type: average
    sql: ${mrr}
    filters:
      is_won: Yes    
    drill_fields: [opportunity.id, account.name, stage_name, type, total_acv]
    value_format: '$#,##0'
  
  - measure: cumulative_total
    type: running_total
    sql: ${count}
  
  - measure: win_percentage
    type: number
    sql: 100.00 * ${count_won} / NULLIF(${count}, 0)
    value_format: '#0.00\%'
    
  - measure: open_percentage
    type: number
    sql: 100.00 * ${count_open} / NULLIF(${count}, 0)
    value_format: '#0.00\%'
    
  - measure: total_acv
    type: sum
    sql: ${acv}   
    value_format: '[>=1000000]0.00,,"M";[>=1000]0.00,"K";$0.00' 
    drill_fields: [account.name, type, closed_date, total_acv]
  
  - measure: total_acv_won
    type: sum
    sql: ${acv}   
    filters:
      is_won: Yes
    value_format: '[>=1000000]0.00,,"M";[>=1000]0.00,"K";$0.00' 
    drill_fields: [account.name, type, closed_date, total_acv]
  
  - measure: total_pipeline_acv
    type: sum
    decimals: 1
    sql: ${acv}/1000000.0
    filters:
      is_closed: No
    html: |
      {{ rendered_value }}M
  
  sets:
    opportunity_set:
      - account.name
      - stage_name_funnel
      - type
  

