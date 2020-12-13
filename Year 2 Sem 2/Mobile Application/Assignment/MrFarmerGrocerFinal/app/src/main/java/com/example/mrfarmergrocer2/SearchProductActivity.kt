            package com.example.mrfarmergrocer2

import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.*
import android.widget.AdapterView.OnItemSelectedListener
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.mrfarmergrocer2.databinding.ActivitySearchProductBinding
import com.firebase.ui.database.FirebaseRecyclerOptions
import com.google.firebase.database.DatabaseReference
import com.google.firebase.database.FirebaseDatabase


class SearchProductActivity : AppCompatActivity() {
    private lateinit var productDatabaseRef: DatabaseReference
    private lateinit var recyclerView: RecyclerView
    private lateinit var layoutManager: RecyclerView.LayoutManager
    private lateinit var productsAdapter: ProductsAdapter

    private lateinit var noItemFoundTitle: TextView

    private lateinit var searchButton: Button
    private lateinit var searchProductName: EditText
    private var searchInput: String = ""

    private var categoryType: String = "vegetables"

    private var userName: String? = ""


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = DataBindingUtil.setContentView<ActivitySearchProductBinding>(
            this,
            R.layout.activity_search_product
        )

        getCurrentUserName()
        productDatabaseRef = FirebaseDatabase.getInstance().reference.child("products").child(categoryType)
        recyclerView = findViewById(R.id.searchProdRecycleView)
        recyclerView.setHasFixedSize(true)
        layoutManager = GridLayoutManager(this, 2)
        recyclerView.layoutManager = layoutManager
        searchButton = binding.searchProductButton
        searchProductName = binding.searchProductName
        noItemFoundTitle = binding.noItemFoundTitle

        searchButton.setOnClickListener(View.OnClickListener {
            searchInput = searchProductName.text.toString()
            searchInput = searchInput.split(' ').joinToString(" ") { it.capitalize() }
            Log.i("item", searchInput)
            onStart()
        })



        val spinner: Spinner = findViewById(R.id.category_type_spinner)
        ArrayAdapter.createFromResource(
            this,
            R.array.category_array,
            android.R.layout.simple_spinner_item
        ).also { adapter ->
            adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
            spinner.adapter = adapter
        }

        spinner.onItemSelectedListener = object : OnItemSelectedListener{
            override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
                categoryType = parent?.getItemAtPosition(position).toString()
                onStart()
            }

            override fun onNothingSelected(parent: AdapterView<*>?) {
                TODO("Not yet implemented")
            }

        }
    }

    override fun onStart() {
        super.onStart()
        productDatabaseRef = FirebaseDatabase.getInstance().reference.child("products").child(categoryType)
        val options = FirebaseRecyclerOptions.Builder<Product>().setQuery(
            productDatabaseRef.orderByChild("name").startAt(searchInput).endAt(searchInput+"\uf8ff"),
            Product::class.java
        ).build()

        productsAdapter = ProductsAdapter(options, applicationContext, userName.toString())
        recyclerView.adapter = productsAdapter
        productsAdapter.startListening()

    }

    private fun getCurrentUserName() {
        val intent = intent
        userName = intent.getStringExtra("userName")
        Log.i("hi", userName.toString())
    }
}