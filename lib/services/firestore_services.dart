
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _product = FirebaseFirestore.instance.collection("data");
final TextEditingController _email = TextEditingController();
final TextEditingController _username = TextEditingController();
final TextEditingController _no_telp = TextEditingController();
final TextEditingController _alamat = TextEditingController();


 
class Database{
  static Stream<QuerySnapshot> getData(){
    return _product.snapshots();

  }
  static Future<void> update(DocumentSnapshot? snapshot, BuildContext context) async{
    if(snapshot != null){
      _email.text = snapshot['email'];
      _username.text = snapshot['username'];
      _no_telp.text = snapshot['no_telp'];
      _alamat.text = snapshot['alamat'];
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (context) => Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          TextField(
            controller: _email,
            decoration: const InputDecoration(labelText: 'email'),
          ),
          TextField(
            controller: _username,
            decoration: const InputDecoration(labelText: 'username'),      
          ),
           TextField(
            controller: _no_telp,
            decoration: const InputDecoration(labelText: 'no_telp'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
           TextField(
            controller: _alamat,
            decoration: const InputDecoration(labelText: 'alamat'),
          ),
          const SizedBox( height: 20,),
          ElevatedButton(onPressed: () async {
            final String email = _email.text;
            final String username = _username.text;
            final String no_telp = _no_telp.text;
            final String alamat = _alamat.text;
            if(username != null){
              await _product.doc(snapshot?.id).update({'email' : email, 'username':username, 'no_telp':no_telp, 'alamat':alamat});
            }
            Navigator.pop(context);
          }, 
          child: const Text("Update"),),
        ]),
      ));
  }
}