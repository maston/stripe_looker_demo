- connection: maston_dashdb

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: stripe_pmts
  label: "Stripe Payments"
  view_label: "Stripe Payments"

# - explore: user_info

- explore: user_signups
  joins: 
    - join: user_subscriptions
      sql_on: ${user_signups.user_id} = ${user_subscriptions.user_id}
      relationship: many_to_one
      
- explore: lead
  joins:
    - join: account
      sql_on: ${account.id} = ${lead.account_id}
      relationship: many_to_one
      
    - join: opportunity
      sql_on: ${opportunity.id} = ${lead.converted_opportunity_id}
      relationship: many_to_one

- explore: opportunity
  joins: 
    - join: account
      sql_on: ${account.id} = ${opportunity.account_id}
      relationship: many_to_one
  




