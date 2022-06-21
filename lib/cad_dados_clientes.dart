import 'dart:io';
import 'package:corretoramb/Home_MB.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'cad_dados_enderecos.dart';
import 'demo_bi.dart';

void main() {
  runApp(const cad_dados_clientes());
}

class cad_dados_clientes extends StatelessWidget {
  const cad_dados_clientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllFieldsForm(),
    );
  }
}

class AllFieldsFormBloc extends FormBloc<String, String> {
  final text1 = TextFieldBloc();
  final text2 = TextFieldBloc();
  final text3 = TextFieldBloc();
  final text4 = TextFieldBloc();
  final text5 = TextFieldBloc();

  final boolean1 = BooleanFieldBloc();

  final boolean2 = BooleanFieldBloc();

  final select1 = SelectFieldBloc<String, dynamic>(
    items: [
      'Física',
      'Jurídica',
    ],
  );
  final select2 = SelectFieldBloc<String, dynamic>(
    items: [
      'Mas',
      'Fem',
    ],
  );
  final select3 = SelectFieldBloc<String, dynamic>(
    items: [
      'Solteiro(a)',
      'Separado(a)',
    ],
  );

  final file = InputFieldBloc<File?, String>(initialValue: null);

  final date1 = InputFieldBloc<DateTime?, Object>(initialValue: null);

  final dateAndTime1 = InputFieldBloc<DateTime?, Object>(initialValue: null);

  AllFieldsFormBloc() {
    addFieldBlocs(fieldBlocs: [
      text1,
      text2,
      text3,
      text4,
      boolean1,
      boolean2,
      select1,
      select2,
      select3,
      date1,
      dateAndTime1,
    ]);
  }

  @override
  void onSubmitting() async {
    try {
      await Future<void>.delayed(const Duration(milliseconds: 500));

      emitSuccess(canSubmitAgain: true);
    } catch (e) {
      emitFailure();
    }
  }
}

class AllFieldsForm extends StatelessWidget {
  const AllFieldsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllFieldsFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<AllFieldsFormBloc>(context);


          return Theme(

            data: Theme.of(context).copyWith(
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            child: Scaffold(
              appBar: AppBar(

                backgroundColor: const Color(0xff00bfa5),
                actions: [
                  const SizedBox(
                    width: 40,

                  ),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (_) => cad_dados_enderecos())),
                    icon: const Icon(Icons.logout),
                    label: const Text('Endereços',
                        style: TextStyle(fontSize: 12, color: Colors.white)),

                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xff00bfa5)),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (_) => cad_dados_enderecos())),
                    icon: const Icon(Icons.logout),
                    label: const Text('Salvar',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xff00bfa5)),
                  ),
                ],
              ),
              floatingActionButton: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 5, width: 50),
                  FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: formBloc.submit,
                    icon: const Icon(Icons.send),
                    label: const Text(
                      'Enviar',
                      style: TextStyle(fontSize: 11, color: Colors.white),

                    ),
                    backgroundColor: const Color(0xff00bfa5)),

                ],
              ),
              body: FormBlocListener<AllFieldsFormBloc, String, String>(
                onSubmitting: (context, state) {
                  LoadingDialog.show(context);
                },
                onSuccess: (context, state) {
                  LoadingDialog.hide(context);

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const SuccessScreen()));
                },
                onFailure: (context, state) {
                  LoadingDialog.hide(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.failureResponse!)));
                },
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: <Widget>[
                        Text('CADASTRO CLIENTES.',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87)),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.text1,
                          decoration: const InputDecoration(
                            labelText: 'Cód.Cliente',
                            prefixIcon: Icon(Icons.code),
                          ),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.text2,
                          decoration: const InputDecoration(
                            labelText: 'Nascimento',
                            prefixIcon: Icon(Icons.emoji_events),
                          ),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.text3,
                          decoration: const InputDecoration(
                            labelText: 'Contato',
                            prefixIcon: Icon(Icons.phone),
                          ),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.text4,
                          decoration: const InputDecoration(
                            labelText: 'Razão Social',
                            prefixIcon: Icon(Icons.work),
                          ),
                        ),
                        RadioButtonGroupFieldBlocBuilder<String>(
                          selectFieldBloc: formBloc.select1,
                          decoration: const InputDecoration(
                            labelText: 'Pessoa',
                          ),
                          itemBuilder: (context, item) => FieldItem(
                            child: Text(item),
                          ),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.text5,
                          decoration: const InputDecoration(
                            labelText: 'CPF',
                            prefixIcon: Icon(Icons.credit_card),
                          ),
                        ),
                        RadioButtonGroupFieldBlocBuilder<String>(
                          selectFieldBloc: formBloc.select2,
                          decoration: const InputDecoration(
                            labelText: 'Sexo',
                          ),
                          itemBuilder: (context, item) => FieldItem(
                            child: Text(item),
                          ),
                        ),
                        RadioButtonGroupFieldBlocBuilder<String>(
                          selectFieldBloc: formBloc.select3,
                          decoration: const InputDecoration(
                            labelText: 'Estado Cível',
                          ),
                          itemBuilder: (context, item) => FieldItem(
                            child: Text(item),
                          ),
                        ),
                        BlocBuilder<InputFieldBloc<File?, String>,
                                InputFieldBlocState<File?, String>>(
                            bloc: formBloc.file,
                            builder: (context, state) {
                              return Container();
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => LoadingDialog(key: key),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(12.0),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.tag_faces, size: 100),
            const SizedBox(height: 11),
            const Text(
              'Successo',
              style: TextStyle(fontSize: 11, color: Colors.green),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 11),
            ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (_) => const cad_dados_clientes())),
              icon: const Icon(Icons.bento_outlined),
              label: const Text('Novo Cadastro'),
            ),
            SizedBox(height: 11),
            ElevatedButton.icon(
              onPressed: () => Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) => HomeMB())),
              icon: const Icon(Icons.change_circle_sharp),
              label: const Text('Voltar'),
            ),
            SizedBox(height: 11),
            ElevatedButton.icon(
              onPressed: () => Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) =>Demo_bi())),
              icon: const Icon(Icons.exit_to_app),
              label: const Text('Sair Portal'),
            ),
          ],
        ),
      ),
    );
  }
}
