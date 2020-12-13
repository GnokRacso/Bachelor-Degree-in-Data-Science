package com.example.mrfarmergrocer2

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.ProgressBar
import android.widget.Toast
import androidx.databinding.DataBindingUtil
import com.example.mrfarmergrocer2.databinding.ActivityChangePasswordBinding
import com.google.android.material.textfield.TextInputLayout
import com.google.firebase.database.*
import java.util.regex.Pattern

class ChangePasswordActivity : AppCompatActivity() {

    private lateinit var userDatabaseRef: DatabaseReference
    private lateinit var userCurrentPassword: TextInputLayout
    private lateinit var userPassword: TextInputLayout
    private lateinit var userConPassword: TextInputLayout
    private lateinit var progressBar: ProgressBar
    private lateinit var submitButton: Button

    private var userName: String? = ""

    var passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{8,}$"
    private val passwordPatterns: Pattern = Pattern.compile(passwordRegex)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivityChangePasswordBinding>(this, R.layout.activity_change_password)

        getCurrentUserName()
        getCurrentUserPassword()
        userDatabaseRef = FirebaseDatabase.getInstance().reference.child("users").child(userName.toString())
        userCurrentPassword = binding.currentPassword
        userPassword = binding.newPasswordInput
        userConPassword = binding.confirmNewPasswordInput
        progressBar = binding.progressBar
        submitButton = binding.submitButton

        userCurrentPassword.isEnabled = false

        submitButton.setOnClickListener(View.OnClickListener { checkInputValidity() })
    }

    private fun getCurrentUserName(){
        val intent = intent
        userName = intent.getStringExtra("userName")
    }

    private fun getCurrentUserPassword(){
        userDatabaseRef = FirebaseDatabase.getInstance().reference.child("users")
        userDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(snapshot.child(userName.toString()).exists()){
                    val password = snapshot.child(userName.toString()).child("password").value.toString()
                    userCurrentPassword.editText?.setText(password)
                }
            }

            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }

        })
    }

    private fun checkInputValidity(){
        val password = userPassword.editText?.text.toString().trim()
        val conPassword = userConPassword.editText?.text.toString().trim()
        if(password.isEmpty()) {
            userPassword.error = "Password Required"
            userPassword.requestFocus()
            return
        }
        else{
            userPassword.error = ""
        }

        if(!passwordPatterns.matcher(password).matches()){
            userPassword.error = "This password is Invalid"
            userPassword.requestFocus()
            return
        }
        else{
            userPassword.error = ""
        }

        if(conPassword != password){
            userConPassword.error = "Must match with entered password"
            userConPassword.requestFocus()
            return
        }
        else{
            userConPassword.error = ""
        }

        progressBar.visibility = View.VISIBLE
        changePasswordInDB()
    }

    private fun changePasswordInDB(){
        userDatabaseRef = FirebaseDatabase.getInstance().reference.child("users").child(userName.toString())
        userDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener {
            override fun onDataChange(snapshot: DataSnapshot) {
                val password = userPassword.editText?.text.toString().trim()
                userDatabaseRef.child("password").setValue(password).addOnCompleteListener(){ task ->
                    if(task.isSuccessful){
                        Toast.makeText(applicationContext, "Change Password Successfully!", Toast.LENGTH_SHORT).show()
                        Toast.makeText(applicationContext, "Please Login Again!", Toast.LENGTH_SHORT).show()
                        val intent = Intent(application, LogInActivity::class.java)
                        startActivity(intent)
                    }

                    else{
                        Toast.makeText(applicationContext, " Error. Please try again some time.", Toast.LENGTH_SHORT).show()
                    }
                }
            }

            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }

        })
    }
}