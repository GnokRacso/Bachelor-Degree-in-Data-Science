package com.example.mrfarmergrocer2

import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.firebase.ui.database.FirebaseRecyclerOptions
import com.google.firebase.database.*


class AllAddressActivity : AppCompatActivity() {
    private lateinit var userName: String
    private lateinit var selectAddress: String
    private var selectAddressBoolean: Boolean = false
    private lateinit var addressDatabaseRef: DatabaseReference
    private lateinit var recyclerView: RecyclerView
    private lateinit var layoutManager: RecyclerView.LayoutManager
    private lateinit var addressesAdapter: UserAddressesAdapter

    private lateinit var noAddressText: TextView

    private lateinit var addNewAddressButton: Button
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_all_address)

        addNewAddressButton = findViewById(R.id.addNewAddress)
        noAddressText = findViewById(R.id.noAddressAvailable)
        getCurrentUserName()
        getSelectAddress()

        addressDatabaseRef = FirebaseDatabase.getInstance().reference.child("addresses").child(userName)
        recyclerView  = findViewById(R.id.addressRecycleView)
        recyclerView.setHasFixedSize(true)
        layoutManager = LinearLayoutManager(this)
        recyclerView.layoutManager = layoutManager

        addNewAddressButton.setOnClickListener(View.OnClickListener { goToAddAddress() })



    }

    override fun onStart() {
        super.onStart()

        addressDatabaseRef = FirebaseDatabase.getInstance().reference.child("addresses").child(userName)
        addressDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(!snapshot.exists()){
                    noAddressText.visibility = View.VISIBLE
                }
                else{
                    noAddressText.visibility = View.INVISIBLE
                }
            }

            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }

        })

        val options: FirebaseRecyclerOptions<Addresses> = FirebaseRecyclerOptions.Builder<Addresses>().
        setQuery(addressDatabaseRef, Addresses::class.java).
        build()

        addressesAdapter = UserAddressesAdapter(options, applicationContext, userName, selectAddressBoolean)
        recyclerView.adapter = addressesAdapter
        addressesAdapter.startListening()
    }

    private fun getSelectAddress(){
        val intent = intent
        selectAddress = intent.getStringExtra("selectAddress").toString()
        selectAddressBoolean = selectAddress.toBoolean()
    }

    private fun getCurrentUserName(){
        val intent = intent
        userName = intent.getStringExtra("userName").toString()
    }

    private fun goToAddAddress(){
        val intent = Intent(this, AddNewAddressActivity::class.java)
        intent.putExtra("userName", userName)
        startActivity(intent)
    }

    override fun onBackPressed() {
        if(selectAddressBoolean){
            Toast.makeText(this@AllAddressActivity, "Please Select One Address", Toast.LENGTH_SHORT).show()
            return
        }
        else{
            val intent = Intent(this, MyAccountActivity::class.java)
            intent.putExtra("userName", userName)
            startActivity(intent)
        }


    }

}