abstract class CommerceFailure{
  final String?message;

  CommerceFailure({this.message});
}
class GeneralFailure extends CommerceFailure{
  GeneralFailure({super.message});
}