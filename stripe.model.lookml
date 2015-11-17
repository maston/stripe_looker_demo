- connection: maston_dashdb

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: stripe_pmts

# - explore: user_info

- explore: user_signups
  joins: 
    - join: user_subscriptions
      sql_on: ${user_signups.user_id} = ${user_subscriptions.user_id}
      relationship: many_to_one




