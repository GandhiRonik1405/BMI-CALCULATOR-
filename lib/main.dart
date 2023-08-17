import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI CALCULATOR APP.'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var WtController = TextEditingController();
  var FtController = TextEditingController();
  var inController = TextEditingController();

  var result='';
var bgcolor=Colors.amber.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
              color: const Color.fromARGB(255, 14, 233, 233),

          child: Center( 
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                color: bgcolor,
                width: 300,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'BMI',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
              
                  const SizedBox(height: 30,),
              
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: WtController,
                      decoration: const InputDecoration(
                          label: Text('Enter The Weigth (in Kgs)'),
                          prefixIcon: Icon(Icons.line_weight_sharp)),
                    ),
              
                  const SizedBox(height: 15,),
              
              
                    TextField(
                      controller: FtController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text('Enter The Height(in fit)'),
                          prefixIcon: Icon(Icons.filter_b_and_w_outlined)),
                    ),
              
                  const SizedBox(height: 15,),
              
              
                    TextField(
                      controller: inController  ,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text('Enter The Heigth(in inch)'),
                          prefixIcon: Icon(Icons.height)),
                    ),
              
              
                    Container(
                      height: 20,
                    ),
              
                    
                    ElevatedButton(onPressed: () {
              
                      var Wt= WtController.text.toString();
                      var Ft= FtController.text.toString();
                      var inch= inController.text.toString();
              
                    if(Wt!="" && Ft!="" && inch!=""){
                      var iWt=int.parse(Wt);
                      var iFt=int.parse(Ft);
                      var iInch=int.parse(inch);
              
                      var tInch=(iFt*12)+iInch;
                      var tCm=tInch*2.54;
                      var tM = tCm/100;
                      // ignore: non_constant_identifier_names
                      var bmi=iWt/(tM*tM);
            
                      var msg="";
            
                      if(bmi>25){
                        msg="You're OverWeigth!!.";
                        bgcolor=Colors.orangeAccent.shade200;
                      }else if(bmi<18){
                         msg="You're UnderWeigth!!.";
                        bgcolor=Colors.red.shade300;
                      }else{
                         msg="You're Healthy!!.";
                        bgcolor=Colors.greenAccent.shade200;
                      }
              
                      setState(() {
                        result="$msg \n Your Bmi Is : ${bmi.toStringAsFixed(4)}";
                      });
                    }
                    else{
                      setState(() {
                      result="Please All The Required Blanks!!";
                        
                      });
              
                    }
              
                    }, child: const Text('Calculator')),
                    // SizedBox(height: 5,),
                  
                  Text(result,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
          ),
        )
        );
  }
}
