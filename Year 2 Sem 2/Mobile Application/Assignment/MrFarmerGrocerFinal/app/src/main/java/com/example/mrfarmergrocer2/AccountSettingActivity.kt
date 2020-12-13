package com.example.mrfarmergrocer2

import android.app.Activity
import android.content.ContentResolver
import android.content.DialogInterface
import android.content.Intent
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.renderscript.Sampler
import android.util.Log
import android.view.View
import android.webkit.MimeTypeMap
import android.widget.*
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.widget.Toolbar
import androidx.databinding.DataBindingUtil
import com.example.mrfarmergrocer2.databinding.ActivityAccountSettingBinding
import com.google.android.gms.auth.api.signin.internal.Storage
import com.google.android.gms.tasks.Continuation
import com.google.android.gms.tasks.OnCompleteListener
import com.google.android.gms.tasks.Task
import com.google.android.material.textfield.TextInputLayout
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.database.*
import com.google.firebase.storage.FirebaseStorage
import com.google.firebase.storage.StorageReference
import com.google.firebase.storage.UploadTask
import com.squareup.picasso.Picasso
import com.theartofdev.edmodo.cropper.CropImage
import de.hdodenhof.circleimageview.CircleImageView

class AccountSettingActivity : AppCompatActivity() {
    private lateinit var databaseRef: DatabaseReference

    // User Details
    private lateinit var profilePicture: CircleImageView
    private lateinit var userNameDisplay: TextView
    private lateinit var userFullName: TextInputLayout
    private lateinit var userEmail: TextInputLayout
    private lateinit var userPassword: TextInputLayout
    private lateinit var saveButton: ImageButton
    private lateinit var changeProfPicButton: Button
    private lateinit var changePasswordButton: Button
    private lateinit var progressBar: ProgressBar

    //Custom Toolbar
    private lateinit var toolbar: Toolbar

    private lateinit var imageUri: Uri
    private var myUrl: String = ""
    private lateinit var storageProfPicRef: StorageReference
    private var checker: String = ""

    private var userName: String? = ""
    private var fullName: String? = ""
    private var password: String? = ""
    private var email: String? = ""
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivityAccountSettingBinding>(this, R.layout.activity_account_setting)

        toolbar = binding.accountSettingsToolbar
        toolbar.navigationIcon = resources.getDrawable(R.drawable.icon_arrow)
        toolbar.setNavigationOnClickListener(View.OnClickListener {
            val intent = Intent(this, MyAccountActivity::class.java)
            intent.putExtra("userName", userName)
            startActivity(intent)
        })

        databaseRef = FirebaseDatabase.getInstance().reference
        storageProfPicRef = FirebaseStorage.getInstance().reference.child("user pictures")
        saveButton = binding.saveButton
        changeProfPicButton = binding.changeProfilePic
        changePasswordButton = binding.changePasswordButton
        profilePicture = binding.profilePicture
        userNameDisplay = binding.userFullNameDisplay
        userFullName = binding.userNameForChange
        userEmail = binding.emailAddressForChange
        userPassword = binding.accountPassword
        progressBar = binding.progressBar

        getCurrentUserName()
        getAllUserData(userName.toString())

        userEmail.isEnabled = false 
        userPassword.isEnabled = false


        changePasswordButton.setOnClickListener(View.OnClickListener() {goToChangePassword()})
        saveButton.setOnClickListener(View.OnClickListener() {
            if(checker == "clicked"){
                changeAccountDetailsWithPic(userFullName.editText?.text.toString().trim())
            }
            else{
                changeAccountDetails(userFullName.editText?.text.toString().trim(), userName.toString())
            }
        })

