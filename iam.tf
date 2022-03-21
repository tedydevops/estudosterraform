resource "aws_iam_group" "group" {
  name = "administrators"
}
resource "aws_iam_policy_attachment" "administrators-attach" {
  name       = "administrators-attach"
  groups     = [aws_iam_group.group.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
resource "aws_iam_user" "admin1" {
  name = "admin1"
}
resource "aws_iam_user" "admin2" {
  name = "admin2"
}
resource "aws_iam_group_membership" "administrators-users" {
  name = "administrators-users"
  users = [
    "${aws_iam_user.admin1.name}",
    "${aws_iam_user.admin2.name}",
  ]
  group = aws_iam_group.group.name
}