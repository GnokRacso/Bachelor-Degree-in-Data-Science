package com.example.mrfarmergrocer2

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.ImageButton
import android.widget.ProgressBar
import android.widget.Toast
import androidx.databinding.DataBindingUtil
import com.example.mrfarmergrocer2.databinding.ActivityEditAddressBinding
import com.google.android.material.textfield.TextInputLayout
import com.google.firebase.database.*

class EditAddressActivity : AppCompatActivity() {
    private lateinit var addressDatabaseRef: DatabaseReference
    private lateinit var userName: String
    private lateinit var position: String
    private lateinit var recipientName: TextInputLayout
    private lateinit var recipientPhone: TextInputLayout
    private lateinit var recipientAddressDetails: TextInputLayout
    private lateinit var recipientPostalCode: TextInputLayout
    private lateinit var recipientCity: TextInputLayout
    private lateinit var recipientState: TextInputLayout
    private lateinit var submitButton: Button
    private lateinit var saveButton: ImageButton
    private lateinit var progressBar: ProgressBar

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivityEditAddressBinding>(this, R.layout.activity_edit_address)
        getCurrentUserName()
        getCurrentPosition()
        getAllEditAddressDetails()
        addressDatabaseRef = FirebaseDatabase.getInstance().reference

        recipientName = binding.deliveryNameInput
        recipientPhone = binding.deliveryPhoneInput
        recipientAddressDetails = binding.deliveryAddressDetailsInput
        recipientPostalCode = binding.deliveryPostalCodeInput
        recipientCity = binding.deliveryCityInput
        recipientState = binding.deliveryStateInput
        submitButton = binding.editAddressButton
        saveButton = binding.saveButton
        progressBar = binding.progressBar

        saveButton.setOnClickListener(View.OnClickListener { checkInputValidity() })
        submitButton.setOnClickListener(View.OnClickListener { checkInputValidity() })
    }

    private fun getCurrentUserName(){
        val intent = intent
        userName = intent.getStringExtra("userName").toString()
    }

    //To get the address position that the user want to edit
    private fun getCurrentPosition(){
        val intent = intent
        position = intent.getStringExtra("position").toString()
    }

    //To get all the details from database
    private fun getAllEditAddressDetails(){
        var position = position.toInt()
        position += 1
        val currentPosition = "address$position"
        addressDatabaseRef = FirebaseDatabase.getInstance().reference.child("addresses").child(userName)
        addressDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener {
            override fun onDataChange(snapshot: DataSnapshot) {
                val name = snapshot.child(currentPosition).child("name").value.toString()
                val addressDetails = snapshot.child(currentPosition).child("addressDetails").value.toString()
                val phoneNum = snapshot.child(currentPosition).child("phoneNum").value.toString()
                val postalCode = snapshot.child(currentPosition).child("postalCode").value.toString()
                val city = snapshot.child(currentPosition).child("city").value.toString()
                val state = snapshot.child(currentPosition).child("state").value.toString()

                recipientName.editText?.setText(name)
                recipientPhone.editText?.setText(phoneNum)
                recipientAddressDetails.editText?.setText(addressDetails)
                recipientPostalCode.editText?.setText(postalCode)
                recipientCity.editText?.setText(city)
                recipientState.editText?.setText(state)
            }

            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }
        })
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
        editCurrentAddresses(name, phone, addressDetails, postalCode, city, state)
    }

    //Edit the address in the database
    private fun editCurrentAddresses(name: String, phone: String, addressDetails: String, postalCode: String, city: String, state: String){
        var position = position.toInt()
        position += 1
        val currentPosition = "address$position"
        addressDatabaseRef = FirebaseDatabase.getInstance().reference.child("addresses").child(userName).child(currentPosition)
        val addressMap: HashMap<String, String> = HashMap<String, String>()
        addressMap["name"] = name
        addressMap["addressDetails"] = addressDetails
        addressMap["phoneNum"] = phone
        addressMap["postalCode"] = postalCode
        addressMap["city"] = city
        addressMap["state"] = state
        addressMap["userName"] = userName
        addressDatabaseRef.setValue(addressMap).addOnCompleteListener(){ task ->
            if(task.isSuccessful){
                Toast.makeText(applicationContext, "Edit Address Successfully!", Toast.LENGTH_SHORT).show()
                val intent = Intent(this, AllAddressActivity::class.java)
                intent.putExtra("userName",userName)
                startActivity(intent)
            }

            else{
                Toast.makeText(applicationContext, " Error. Please try again some time.", Toast.LENGTH_SHORT).show()
            }
        }
    }
}