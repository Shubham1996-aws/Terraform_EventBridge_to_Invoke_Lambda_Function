resource "aws_cloudwatch_event_rule" "profile_generator_lambda_event_rule" {
  name = "profile-generator-lambda-event-rule"
  description = "retry scheduled every 1 min"
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "profile_generator_lambda_target" {
  arn = var.lambda_function_arn
  rule = aws_cloudwatch_event_rule.profile_generator_lambda_event_rule.name
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_rw_fallout_retry_step_deletion_lambda" {
  statement_id = "AllowExecutionFromCloudWatch"
  action = "lambda:InvokeFunction"
  function_name = var.function_name
  principal = "events.amazonaws.com"
  source_arn = aws_cloudwatch_event_rule.profile_generator_lambda_event_rule.arn
}
