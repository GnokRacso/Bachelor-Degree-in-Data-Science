package com.example.mrfarmergrocer2

import android.accounts.Account
import android.content.DialogInterface
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.MenuItem
import android.view.View
import android.widget.*
import androidx.appcompat.app.ActionBarDrawerToggle
import androidx.appcompat.app.AlertDialog
import androidx.core.view.GravityCompat
import androidx.databinding.DataBindingUtil
import androidx.drawerlayout.widget.DrawerLayout
import com.example.mrfarmergrocer2.databinding.ActivityLogInBinding
import com.example.mrfarmergrocer2.databinding.ActivityMyAccountBinding
import com.google.android.material.bottomnavigation.BottomNavigationView
import com.google.android.material.navigation.NavigationView
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.database.*
import com.google.firebase.ktx.Firebase
import com.squareup.picasso.Picasso
import de.hdodenhof.circleimageview.CircleImageView
import io.paperdb.Paper

class MyAccountActivity : AppCompatActivity() {
    //Bottom Navigation
    private val onNavigationItemSelectedListener = BottomNavigationView.OnNavigationItemSelectedListener { item ->
        when (item.itemId) {
            R.id.homePage -> {
                val intent = Intent(this, HomeActivity::class.java)
                intent.putExtra("userName", userName)
                startActivity(intent)
            }
            R.id.contactPage -> {
                val intent = Intent(this, ContactUsActivity::class.java)
                intent.putExtra("userName", userName)
                startActivity(intent)
            }
            R.id.productPage -> {
                val intent = Intent(this, AllProductsActivity::class.java)
                intent.putExtra("userName", userName)
                startActivity(intent)
            }
            R.id.cartPage -> {
                val intent = Intent(this, ShoppingCartActivity::class.java)
                intent.putExtra("userName", userName)
                intent.putExtra("navigateFromAddress", "false")
                startActivity(intent)
            }

        }
        false
    }
    private lateinit var databaseRef: DatabaseReference
    private lateinit var drawerLayout: DrawerLayout
    private lateinit var toggle: ActionBarDrawerToggle
    private lateinit var toolbar: androidx.appcompat.widget.Toolbar
    private lateinit var navigationView: NavigationView


    private lateinit var fullName: TextView
    private lateinit var profilePicture: CircleImageView
    private lateinit var progressBar: ProgressBar

    private var userName: String? = ""
    private var userFullName: String? = ""



    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivityMyAccountBinding>(this, R.layout.activity_my_account)

        fullName = binding.userFullName
        profilePicture = binding.profilePicture
        progressBar = binding.progressBar

        Paper.init(this);

        //Set Up navigation drawer
        toolbar = binding.myAccountToolbar
        drawerLayout = binding.drawerLayout
        toggle = ActionBarDrawerToggle(this, drawerLayout, toolbar, R.string.drawer_open, R.string.drawer_close)
        drawerLayout.addDrawerListener(toggle)
        toggle.syncState()

        getCurrentUserName()
        getAllUserData(userName.toString())

        //Navigation Drawer Activity
        navigationView = binding.navView
        navigationView.setNavigationItemSelectedListener { item ->
            when (item.itemId) {
                R.id.nav_contactUs -> {
                    val intent = Intent(applicationContext, ContactUsActivity::class.java)
                    intent.putExtra("userName", userName)
                    startActivity(intent)
                }
                R.id.nav_categories -> {
                    val intent = Intent(applicationContext, AllProductsActivity::class.java)
                    intent.putExtra("userName", userName)
                    startActivity(intent)
                }
                R.id.nav_cart -> {
                    val intent = Intent(applicationContext, ShoppingCartActivity::class.java)
                    intent.putExtra("userName", userName)
                    intent.putExtra("navigateFromAddress", "false")
                    startActivity(intent)
                }
                R.id.nav_home -> {
                    val intent = Intent(applicationContext, HomeActivity::class.java)
                    intent.putExtra("userName", userName)
                    startActivity(intent)
                }
                R.id.nav_orders -> {
                    val intent = Intent(applicationContext, AllOrdersActivity::class.java)
                    intent.putExtra("userName", userName)
                    startActivity(intent)
                }
            }
            true
        }

