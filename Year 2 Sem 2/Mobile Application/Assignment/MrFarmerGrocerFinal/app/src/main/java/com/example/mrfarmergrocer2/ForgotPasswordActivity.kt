package com.example.mrfarmergrocer2

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.*
import androidx.databinding.DataBindingUtil
import com.example.mrfarmergrocer2.databinding.ActivityForgotPasswordBinding
import com.example.mrfarmergrocer2.databinding.ActivityLogInBinding
import com.google.android.gms.tasks.OnCompleteListener
import com.google.android.material.textfield.TextInputLayout
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.database.*

class ForgotPasswordActivity : AppCompatActivity() {
    private lateinit var userDatabaseRef: DatabaseReference
    private lateinit var userName: TextInputLayout
    private lateinit var securityAnswer: TextInputLayout
    private lateinit var resetButton: Button
    private lateinit var cancelButton: Button
    private lateinit var progressBar: ProgressBar

    private var securityQuestion: String = "What is the city you born at?"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivityForgotPasswordBinding>(this, R.layout.activity_forgot_password)

        userName = binding.resetUserName
        resetButton = binding.resetPassBtn
        cancelButton = binding.cancelBtn
        securityAnswer = binding.securityQuestionAnswer
        progressBar = binding.progressBar

        //Select the security question that the user selected at the sign up
        val spinner: Spinner = binding.securityQuestionSpinner
        ArrayAdapter.createFromResource(
            this,
            R.array.security_question,
            android.R.layout.simple_spinner_item
        ).also { adapter ->
            adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
            spinner.adapter = adapter
        }

        spinner.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
                securityQuestion = parent?.getItemAtPosition(position).toString()
                onStart()
            }

            override fun onNothingSelected(parent: AdapterView<*>?) {
                TODO("Not yet implemented")
            }

        }

        resetButton.setOnClickListener(View.OnClickListener() {checkInputValidity()})
        cancelButton.setOnClickListener(View.OnClickListener() {goBackToLogin()})
    }

    private fun checkInputValidity(){
        val userNameFun = userName.editText?.text.toString().trim()
        val answer = securityAnswer.editText?.text.toString().trim()

        if (userNameFun.isEmpty()){
            userName.error = "Username Required"
            userName.requestFocus()
            return
        }
        else {
            userName.error = ""
        }

        if(answer.isEmpty()) {
            securityAnswer.error = "Security Answer Required"
            securityAnswer.requestFocus()
            return
        }
        else{
            securityAnswer.error = ""
        }

        progressBar.visibility = View.VISIBLE
        resetPassword()
    }

    //If the security answer and/or question do not match the database, show the error, else, allow user to change the password
    private fun resetPassword(){
        val userNameFun = userName.editText?.text.toString().trim()
        var answer = securityAnswer.editText?.text.toString().trim()
        answer = answer.split(' ').joinToString(" ") { it.capitalize() }
        userDatabaseRef = FirebaseDatabase.getInstance().reference.child("users").child(userNameFun)
        userDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(snapshot.exists()){
                    if(snapshot.child("securityQuestion").value.toString() == securityQuestion){
                        if(snapshot.child("securityAnswer").value.toString() == answer){
                            val intent = Intent(applicationContext, CreateNewPasswordActivity::class.java)
                            intent.putExtra("userName", userNameFun)
                            Toast.makeText(applicationContext, "Directing to change password page...", Toast.LENGTH_SHORT).show()
                            startActivity(intent)
                        }
                        else{
                            securityAnswer.error = "This security answer is invalid"
                            securityAnswer.requestFocus()
                        }
                    }
                    else{
                        Toast.makeText(applicationContext, "Invalid security question. Please select again!!", Toast.LENGTH_SHORT).show()
                    }
                }
                else{
                    userName.error="This username is invalid"
                    userName.requestFocus()
                }
            }

            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }

        })
    }

    private fun goBackToLogin(){
        val intent = Intent(this, LogInActivity::class.java)
        startActivity(intent)
    }

}