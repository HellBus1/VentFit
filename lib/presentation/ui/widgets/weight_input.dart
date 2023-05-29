import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ventfit/presentation/ui/bloc/bmi_bloc.dart';
import 'package:ventfit/presentation/ui/bloc/bmi_event.dart';
import 'package:ventfit/presentation/ui/bloc/bmi_state.dart';

class WeightInput extends StatelessWidget {
  const WeightInput({super.key});

  @override
  Widget build(BuildContext context) {
    var localText = AppLocalizations.of(context);

    return BlocConsumer<BMIBloc, BMIState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _inputItemWidget(
                    "${localText?.height} (${localText?.cm})",
                    localText?.height,
                    Icons.height,
                    (p0) =>
                        context.read<BMIBloc>().add(BMIEvent.heightChanged(p0)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: _inputItemWidget(
                  "${localText?.weight} (${localText?.kg})",
                  localText?.weight,
                  Icons.fitness_center,
                  (p0) =>
                      context.read<BMIBloc>().add(BMIEvent.weightChanged(p0)),
                )),
              ],
            )
          ],
        );
      },
    );
  }

  _inputItemWidget(
    String? label,
    String? hint,
    IconData icon,
    Function(String) onChanged,
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
      onChanged: (value) => onChanged(value),
      keyboardType: TextInputType.number,
    );
  }
}
