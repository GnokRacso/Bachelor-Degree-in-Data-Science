package com.example.mrfarmergrocer2

import android.app.ProgressDialog
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.*
import androidx.databinding.DataBindingUtil
import com.example.mrfarmergrocer2.databinding.ActivitySignUpBinding
import com.google.android.gms.tasks.OnCompleteListener
import com.google.android.material.textfield.TextInputLayout
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.database.*
import java.util.regex.Pattern

class SignUpActivity : AppCompatActivity() {
    private lateinit var fAuth: FirebaseAuth
    private lateinit var database: DatabaseReference

    //Sign Up layout variable
    private lateinit var userName: TextInputLayout
    private lateinit var userEmail: TextInputLayout
    private lateinit var userFullName: TextInputLayout
    private lateinit var userPassword: TextInputLayout
    private lateinit var userConPassword: TextInputLayout
    private lateinit var securityAnswer: TextInputLayout
    private lateinit var progressBar: ProgressBar
    private lateinit var signUpButton: Button
    private lateinit var logInButton: Button

    private var securityQuestion: String = "What is the city you born at?"

    var emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\$"
    var passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{8,}$"
    private val emailPatterns: Pattern = Pattern.compile(emailRegex)
    private val passwordPatterns: Pattern = Pattern.compile(passwordRegex)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivitySignUpBinding>(this, R.layout.activity_sign_up)

        fAuth = FirebaseAuth.getInstance()
        database = FirebaseDatabase.getInstance().reference


        userName = binding.userNameInput
        userFullName = binding.fullNameInput
        userEmail = binding.emailInput
        userPassword = binding.passwordInput
        userConPassword = binding.confirmPasswordInput
        securityAnswer = binding.securityQuestionAnswer
        signUpButton = binding.signUpButton
        logInButton = binding.alreadyHaveAccount
        progressBar = binding.progressBar

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

        logInButton.setOnClickListener(View.OnClickListener { navigateLogIn() })

         signUpButton.setOnClickListener(View.OnClickListener() { checkInputValidity() })
    }

    private fun navigateLogIn(){
        val intent = Intent(this, LogInActivity::class.java)
        startActivity(intent)
    }

    private fun checkInputValidity() {
        val username = userName.editText?.text.toString().trim()
        val fullName = userFullName.editText?.text.toString().trim()
        val email = userEmail.editText?.text.toString().trim()
        val password = userPassword.editText?.text.toString().trim()
        val conPassword = userConPassword.editText?.text.toString().trim()
        val answer = securityAnswer.editText?.text.toString().trim()

        if (username.isEmpty()){
            userName.error = "Username Required"
            userName.requestFocus()
            return
        }
        else {
            userName.error = ""
        }

        if(fullName.isEmpty()) {
            userFullName.error = "Your Name Required"
            userFullName.requestFocus()
            return
        }
        else{
            userFullName.error = ""
        }

        if(email.isEmpty()) {
            userEmail.error = "Email Required"
            userEmail.requestFocus()
            return
        }
        else{
            userEmail.error = ""
        }

        if(!emailPatterns.matcher(email).matches()){
            userEmail.error = "This email is Invalid"
            userEmail.requestFocus()
            return
        }
        else{
            userEmail.error = ""
        }

        if(password.isEmpty()) {
            userPassword.error = "Password Required"
            userPassword.requestFocus()
            return
        }
        else{
            userPassword.error = ""
        }

        if(!passwordPatterns.matcher(password).matches()){
            userPassword.error = "This password is Invalid (Password must include at least one upper letter, one lower letter, one number and minimum length of 8 characters)"
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

        if(answer.isEmpty()) {
            securityAnswer.error = "Security Answer Required"
            securityAnswer.requestFocus()
            return
        }
        else{
            securityAnswer.error = ""
        }

        progressBar.visibility = View.VISIBLE
        checkExistenceUsernameAndEmail(username, fullName, email, password, securityQuestion, answer)
    }

    private fun checkExistenceUsernameAndEmail(username: String, fullName: String, email:String, password:String, securityQuestion: String, securityAnswer: String){
        database = FirebaseDatabase.getInstance().reference

        database.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(!snapshot.child("users").child(username).exists()) {
                    val userMap: HashMap<String, String> = HashMap<String, String>()
                    userMap["email"] = email
                    userMap["fullName"] = fullName
                    userMap["password"] = password
                    userMap["userName"] = username
                    userMap["securityQuestion"] = securityQuestion
                    userMap["securityAnswer"] = securityAnswer
                    database.child("users").child(username).setValue(userMap).addOnCompleteListener(){ task ->
                        if(task.isSuccessful){
                            Toast.makeText(applicationContext, "Sign Up Successfully!!", Toast.LENGTH_SHORT).show()
                            startActivity(Intent(applicationContext,LogInActivity::class.java))
                        }
                        else{
                            Toast.makeText(applicationContext, "Network Error. Please try again some time." + task.exception?.message, Toast.LENGTH_SHORT).show()
                        }
                    }
                }
                else{
                    userName.error = "This Username has been TAKEN. Please enter another username"
                    userName.requestFocus()
                }
            }
            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }
        })
    }
}