        val wishListButton = binding.wishListButton
        val accountSettingsButton = binding.accountSettingsButton
        val allAddressesButton = binding.myAddressesButton
        val logOutButton = binding.logOutButton
        val ordersButton = binding.allOrdersButton

        val bottomNavigation = binding.bottomNavigation

        bottomNavigation.selectedItemId = R.id.accountPage

        bottomNavigation.setOnNavigationItemSelectedListener(onNavigationItemSelectedListener)

        logOutButton.setOnClickListener(View.OnClickListener() {logOut()})
        accountSettingsButton.setOnClickListener(View.OnClickListener() {goToAccountSettings()})
        allAddressesButton.setOnClickListener(View.OnClickListener { goToUserAddresses() })
        wishListButton.setOnClickListener(View.OnClickListener { goToUserWishList() })
        ordersButton.setOnClickListener(View.OnClickListener { goToUserOrders() })
    }

    override fun onBackPressed() {
        if(drawerLayout.isDrawerOpen(GravityCompat.START)) {
            drawerLayout.closeDrawer(GravityCompat.START)
        }
        else{
            super.onBackPressed()
        }
    }

    //Log Out Dialog
    
    val logOut ={ dialog: DialogInterface, which: Int ->
        val intent = Intent(this, LogInActivity::class.java)
        Paper.book().destroy();
        startActivity(intent)
    }

    val noLogOut = {dialog: DialogInterface, which: Int ->
        Toast.makeText(applicationContext,
            R.string.no, Toast.LENGTH_SHORT).show()
    }

    fun dialogLogOut() {
        val builder = AlertDialog.Builder(this)

        with(builder){
            setTitle("Log Out")
            setMessage("Do you want to Log Out?")
            builder.setPositiveButton(R.string.yes, DialogInterface.OnClickListener(function = logOut))
            setNegativeButton(R.string.no, DialogInterface.OnClickListener(function = noLogOut))
        }
        val alertDialog = builder.create()
        alertDialog.show()
    }

    fun logOut() {
        dialogLogOut()
    }

    private fun goToUserOrders() {
        val intent = Intent(this, AllOrdersActivity::class.java)
        intent.putExtra("userName", userName)
        startActivity(intent)
    }

    //Go To Account Settings

    private fun goToAccountSettings() {
        val intent = Intent(this, AccountSettingActivity::class.java)
        intent.putExtra("userName", userName)
        startActivity(intent)
    }

    private fun goToUserAddresses() {
        val intent = Intent(this, AllAddressActivity::class.java)
        intent.putExtra("userName", userName)
        intent.putExtra("selectAddress", "false")
        startActivity(intent)
    }

    private fun goToUserWishList() {
        val intent = Intent(this, AllWishListProductsActivity::class.java)
        intent.putExtra("userName", userName)
        startActivity(intent)
    }

    private fun getCurrentUserName() {
        val intent = intent
        userName = intent.getStringExtra("userName")
        Log.i("hi", userName.toString())
    }

    private fun getAllUserData(username: String){

        databaseRef = FirebaseDatabase.getInstance().reference.child("users")

        databaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(snapshot.child(username).exists()){
                    if(snapshot.child(username).child("image").exists()){
                        val name = snapshot.child(username).child("fullName").value.toString()
                        val image = snapshot.child(username).child("image").value.toString()
                        fullName.text = name
                        Picasso.get().load(image).into(profilePicture)
                    }
                    else{
                        val name = snapshot.child(username).child("fullName").value.toString()
                        fullName.text = name
                    }
                }
            }
            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }

        })
    }

}