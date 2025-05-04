resource "aws_sns_topic" "asg_notifications" {
    name = "${var.name}-asg-topic"
}

resource "aws_autoscaling_notification" "asg_notify" {
    group_names = [var.autoscaling_group_name]
    topic_arn = aws_sns_topic.asg_notifications.arn

    notifications = [
        "autoscaling:EC2_INSTANCE_LAUCH",
        "autoscaling:EC2_INSTANCE_TERMINATE",
        "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
        "autoscaling:EC2_INSTANCE_TERMINATE_ERROR"
    ]
}