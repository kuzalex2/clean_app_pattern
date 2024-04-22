part of 'storybook_widget.dart';

class _InputsStorybook extends StatelessWidget {
  const _InputsStorybook();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            KitTextFormField2.primary(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              hintText: "Email",
            ),
            SizedBox(height: 12),
            KitTextFormField2.primary(
              keyboardType: TextInputType.emailAddress,
              readOnly: true,
              textInputAction: TextInputAction.next,
              hintText: "Email disabled",
            ),
            SizedBox(height: 12),
            KitTextFormField2.password(
              textInputAction: TextInputAction.next,
              hintText: "Password",
            ),
            SizedBox(height: 12),
            KitTextFormField2.password(
              textInputAction: TextInputAction.next,
              hintText: "Password",
              errorText: "Wrong password",
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
