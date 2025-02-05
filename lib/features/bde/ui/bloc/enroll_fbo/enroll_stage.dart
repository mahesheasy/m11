enum EnrollStage {
  editdetails(1),
  location(2),
  photo(3),
  remarks(4),
  notinterested(4.1),
  followup(4.1),
  bankdetails(4.2),
  ucodateselection(4.2),
  complete(5);

  final double indx;

  const EnrollStage(this.indx);
}

extension EnrollStageApi on EnrollStage {
  String toTitle() => switch (this) {
    EnrollStage.editdetails => 'Enroll FBO',
    EnrollStage.location => 'Location',
    EnrollStage.photo => 'Capture Photo',
    EnrollStage.remarks ||
    EnrollStage.notinterested ||
    EnrollStage.followup => 'Feedback',
    EnrollStage.complete => 'Complete',
    EnrollStage.ucodateselection => 'UCO Collection Date',
    EnrollStage.bankdetails => 'KYC Verification',
  };

}
