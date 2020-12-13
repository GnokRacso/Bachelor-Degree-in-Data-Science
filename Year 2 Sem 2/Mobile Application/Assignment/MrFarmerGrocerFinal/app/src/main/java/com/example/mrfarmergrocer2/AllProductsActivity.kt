package com.example.mrfarmergrocer2

import android.content.Intent
import android.media.Image
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.*
import androidx.appcompat.app.ActionBarDrawerToggle
import androidx.core.view.GravityCompat
import androidx.databinding.DataBindingUtil
import androidx.drawerlayout.widget.DrawerLayout
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.mrfarmergrocer2.databinding.ActivityAllProductsBinding
import com.firebase.ui.database.FirebaseRecyclerOptions
import com.google.android.material.bottomnavigation.BottomNavigationView
import com.google.android.material.navigation.NavigationView
import com.google.firebase.database.DatabaseReference
import com.google.firebase.database.FirebaseDatabase

class AllProductsActivity : AppCompatActivity() {
    // Bottom footer navigation
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

    //Recycler View to show all the products available in shop
    private lateinit var productDatabaseRef: DatabaseReference
    private lateinit var recyclerView: RecyclerView
    private lateinit var layoutManager: RecyclerView.LayoutManager
    private lateinit var productsAdapter: ProductsAdapter

    private lateinit var navigationView: NavigationView

    private lateinit var drawerLayout: DrawerLayout
    private lateinit var toggle: ActionBarDrawerToggle
    private lateinit var toolbar: androidx.appcompat.widget.Toolbar

    private lateinit var searchButton: ImageButton

    private lateinit var categoryTitle: TextView
    private var userName: String? = ""
    private var categoryType: String = "vegetables"


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivityAllProductsBinding>(this, R.layout.activity_all_products)

        getCurrentUserName()

        searchButton = binding.searchButton

        categoryTitle = binding.categoryType

        //To show the navigation drawer
        toolbar = binding.productsToolBar
        drawerLayout = binding.drawerLayout
        toggle = ActionBarDrawerToggle(this, drawerLayout, toolbar, R.string.drawer_open, R.string.drawer_close)
        drawerLayout.addDrawerListener(toggle)
        toggle.syncState()

        //Navigation Drawer navigation
        navigationView = binding.navView
        navigationView.setNavigationItemSelectedListener { item ->
            when (item.itemId) {
                R.id.nav_account -> {
                    val intent = Intent(applicationContext, MyAccountActivity::class.java)
                    intent.putExtra("userName", userName)
                    startActivity(intent)
                }
                R.id.nav_contactUs -> {
                    val intent = Intent(applicationContext, ContactUsActivity::class.java)
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

        bottomNavigation.selectedItemId = R.id.productPage

        bottomNavigation.setOnNavigationItemSelectedListener(onNavigationItemSelectedListener)

        //Set up the recycler view to show all the products
        productDatabaseRef = FirebaseDatabase.getInstance().reference.child("products")
        recyclerView = findViewById(R.id.productRecycleView)
        recyclerView.setHasFixedSize(true)
        layoutManager = GridLayoutManager(this, 2)
        recyclerView.layoutManager = layoutManager

        //Spinner determine what category user want to see
        val spinner: Spinner = binding.categoryTypeSpinnerAllProd
        ArrayAdapter.createFromResource(
            this,
            R.array.category_array,
            android.R.layout.simple_spinner_item
        ).also { adapter ->
            adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
            spinner.adapter = adapter
        }

        spinner.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
                categoryType = parent?.getItemAtPosition(position).toString()
                categoryTitle.text = categoryType.toUpperCase()
                onStart()
            }

            override fun onNothingSelected(parent: AdapterView<*>?) {
                TODO("Not yet implemented")
            }

        }

        searchButton.setOnClickListener(View.OnClickListener { goToSearchProduct() })
    }

    override fun onBackPressed() {
        if (drawerLayout.isDrawerOpen(GravityCompat.START)) {
            drawerLayout.closeDrawer(GravityCompat.START)
        }
        else{
            super.onBackPressed()
        }

    }

    override fun onStart() {
        super.onStart()
        productDatabaseRef = FirebaseDatabase.getInstance().reference.child("products").child(categoryType)
        val options: FirebaseRecyclerOptions<Product> = FirebaseRecyclerOptions.Builder<Product>().setQuery(productDatabaseRef, Product::class.java).build()

        productsAdapter = ProductsAdapter(options, applicationContext, userName.toString())
        recyclerView.adapter = productsAdapter
        productsAdapter.startListening()
    }

    override fun onStop() {
        super.onStop()
        productsAdapter.stopListening()
    }


    private fun getCurrentUserName() {
        val intent = intent
        userName = intent.getStringExtra("userName")
        Log.i("hi", userName.toString())
    }

    private fun goToSearchProduct(){
        val intent = Intent(this, SearchProductActivity::class.java)
        intent.putExtra("userName",userName)
        startActivity(intent)
    }

}