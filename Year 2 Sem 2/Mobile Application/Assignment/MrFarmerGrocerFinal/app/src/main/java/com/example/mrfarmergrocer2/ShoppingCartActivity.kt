package com.example.mrfarmergrocer2

import android.content.Intent
import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.ActionBarDrawerToggle
import androidx.core.view.GravityCompat
import androidx.databinding.DataBindingUtil
import androidx.drawerlayout.widget.DrawerLayout
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.cepheuen.elegantnumberbutton.view.ElegantNumberButton
import com.example.mrfarmergrocer2.databinding.ActivityShoppingCartBinding
import com.firebase.ui.database.FirebaseRecyclerOptions
import com.google.android.material.bottomnavigation.BottomNavigationView
import com.google.android.material.navigation.NavigationView
import com.google.firebase.database.*

class ShoppingCartActivity : AppCompatActivity() {
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
            R.id.productPage -> {
                val intent = Intent(this, AllProductsActivity::class.java)
                intent.putExtra("userName", userName)
                startActivity(intent)
            }
        }
        false
    }

    private lateinit var shoppingCartProdDBRef: DatabaseReference
    private lateinit var addressDatabaseRef: DatabaseReference
    private lateinit var orderDatabaseRef: DatabaseReference
    private lateinit var orderProdsDatabaseRef: DatabaseReference
    private lateinit var prodDatabaseRef: DatabaseReference
    private lateinit var recyclerView: RecyclerView
    private lateinit var layoutManager: RecyclerView.LayoutManager
    private lateinit var shoppingCartAdapter: CartAdapter

    private var navigateFromAddress: Boolean = false

    private lateinit var numOfProdAdded: ElegantNumberButton

    private lateinit var drawerLayout: DrawerLayout
    private lateinit var toggle: ActionBarDrawerToggle
    private lateinit var toolbar: androidx.appcompat.widget.Toolbar

    private lateinit var navigationView: NavigationView

    private lateinit var overAllTotal: TextView
    private lateinit var recipientName: TextView
    private lateinit var orderAddressTitle: TextView
    private lateinit var recipientPhone: TextView
    private lateinit var recipientAddressDetails: TextView

    private lateinit var shippingTitle: TextView
    private lateinit var totalTitle: TextView
    private lateinit var totalPrice: TextView
    private lateinit var noItemInCartText: TextView
    private lateinit var goToShopButton: Button

    private lateinit var deleteButton: Button
    private lateinit var checkOutButton: Button
    private lateinit var selectAddressButton: Button
    private var pIdArrayList = mutableMapOf<String, String>()
    private var nameArrayList = mutableMapOf<String, String>()

    private var userName: String? = ""
    private lateinit var position: String

    private var addressButtonClick:Boolean = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivityShoppingCartBinding>(this, R.layout.activity_shopping_cart)

        getCurrentUserName()
        if(navigateFromAddress){
            getCurrentPosition()
            getAllAddressesDetails()
        }

        deleteButton = binding.shoppingCartDeleteButton
        checkOutButton = binding.checkOutButton
        selectAddressButton = binding.selectAddressButton

        recipientName = binding.shoppingCartReciName
        recipientAddressDetails = binding.shoppingCartAddressDetails
        recipientPhone = binding.shoppingCartPhoneNum
        orderAddressTitle = binding.shoppingCartAddressTitle

        shippingTitle = binding.shippingTitle
        totalTitle = binding.totalTitle
        totalPrice = binding.totalPrice

        noItemInCartText = binding.noItemInCartText
        goToShopButton = binding.goToShoppingButton


        overAllTotal = binding.totalPrice
        toolbar = binding.shoppingCartToolbar
        drawerLayout = binding.drawerLayout
        toggle = ActionBarDrawerToggle(this, drawerLayout, toolbar, R.string.drawer_open, R.string.drawer_close)
        drawerLayout.addDrawerListener(toggle)
        toggle.syncState()

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
                R.id.nav_categories -> {
                    val intent = Intent(applicationContext, AllProductsActivity::class.java)
                    intent.putExtra("userName", userName)
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

        bottomNavigation.selectedItemId = R.id.cartPage

        bottomNavigation.setOnNavigationItemSelectedListener(onNavigationItemSelectedListener)

        shoppingCartProdDBRef = FirebaseDatabase.getInstance().reference.child("cart").child(userName.toString())
        recyclerView = findViewById(R.id.shoppingCartRecycleView)
        recyclerView.setHasFixedSize(true)
        layoutManager = LinearLayoutManager(this)
        recyclerView.layoutManager = layoutManager

        selectAddressButton.setOnClickListener(View.OnClickListener {
            addressButtonClick = true
            goToAddress() })

        deleteButton.setOnClickListener(View.OnClickListener {  deleteCartItem() })

        goToShopButton.setOnClickListener(View.OnClickListener { goToProductPage() })

        checkOutButton.setOnClickListener(View.OnClickListener {  checkOut() })
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

        //If not data inside the shopping cart database, show the goToShop button and no item in cart text instead
        shoppingCartProdDBRef = FirebaseDatabase.getInstance().reference.child("cart").child(userName.toString())
        shoppingCartProdDBRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(!snapshot.exists()){
                    checkOutButton.visibility = View.INVISIBLE
                    selectAddressButton.visibility = View.INVISIBLE
                    shippingTitle.visibility = View.INVISIBLE
                    totalTitle.visibility = View.INVISIBLE
                    totalPrice.visibility = View.INVISIBLE
                    goToShopButton.visibility = View.VISIBLE
                    noItemInCartText.visibility = View.VISIBLE
                }
                else{
                    checkOutButton.visibility = View.VISIBLE
                    checkOutButton.isEnabled = false
                    selectAddressButton.visibility = View.VISIBLE
                    shippingTitle.visibility = View.VISIBLE
                    totalTitle.visibility = View.VISIBLE
                    totalPrice.visibility = View.VISIBLE
                    goToShopButton.visibility = View.INVISIBLE
                    noItemInCartText.visibility = View.INVISIBLE
                }
            }

            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }

        })


        val options: FirebaseRecyclerOptions<Cart> = FirebaseRecyclerOptions.Builder<Cart>().setQuery(shoppingCartProdDBRef, Cart::class.java).build()
        shoppingCartAdapter = CartAdapter(options, applicationContext, userName.toString(), overAllTotal, pIdArrayList, nameArrayList, checkOutButton)
        recyclerView.adapter = shoppingCartAdapter
        shoppingCartAdapter.startListening()
    }

    private fun getCurrentUserName() {
        val intent = intent
        userName = intent.getStringExtra("userName")
        navigateFromAddress = intent.getStringExtra("navigateFromAddress").toString().toBoolean()

    }

    private fun getCurrentPosition(){
        val intent = intent
        position = intent.getStringExtra("position").toString()
    }

    private fun goToProductPage(){
        val intent = Intent(this, AllProductsActivity::class.java)
        intent.putExtra("userName", userName)
        startActivity(intent)
    }


    private fun goToAddress(){
        val intent = Intent(this, AllAddressActivity::class.java)
        intent.putExtra("userName", userName)
        intent.putExtra("selectAddress", "true")
        startActivity(intent)
    }

    //After the user select the delivery address, show the delivery address details
    private fun getAllAddressesDetails(){
        var position = position.toInt()
        position += 1
        val currentPosition = "address$position"
        addressDatabaseRef = FirebaseDatabase.getInstance().reference.child("addresses").child(userName.toString())
        addressDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                val name = snapshot.child(currentPosition).child("name").value.toString()
                val addressDetails = snapshot.child(currentPosition).child("addressDetails").value.toString()
                val phoneNum = snapshot.child(currentPosition).child("phoneNum").value.toString()
                val postalCode = snapshot.child(currentPosition).child("postalCode").value.toString()
                val city = snapshot.child(currentPosition).child("city").value.toString()
                val state = snapshot.child(currentPosition).child("state").value.toString()
                val allAddressDetails = "$addressDetails, $postalCode, $city, $state"
                recipientName.text = name
                recipientPhone.text = phoneNum
                recipientAddressDetails.text = allAddressDetails
                recipientName.visibility = View.VISIBLE
                recipientAddressDetails.visibility = View.VISIBLE
                recipientPhone.visibility = View.VISIBLE
                orderAddressTitle.visibility = View.VISIBLE
            }

            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }

        })

    }

    private fun deleteCartItem(){
        shoppingCartProdDBRef = FirebaseDatabase.getInstance().reference.child("cart").child(userName.toString())
        for ((id, category) in pIdArrayList){
            shoppingCartProdDBRef.addListenerForSingleValueEvent(object: ValueEventListener{
                override fun onDataChange(snapshot: DataSnapshot) {
                    shoppingCartProdDBRef.child(id).removeValue().addOnCompleteListener(){ task ->
                        if(task.isSuccessful){

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

    //Allow the user to select only certain products to pay
    private fun checkOut(){
        var position = position.toInt()
        var tolOfProd = 0
        position += 1
        val currentPosition = "address$position"
        orderDatabaseRef = FirebaseDatabase.getInstance().reference.child("orders")
        orderDatabaseRef.addListenerForSingleValueEvent(object: ValueEventListener{
            override fun onDataChange(snapshot: DataSnapshot) {
                if(!snapshot.child(userName.toString()).exists()){
                    val orderMap: HashMap<String, String> = HashMap<String, String>()
                    orderMap["oid"] = "${userName}MY1"
                    orderMap["orderAddress"] = currentPosition

                    for((name, tol) in nameArrayList){
                        tolOfProd += tol.toInt()
                    }
                    orderMap["totalItem"] = tolOfProd.toString()
                    orderMap["totalPrice"] = overAllTotal.text.toString()
                    orderMap["userName"] = userName.toString()
                    addOrderProdsDetails("${userName}MY1")
                    deleteCartItem()
                    orderDatabaseRef.child(userName.toString()).child("${userName}MY1").setValue(orderMap).addOnCompleteListener(){task ->
                        if(task.isSuccessful){
                            Toast.makeText(applicationContext, "Directing to Payment Page", Toast.LENGTH_SHORT).show()
                            val intent = Intent(applicationContext, PaymentActivity::class.java)
                            intent.putExtra("userName", userName)
                            intent.putExtra("subTotal", overAllTotal.text.toString())
                            startActivity(intent)
                        }
                        else{
                            Toast.makeText(applicationContext, "Network Error. Please try again some time." + task.exception?.message, Toast.LENGTH_SHORT).show()
                        }
                    }
                }
                else{
                    var numberOfCurrentOrder = snapshot.child(userName.toString()).childrenCount
                    numberOfCurrentOrder += 1

                    val orderMap: HashMap<String, String> = HashMap<String, String>()
                    orderMap["oid"] = "${userName}MY$numberOfCurrentOrder"
                    orderMap["orderAddress"] = currentPosition

                    for((name, tol) in nameArrayList){
                        tolOfProd += tol.toInt()
                    }
                    orderMap["totalItem"] = tolOfProd.toString()
                    orderMap["totalPrice"] = overAllTotal.text.toString()
                    orderMap["userName"] = userName.toString()
                    addOrderProdsDetails("${userName}MY$numberOfCurrentOrder")
                    deleteCartItem()
                    orderDatabaseRef.child(userName.toString()).child("${userName}MY$numberOfCurrentOrder").setValue(orderMap).addOnCompleteListener(){task ->
                        if(task.isSuccessful){
                            Toast.makeText(applicationContext, "Directing to Payment Page", Toast.LENGTH_SHORT).show()
                            val intent = Intent(applicationContext, PaymentActivity::class.java)
                            intent.putExtra("userName", userName)
                            intent.putExtra("subTotal", overAllTotal.text.toString())
                            startActivity(intent)
                        }
                        else{
                            Toast.makeText(applicationContext, "Network Error. Please try again some time." + task.exception?.message, Toast.LENGTH_SHORT).show()
                        }
                    }
                }
            }

            override fun onCancelled(error: DatabaseError) {
                TODO("Not yet implemented")
            }

        })
    }

    private fun addOrderProdsDetails(oid: String){
        orderProdsDatabaseRef = FirebaseDatabase.getInstance().reference.child("orderProds")
        for((id, category) in pIdArrayList){
//            var categoryType = category
            shoppingCartProdDBRef = FirebaseDatabase.getInstance().reference.child("cart").child(userName.toString()).child(id)
            shoppingCartProdDBRef.addListenerForSingleValueEvent(object: ValueEventListener{
                override fun onDataChange(snapshot: DataSnapshot) {
                    val productMap: HashMap<String, String> = HashMap<String, String>()
                    productMap["category"] = snapshot.child("category").value.toString()
                    productMap["image"] = snapshot.child("image").value.toString()
                    productMap["pid"] = snapshot.child("pid").value.toString()
                    productMap["name"] = snapshot.child("name").value.toString()
                    productMap["price"] = snapshot.child("price").value.toString()
                    productMap["tolOfProd"] = snapshot.child("tolOfProd").value.toString()
                    orderProdsDatabaseRef.child(userName.toString()).child(oid).child(id).setValue(productMap).addOnCompleteListener(){ task ->
                        if(task.isSuccessful){

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
}

