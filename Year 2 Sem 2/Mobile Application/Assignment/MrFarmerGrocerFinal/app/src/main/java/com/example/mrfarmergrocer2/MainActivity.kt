package com.example.mrfarmergrocer2

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.ProgressBar
import android.widget.Toast
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.FirebaseDatabase
import com.google.firebase.database.ValueEventListener
import io.paperdb.Paper


class MainActivity : AppCompatActivity() {
    private lateinit var signUpButton: Button
    private lateinit var logInButton: Button

    private lateinit var parentDBname: String

    private lateinit var progressBar: ProgressBar

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        parentDBname = "users"

        //If the keep me signed in checkbox is checked, read the data from the Paper No-sql database and automatically login the user
        Paper.init(this)

        val userNameKey = Paper.book().read("userNameKey", "").toString()
        val userPasswordKey = Paper.book().read("userPasswordKey", "").toString()

        signUpButton = findViewById(R.id.sign_up_now)
        logInButton = findViewById(R.id.log_in_now)
        progressBar = findViewById(R.id.progressBarMainPage)

        if(userNameKey != "" && userPasswordKey != ""){
            if(userNameKey.isNotEmpty() && userPasswordKey.isNotEmpty()){
                signUpButton.isEnabled = false
                logInButton.isEnabled = false
                progressBar.visibility = View.VISIBLE
                Toast.makeText(applicationContext, "Automatically logging...", Toast.LENGTH_SHORT).show()
                isUser(userNameKey, userPasswordKey)
            }
        }

        signUpButton.setOnClickListener(View.OnClickListener() {navigateToSignUp()})
        logInButton.setOnClickListener(View.OnClickListener() {navigateToLogIn()})

    }

    private fun navigateToLogIn(){
        val intent = Intent(this, LogInActivity::class.java)
        startActivity(intent)
    }

    private fun navigateToSignUp(){
        val intent = Intent(this, SignUpActivity::class.java)
        startActivity(intent)
    }

    private fun isUser(username: String, userPassword: String){
        val databaseRef = FirebaseDatabase.getInstance().reference

        databaseRef.addListenerForSingleValueEvent(object: ValueEventListener {
            override fun onDataChange(snapshot: DataSnapshot) {
                if(snapshot.child(parentDBname).child(username).exists()){
                    val passwordFromDB: String = snapshot.child(parentDBname).child(username).child("password").value.toString()
                    if(passwordFromDB == userPassword){
                        val emailFromDB: String = snapshot.child(parentDBname).child(username).child("email").value.toString()
                        val fullNameFromDB: String = snapshot.child(parentDBname).child(username).child("fullName").value.toString()
                        val userNameFromDB: String = snapshot.child(parentDBname).child(username).child("userName").value.toString()
                        val intent = Intent(applicationContext, HomeActivity::class.java)
                        intent.putExtra("userName", userNameFromDB)
                        Toast.makeText(applicationContext, "Direct to home page!!", Toast.LENGTH_SHORT).show()
                        startActivity(intent)
                    }
                }
            }

            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }
        })
    }
}
