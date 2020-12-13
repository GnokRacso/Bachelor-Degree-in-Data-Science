package com.example.mrfarmergrocer2

import android.content.ContentResolver
import android.content.Intent
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.webkit.MimeTypeMap
import android.widget.Button
import android.widget.ImageButton
import android.widget.Toast
import com.google.android.gms.tasks.*
import com.google.android.material.textfield.TextInputLayout
import com.google.firebase.database.DatabaseReference
import com.google.firebase.database.FirebaseDatabase
import com.google.firebase.storage.FirebaseStorage
import com.google.firebase.storage.StorageReference
import com.google.firebase.storage.UploadTask
import java.text.SimpleDateFormat
import java.util.*

class AdminAddNewProductActivity : AppCompatActivity() {
    private lateinit var databaseRef: DatabaseReference
    private lateinit var pName: TextInputLayout
    private lateinit var pDesc: TextInputLayout
    private lateinit var pPrice: TextInputLayout
    private lateinit var addProdButton: Button
    private lateinit var pImage: ImageButton
    private lateinit var categoryType: String

    private lateinit var saveCurrentDate: String
    private lateinit var saveCurrentTime: String

    private lateinit var imageUri: Uri
    private lateinit var productRandomKey: String
    private lateinit var downloadImageUrl: String
    private lateinit var productImageRef: StorageReference

    private val galleryPick = 1
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_admin_add_new_product)

        pName = findViewById(R.id.productNameInput)
        pDesc = findViewById(R.id.productDescriptionInput)
        pPrice = findViewById(R.id.productPriceInput)
        addProdButton = findViewById(R.id.addProductButton)
        pImage = findViewById(R.id.imageInput)

        databaseRef = FirebaseDatabase.getInstance().reference

        productImageRef =FirebaseStorage.getInstance().reference.child("products image")

        getCategoryType()
        Toast.makeText(this, categoryType, Toast.LENGTH_SHORT).show()

        pImage.setOnClickListener(View.OnClickListener {openGallery()})
        addProdButton.setOnClickListener(View.OnClickListener {  validateInputProd() })


    }

    private fun getCategoryType() {
        val intent = intent
        categoryType = intent.getStringExtra("category").toString()
    }

    private fun openGallery() {
        val galleryIntent = Intent().setAction(Intent.ACTION_GET_CONTENT)
        galleryIntent.type = "image/*"
        startActivityForResult(galleryIntent, galleryPick)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if(requestCode == galleryPick && resultCode == RESULT_OK && data != null && data.data != null){
            imageUri = data.data!!
            pImage.setImageURI(imageUri)
        }
    }

    private fun validateInputProd() {

        if (imageUri == null){
            Toast.makeText(this, "Please insert product image", Toast.LENGTH_SHORT).show()
        }
        else{
            storeProductData()
        }
    }

    private fun getExtension(uri: Uri): String?{
        val cr: ContentResolver = contentResolver
        val mimeTypeMap: MimeTypeMap = MimeTypeMap.getSingleton()
        return mimeTypeMap.getExtensionFromMimeType(cr.getType(uri))
    }

    private fun storeProductData() {
//        val calendar = Calendar.getInstance()
//        val currentDate = SimpleDateFormat ("MMM dd, yyyy")
//        saveCurrentDate =currentDate.format(calendar.time)
//
//        val currentTime = SimpleDateFormat("HH:mm:ss a")
//        saveCurrentTime =currentTime.format(calendar.time)
//

        val description = pDesc.editText?.text.toString().trim()
        val name = pName.editText?.text.toString().trim()
        val price = pPrice.editText?.text.toString().trim()
        val category = categoryType
        productRandomKey = System.currentTimeMillis().toString()+ "." + getExtension(imageUri)

            val filePath: StorageReference = productImageRef.child(productRandomKey)

        val uploadTask = filePath.putFile(imageUri)

        uploadTask.addOnFailureListener(object: OnFailureListener{
            override fun onFailure(p0: Exception) {
                val message = p0.toString()
                Toast.makeText(applicationContext, "Error: $message", Toast.LENGTH_SHORT).show()
            }
        }).addOnSuccessListener (object: OnSuccessListener <UploadTask.TaskSnapshot> {
            override fun onSuccess(p0: UploadTask.TaskSnapshot) {
                Toast.makeText(applicationContext, "Image uploaded Successfully", Toast.LENGTH_SHORT).show()
                downloadImageUrl = filePath.downloadUrl.toString()
                Log.i("Hi", downloadImageUrl)
                val urlTask: Task<Uri> = uploadTask.continueWithTask(object: Continuation<UploadTask.TaskSnapshot, Task<Uri>>{
                    override fun then(p0: Task<UploadTask.TaskSnapshot>): Task<Uri> {
                        if(!p0.isSuccessful){
                            Toast.makeText(applicationContext, p0.exception.toString(), Toast.LENGTH_SHORT).show()
                        }
                        downloadImageUrl =filePath.downloadUrl.toString()
                        Log.i("Hi", downloadImageUrl)
                        return filePath.downloadUrl
                    }
                }).addOnCompleteListener(object: OnCompleteListener<Uri>{
                    override fun onComplete(p0: Task<Uri>)
                    {
                        Log.i("Hi",filePath.downloadUrl.toString())
                        if(p0.isSuccessful){
                            downloadImageUrl = p0.result.toString()
                            Log.i("Hi", downloadImageUrl)
                            Toast.makeText(applicationContext, "got the Product image URL successfully", Toast.LENGTH_SHORT).show()
//                            saveProductToDatabase(productRandomKey, description, downloadImageUrl, category, price, name)
                        }
                    }
                })
            }
        })
    }

//    private fun saveProductToDatabase(productID: String, description: String, imageURL: String, category: String, price: String, name: String) {
//        Log.i("Hi","1234")
//        databaseRef = FirebaseDatabase.getInstance().reference
//        val productDetails = Product(productID, description, imageURL, category, price, name)
//
//        databaseRef.child("products").child(productRandomKey).setValue(productDetails).addOnCompleteListener(object: OnCompleteListener<Void>{
//            override fun onComplete(p0: Task<Void>) {
//                if(p0.isSuccessful){
//                    Toast.makeText(applicationContext, "Add product to database successfully", Toast.LENGTH_SHORT).show()
//
//                    startActivity(Intent(applicationContext,AdminCategoryActivity::class.java))
//                }
//                else{
//                    Toast.makeText(applicationContext, "Network Error. Please try again some time.", Toast.LENGTH_SHORT).show()
//                }
//            }
//
//        })
//    }
}
