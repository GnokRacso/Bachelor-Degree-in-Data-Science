package com.example.mrfarmergrocer2

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.CheckBox
import android.widget.ProgressBar
import android.widget.Toast
import androidx.databinding.DataBindingUtil
import com.example.mrfarmergrocer2.databinding.ActivityLogInBinding
import com.google.android.gms.tasks.OnCompleteListener
import com.google.android.material.textfield.TextInputLayout
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.database.*
import io.paperdb.Paper

class LogInActivity : AppCompatActivity() {
    private lateinit var databaseRef: DatabaseReference
    private lateinit var fAuth: FirebaseAuth

    private lateinit var parentDBname: String

    private lateinit var checkBox: CheckBox
    private lateinit var userName: TextInputLayout
    private lateinit var userPassword: TextInputLayout
    private lateinit var progressBar: ProgressBar
    private lateinit var logInButton: Button
    private lateinit var forgotPassword: Button
    private lateinit var signUpButton: Button
    private lateinit var adminButton: Button
    private lateinit var notAdminButton: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivityLogInBinding>(this, R.layout.activity_log_in)

        fAuth = FirebaseAuth.getInstance()
        parentDBname = "users"

        checkBox = binding.checkboxRememberMe
        userName = binding.userNameInput
        userPassword = binding.passwordInput
        progressBar = binding.progressBar
        logInButton = binding.logInButton
        signUpButton = binding.signUpButton
        forgotPassword = binding.forgotPasswordButton
        adminButton = binding.anAdminButton
        notAdminButton = binding.notAnAdminButton
        Paper.init(this)

        signUpButton.setOnClickListener(View.OnClickListener() {signUp()})

        forgotPassword.setOnClickListener(View.OnClickListener {forgotPassword()})

        adminButton.setOnClickListener(View.OnClickListener {
            logInButton.text = "Login Admin"
            adminButton.visibility = View.INVISIBLE
            notAdminButton.visibility = View.VISIBLE
            parentDBname = "admins"
        })

        notAdminButton.setOnClickListener(View.OnClickListener {
            logInButton.text = "Login Admin"
            notAdminButton.visibility = View.INVISIBLE
            adminButton.visibility = View.VISIBLE
            parentDBname = "users"
        })

        logInButton.setOnClickListener(View.OnClickListener() {checkInputValidity()})
    }

    override fun onBackPressed() {
        // super.onBackPressed();
        Toast.makeText(this@LogInActivity, "There is no back action", Toast.LENGTH_SHORT).show()
        return
    }

    private fun signUp() {
        startActivity(Intent(this, SignUpActivity::class.java))
    }

    private fun forgotPassword(){
        startActivity(Intent(this, ForgotPasswordActivity::class.java))
    }


    private fun checkInputValidity() {
        val username = userName.editText?.text.toString().trim()
        val password = userPassword.editText?.text.toString().trim()

        if (username.isEmpty()){
            userName.error = "Username Required"
            userName.requestFocus()
            return
        }
        else {
            userName.error = ""
        }

        if(password.isEmpty()) {
            userPassword.error = "Password Required"
            userPassword.requestFocus()
            return
        }
        else{
            userPassword.error = ""
        }

        progressBar.visibility = View.VISIBLE
        isUser(username, password)
    }

    //This function check if the user exists in the database
    private fun isUser(username: String, password: String){

        if(checkBox.isChecked){
            Paper.book().write("userNameKey", username)
            Paper.book().write("userPasswordKey", password)
        }

        databaseRef = FirebaseDatabase.getInstance().reference

        databaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(snapshot.child(parentDBname).child(username).exists()){
                    val passwordFromDB: String = snapshot.child(parentDBname).child(username).child("password").value.toString()
                    if(passwordFromDB == password){
                        if(parentDBname == "admins"){
                            val emailFromDB: String = snapshot.child(parentDBname).child(username).child("email").value.toString()
                            val fullNameFromDB: String = snapshot.child(parentDBname).child(username).child("fullName").value.toString()
                            val userNameFromDB: String = snapshot.child(parentDBname).child(username).child("userName").value.toString()

                            val intent = Intent(applicationContext, AdminCategoryActivity::class.java)
                            intent.putExtra("username", userNameFromDB)
                            Toast.makeText(applicationContext, "Log In Successfully!!", Toast.LENGTH_SHORT).show()
                            startActivity(intent)
                        }

                        else if(parentDBname == "users"){
                            val emailFromDB: String = snapshot.child(parentDBname).child(username).child("email").value.toString()
                            val fullNameFromDB: String = snapshot.child(parentDBname).child(username).child("fullName").value.toString()
                            val userNameFromDB: String = snapshot.child(parentDBname).child(username).child("userName").value.toString()
                            val intent = Intent(applicationContext, HomeActivity::class.java)
                            intent.putExtra("userName", userNameFromDB)
                            Toast.makeText(applicationContext, "Log In Successfully!!", Toast.LENGTH_SHORT).show()
                            startActivity(intent)
                        }

                        else{

                        }

                    }
                    else{
                        userPassword.error = "Wrong Password!!"
                        userPassword.requestFocus()
                    }
                }
                else{
                    userName.error = "No such user exists!!"
                    userName.requestFocus()

                }
            }

            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }
        })

    }

    private fun logIn(email:String, password: String){
        databaseRef = FirebaseDatabase.getInstance().getReference("users")

        if(email.isEmpty()) {
            userName.error = "Username Required"
            userName.requestFocus()
            return
        }
        else{
            userName.error = ""
        }

        if(password.isEmpty()) {
            userPassword.error = "Password Required"
            userPassword.requestFocus()
            return
        }
        else{
            userPassword.error = ""
        }

        progressBar.visibility = View.VISIBLE

        fAuth.signInWithEmailAndPassword(email, password).addOnCompleteListener(this, OnCompleteListener { task ->
            if(task.isSuccessful) {
                Toast.makeText(this, "Successfully Logged In", Toast.LENGTH_LONG).show()
                val intent = Intent(this, MyAccountActivity::class.java)
                startActivity(intent)
                finish()
            }else {
                Toast.makeText(this, "Login Failed", Toast.LENGTH_LONG).show()
            }
        })
    }
}