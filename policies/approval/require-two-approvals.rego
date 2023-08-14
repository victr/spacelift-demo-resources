package spacelift

approve { input.run.state != "UNCONFIRMED" }

approve {
  count(input.reviews.current.approvals) > 1
  count(input.reviews.current.rejections) == 0
}