        changeProfPicButton.setOnClickListener(View.OnClickListener {  openGallery() })
    }

    private fun showChangePasswordDialog() {
        val changePasswordDialogBox = ChangePasswordDialogFragment()
        val args: Bundle = Bundle()
        args.putString("userName",userName)
        changePasswordDialogBox.arguments = args
        changePasswordDialogBox.show(supportFragmentManager, "changePasswordDialog")
    }

    private fun goToChangePassword() {
        val intent = Intent(this, ChangePasswordActivity::class.java)
        intent.putExtra("userName", userName)
        startActivity(intent)
    }

    private fun getCurrentUserName() {
        val intent = intent
        userName = intent.getStringExtra("userName")
    }

    //Get All Current user Data with/without image
    private fun getAllUserData(username: String){
        databaseRef = FirebaseDatabase.getInstance().reference.child("users")

        databaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(snapshot.child(username).exists()){
                    if(snapshot.child(username).child("image").exists()){
                        val image = snapshot.child(username).child("image").value.toString()
                        val email = snapshot.child(username).child("email").value.toString()
                        val name = snapshot.child(username).child("fullName").value.toString()
                        val password = snapshot.child(username).child("password").value.toString()
                        userFullName.editText?.setText(name)
                        userEmail.editText?.setText(email)
                        userPassword.editText?.setText(password)
                        userNameDisplay.text = name
                        Picasso.get().load(image).into(profilePicture)
                    }
                    else{
                        val email = snapshot.child(username).child("email").value.toString()
                        val name = snapshot.child(username).child("fullName").value.toString()
                        val password = snapshot.child(username).child("password").value.toString()
                        userFullName.editText?.setText(name)
                        userEmail.editText?.setText(email)
                        userPassword.editText?.setText(password)
                        userNameDisplay.text = name
                    }
                }
            }
            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }
        })
    }

    //Uploading Picture
    private fun openGallery() {
        checker = "clicked"
        val galleryIntent = Intent().setAction(Intent.ACTION_GET_CONTENT)
        galleryIntent.type = "image/*"
        startActivityForResult(galleryIntent, 1)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if(requestCode == 1 && resultCode == RESULT_OK && data != null && data.data != null){
            imageUri = data.data!!
            profilePicture.setImageURI(imageUri)
        }
    }

    private fun changeAccountDetailsWithPic(userChangeName: String){
        if(userChangeName.isEmpty()) {
            userFullName.error = "This field can't be blank"
            userFullName.requestFocus()
            return
        }
        else{
            userFullName.error = ""
        }
        progressBar.visibility = View.VISIBLE
        uploadImage(userName.toString())
    }

    private fun uploadImage(username: String){
        if (imageUri != null){
            val filePath: StorageReference = storageProfPicRef.child("$userName.jpg")
            val uploadTask = filePath.putFile(imageUri)

            uploadTask.continueWithTask(object: Continuation<UploadTask.TaskSnapshot, Task<Uri>>{
                override fun then(p0: Task<UploadTask.TaskSnapshot>): Task<Uri> {
                    if(!p0.isSuccessful){
                        Toast.makeText(applicationContext, p0.exception.toString(), Toast.LENGTH_SHORT).show()
                    }
                    return filePath.downloadUrl
                }
            }).addOnCompleteListener(object: OnCompleteListener<Uri>{
                override fun onComplete(p0: Task<Uri>) {
                    if(p0.isSuccessful){
                        val downloadUrl: Uri = p0.result!!
                        myUrl = downloadUrl.toString()
                        databaseRef = FirebaseDatabase.getInstance().reference.child("users")
                        val userMap: HashMap<String, String> = HashMap<String, String>()
                        userMap["userName"] = username
                        userMap["fullName"] = userFullName.editText?.text.toString()
                        userMap["email"] = userEmail.editText?.text.toString().trim()
                        userMap["password"] = userPassword.editText?.text.toString().trim()
                        userMap["image"] = myUrl
                        databaseRef.child(username).updateChildren(userMap as Map<String, Any>)
                        val intent = Intent(applicationContext, MyAccountActivity::class.java)
                        intent.putExtra("userName", userName)
                        startActivity(intent)
                        Toast.makeText(applicationContext, "Profile Info update successfully.", Toast.LENGTH_SHORT).show();
                        finish()
                    }
                    else{
                        Toast.makeText(applicationContext, "Error", Toast.LENGTH_SHORT).show();
                    }

                }

            })
        }
        else{
            Toast.makeText(this, "image is not selected.", Toast.LENGTH_SHORT).show();
        }
    }

    private fun changeAccountDetails(userChangeName: String, username: String) {

        if(userChangeName.isEmpty()) {
            userFullName.error = "This field can't be blank"
            return
        }
        else{
            userFullName.error = ""
        }
        progressBar.visibility = View.VISIBLE
        databaseRef = FirebaseDatabase.getInstance().reference.child("users")
        val userMap: HashMap<String, String> = HashMap<String, String>()
        userMap["userName"] = username
        userMap["fullName"] = userFullName.editText?.text.toString()
        userMap["email"] = userEmail.editText?.text.toString().trim()
        userMap["password"] = userPassword.editText?.text.toString().trim()
        databaseRef.child(username).updateChildren(userMap as Map<String, Any>)
        val intent = Intent(this, MyAccountActivity::class.java)
        intent.putExtra("userName", userName)
        startActivity(intent)
        Toast.makeText(applicationContext, "Profile Info update successfully.", Toast.LENGTH_SHORT).show();
        finish()
    }

    override fun onBackPressed() {
        val intent = Intent(this, MyAccountActivity::class.java)
        intent.putExtra("userName", userName)
        startActivity(intent)
    }


}