package com.example.mrfarmergrocer2

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.ActionBarDrawerToggle
import androidx.core.view.GravityCompat
import androidx.databinding.DataBindingUtil
import androidx.drawerlayout.widget.DrawerLayout
import com.example.mrfarmergrocer2.databinding.ActivityContactUsBinding
import com.google.android.material.bottomnavigation.BottomNavigationView
import com.google.android.material.navigation.NavigationView

class ContactUsActivity : AppCompatActivity() {
    //Bottom Footbar Navigation
    private val onNavigationItemSelectedListener = BottomNavigationView.OnNavigationItemSelectedListener { item ->
        when (item.itemId) {
            R.id.homePage -> {
                val intent = Intent(this, HomeActivity::class.java)
                intent.putExtra("userName", userName)
                startActivity(intent)
            }
            R.id.productPage -> {
                val intent = Intent(this, AllProductsActivity::class.java)
                intent.putExtra("userName", userName)
                startActivity(intent)
            }
            R.id.accountPage -> {
                val intent = Intent(this, MyAccountActivity::class.java)
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

    private var userName: String? = ""

    private lateinit var drawerLayout: DrawerLayout
    private lateinit var toggle: ActionBarDrawerToggle
    private lateinit var toolbar: androidx.appcompat.widget.Toolbar
    private lateinit var navigationView: NavigationView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivityContactUsBinding>(this, R.layout.activity_contact_us)

        getCurrentUserName()

        toolbar = binding.contactUsToolbar
        drawerLayout = binding.drawerLayout
        toggle = ActionBarDrawerToggle(this, drawerLayout, toolbar, R.string.drawer_open, R.string.drawer_close)
        drawerLayout.addDrawerListener(toggle)
        toggle.syncState()

        //Navigation drawer navigation
        navigationView = binding.navView
        navigationView.setNavigationItemSelectedListener { item ->
            when (item.itemId) {
                R.id.nav_account -> {
                    val intent = Intent(applicationContext, MyAccountActivity::class.java)
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

        val bottomNavigation = binding.bottomNavigation

        bottomNavigation.selectedItemId = R.id.contactPage

        bottomNavigation.setOnNavigationItemSelectedListener(onNavigationItemSelectedListener)


    }

    override fun onBackPressed() {
        if(drawerLayout.isDrawerOpen(GravityCompat.START)) {
            drawerLayout.closeDrawer(GravityCompat.START)
        }
        else{
            super.onBackPressed()
        }
    }

    private fun getCurrentUserName() {
        val intent = intent
        userName = intent.getStringExtra("userName")
        Log.i("hi", userName.toString())
    }
}