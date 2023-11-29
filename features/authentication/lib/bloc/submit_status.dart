abstract class SubmissionStatusForm {
  const SubmissionStatusForm();
}

class InitSubmitStatus extends SubmissionStatusForm {
  const InitSubmitStatus();
}
class SubmissionFormSuccess extends SubmissionStatusForm {}
class SubmissionFormFailed extends SubmissionStatusForm {
  final String? exception;
  SubmissionFormFailed(this.exception);
}
class FormSubmitting extends SubmissionStatusForm {}