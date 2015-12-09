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
    type: yesno
    sql: ${TABLE}.CAPTURED

  - dimension: card_brand
    sql: ${TABLE}.CARD_BRAND

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

  - dimension_group: created
    type: time
    timeframes: [date, week, month, year,day_of_week, week_of_year]
    convert_tz: false
    sql: ${TABLE}.CREATED__UTC_

  - dimension: customer_name
    sql: replace(${TABLE}.CUSTOMER_DESCRIPTION,',','')
    html: |
      {{ linked_value }}
      <a href="/dashboards/8?Customer={{ value | encode_uri }}" target="_new">
      <img src="/images/qr-graph-line@2x.png" height=20 width=20></a>

  - dimension: customer_id
    sql: ${TABLE}.CUSTOMER_ID

  - dimension: mode
    sql: ${TABLE}.MODE

  - dimension: status
    sql: ${TABLE}.STATUS

  - measure: count
    type: count
    drill_fields: [id]

  - measure: total_amount
    type: sum
    sql: ${TABLE}.AMOUNT
    value_format: '$#,###'
    
  - measure: total_amount_refunded
    type: sum
    sql: ${TABLE}.AMOUNT_REFUNDED
    value_format: '$#,###'

  - measure: total_converted_amount
    type: sum
    sql: ${TABLE}.CONVERTED_AMOUNT
    value_format: '$#,###'
    
  - measure: cumulative_total_amount
    type: running_total
    sql: ${total_amount}
    value_format: '$#,###'
  
  - measure: percent_of_total_amount
    type: percent_of_total
    sql: ${total_amount}