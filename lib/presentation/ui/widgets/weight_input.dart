import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeightInput extends StatelessWidget {
  const WeightInput({super.key});

  @override
  Widget build(BuildContext context) {
    var localText = AppLocalizations.of(context);
    var theme = Theme.of(context);

    var heightList = [localText?.cm ?? "", localText?.inch ?? ""];
    var weightList = [localText?.kg ?? "", localText?.pounds ?? ""];

    return Column(
      children: [
        _inputItemWidget(
          localText?.age,
          localText?.age,
          Icons.filter_2,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _inputItemWidget(
                localText?.height,
                localText?.height,
                Icons.height,
              ),
            ),
            const SizedBox(width: 24),
            SizedBox(
              child: _dropdownItemWidget(
                heightList,
                heightList.first,
                (p0) => null,
                theme,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
                child: _inputItemWidget(
              localText?.weight,
              localText?.weight,
              Icons.fitness_center,
            )),
            const SizedBox(width: 24),
            SizedBox(
              child: _dropdownItemWidget(
                weightList,
                weightList.first,
                (p0) => null,
                theme,
              ),
            )
          ],
        )
      ],
    );
  }

  _inputItemWidget(
    String? label,
    String? hint,
    IconData icon,
  ) {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
      ),
    );
  }

  _dropdownItemWidget(
    List<String> list,
    String value,
    Function(String?) onChange,
    ThemeData theme,
  ) {
    return DropdownButton(
      value: value,
      style: theme.textTheme.bodyMedium,
      onChanged: onChange,
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
