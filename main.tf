resource "aws_sns_topic_subscription" "this" {
  for_each               = { for r in var.sns_topic_subscriptions : "${r.name}:${r.protocol}:${r.endpoint}:${r.raw_message_delivery}" => r }
  topic_arn              = each.value.topic_arn
  protocol               = each.value.protocol
  endpoint               = each.value.endpoint
  endpoint_auto_confirms = each.value.endpoint_auto_confirms
  raw_message_delivery   = lookup(each.value, "raw_message_delivery", null)
}
