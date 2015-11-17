- connection: maston_dashdb

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: stripe_pmts
- explore: user_info
# - explore: user_subscriptions



