package com.example.mrfarmergrocer2

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.IBinder
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.ProgressBar
import android.widget.Toast
import androidx.databinding.DataBindingUtil
import com.example.mrfarmergrocer2.databinding.ActivityAddNewAddressBinding
import com.google.android.material.textfield.TextInputLayout
import com.google.firebase.database.*

class AddNewAddressActivity : AppCompatActivity() {
    private lateinit var addressDatabaseRef: DatabaseReference

    private lateinit var userName: String
    private var numberOfCurrentAddress: Long = 0
    private lateinit var recipientName: TextInputLayout
    private lateinit var recipientPhone: TextInputLayout
    private lateinit var recipientAddressDetails: TextInputLayout
    private lateinit var recipientPostalCode: TextInputLayout
    private lateinit var recipientCity: TextInputLayout
    private lateinit var recipientState: TextInputLayout
    private lateinit var submitButton: Button
    private lateinit var progressBar: ProgressBar
    override fun onCreate(savedInstanceState: Bundle?) {

        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivityAddNewAddressBinding>(this, R.layout.activity_add_new_address)
        getCurrentUserName()
        addressDatabaseRef = FirebaseDatabase.getInstance().reference

        recipientName = binding.deliveryNameInput
        recipientPhone = binding.deliveryPhoneInput
        recipientAddressDetails = binding.deliveryAddressDetailsInput
        recipientPostalCode = binding.deliveryPostalCodeInput
        recipientCity = binding.deliveryCityInput
        recipientState = binding.deliveryStateInput
        submitButton = binding.addNewAddressButton
        progressBar = binding.progressBar

        submitButton.setOnClickListener(View.OnClickListener { checkInputValidity() })
    }

    private fun getCurrentUserName(){
        val intent = intent
        userName = intent.getStringExtra("userName").toString()
    }

    private fun checkInputValidity() {
        val name = recipientName.editText?.text.toString().trim()
        val phone = recipientPhone.editText?.text.toString().trim()
        val addressDetails = recipientAddressDetails.editText?.text.toString().trim()
        val postalCode = recipientPostalCode.editText?.text.toString().trim()
        val city = recipientCity.editText?.text.toString().trim()
        val state = recipientState.editText?.text.toString().trim()

        if (name.isEmpty()){
            recipientName.error = "Recipient Name is required"
            recipientName.requestFocus()
            return
        }
        else{
            recipientName.error = ""
        }

        if (phone.isEmpty()){
            recipientPhone.error = "Recipient phone is required"
            recipientPhone.requestFocus()
            return
        }
        else{
            recipientPhone.error = ""
        }

        if (addressDetails.isEmpty()){
            recipientAddressDetails.error = "Recipient address is required"
            recipientAddressDetails.requestFocus()
            return
        }
        else{
            recipientAddressDetails.error = ""
        }

        if (postalCode.isEmpty()){
            recipientPostalCode.error = "Recipient postal code is required"
            recipientPostalCode.requestFocus()
            return
        }
        else{
            recipientPostalCode.error = ""
        }

        if (city.isEmpty()){
            recipientCity.error = "Recipient city is required"
            recipientCity.requestFocus()
            return
        }
        else{
            recipientCity.error = ""
        }

        if (state.isEmpty()){
            recipientState.error = "Recipient state is required"
            recipientState.requestFocus()
            return
        }
        else{
            recipientState.error = ""
        }
        progressBar.visibility = View.VISIBLE
        addNewAddress(name, phone, addressDetails, postalCode, city, state)
    }

    private fun addNewAddress(name: String, phone: String, addressDetails: String, postalCode: String, city: String, state: String){
        addressDatabaseRef = FirebaseDatabase.getInstance().reference.child("addresses")

        addressDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(!snapshot.child(userName).exists()){
                    val address = Addresses(name,phone,addressDetails,postalCode,city,state,userName)
                    addressDatabaseRef.child(userName).child("address1").setValue(address).addOnCompleteListener(){task ->
                        if(task.isSuccessful){
                            Toast.makeText(applicationContext, "Add Addresses Successfully!!", Toast.LENGTH_SHORT).show()
                            val intent = Intent(applicationContext,AllAddressActivity::class.java)
                            intent.putExtra("userName", userName)
                            startActivity(intent)
                        }
                        else{
                            Toast.makeText(applicationContext, "Network Error. Please try again some time." + task.exception?.message, Toast.LENGTH_SHORT).show()
                        }
                    }
                }
                else{
                    numberOfCurrentAddress = snapshot.child(userName).childrenCount
                    Log.i("AddNewAddressActivity", numberOfCurrentAddress.toString())
                    numberOfCurrentAddress += 1
                    val address = Addresses(name,phone,addressDetails,postalCode,city,state,userName)
                    addressDatabaseRef.child(userName).child("address$numberOfCurrentAddress").setValue(address).addOnCompleteListener(){ task ->
                        if(task.isSuccessful){
                            Toast.makeText(applicationContext, "Add Addresses Successfully!!", Toast.LENGTH_SHORT).show()
                            val intent = Intent(applicationContext,AllAddressActivity::class.java)
                            intent.putExtra("userName", userName)
                            startActivity(intent)
                        }
                        else{
                            Toast.makeText(applicationContext, "Network Error. Please try again some time." + task.exception?.message, Toast.LENGTH_SHORT).show()
                        }
                    }
                }
            }
            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }
        })
    }
}