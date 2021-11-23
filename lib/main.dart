import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Resume Generator'),
          ),
          body: Center(
            child: Container(
                padding: const EdgeInsets.only(left: 50, top: 50, right: 50),
                alignment: Alignment.center,
                margin: const EdgeInsets.all(50),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        validator: FormBuilderValidators.minLength(context, 5,
                            errorText:
                                'Obligatorio: Ingresa Nombre y Apellido'),
                        name: 'textfield1',
                        enabled: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Ingresa Nombre y Apellido',
                            fillColor: Colors.white70),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        validator: FormBuilderValidators.email(context,
                            errorText: 'debe ser email'),
                        name: 'textfield2',
                        enabled: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Ingresa Email',
                            fillColor: Colors.white70),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        validator: FormBuilderValidators.numeric(context,
                            errorText: 'numero telefonico'),
                        name: 'textfield3',
                        enabled: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Ingresa domicilio',
                            fillColor: Colors.white70),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        validator: FormBuilderValidators.email(context,
                            errorText: 'debe ser email'),
                        name: 'textfield4',
                        enabled: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'Ingresa Email',
                            fillColor: Colors.white70),
                      ),
                      const SizedBox(height: 20),
                      FormBuilderDropdown(
                        name: 'empleos',
                        decoration: const InputDecoration(
                          labelText: 'Empleos anteriores',
                        ),
                        // initialValue: 'Male',
                        allowClear: true,
                        hint: const Text('Seleccione'),
                        items: <String>['1', '2', '3', '4']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                          onPressed: () {
                            final tfNombre = _formKey
                                .currentState!.fields['textfield1']!.value;
                            final tfEmail = _formKey
                                .currentState!.fields['textfield2']!.value;
                            final tfPhone = _formKey
                                .currentState!.fields['textfield3']!.value;
                            final tfAddress = _formKey
                                .currentState!.fields['textfield4']!.value;
                            final ddExp =
                                _formKey.currentState!.fields['empleos']!.value;

                            print('$tfNombre');
                            print('$tfEmail');
                            print('$tfPhone');
                            print('$tfAddress');
                            print('$ddExp');

                            _formKey.currentState!.reset();
                            FocusScope.of(context).unfocus();
                          },
                          child: Text('Submit'))
                    ],
                  ),
                  //  onChanged: () => print("Form has been changed"),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  skipDisabled: true,
                )),
          )),
    );
  }
}
