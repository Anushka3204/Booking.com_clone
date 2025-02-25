import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsFormScreen extends StatefulWidget {
  @override
  _DetailsFormScreenState createState() => _DetailsFormScreenState();
}

class _DetailsFormScreenState extends State<DetailsFormScreen> {
  String? selectedCountry = "India";
  bool saveDetails = false;
  String tripPurpose = "Leisure";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      appBar: AppBar(
        backgroundColor: Color(0xFF003580), // Booking.com blue
        title: Text(
          "Fill in your details",
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 16), // Added padding
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField("First Name *"),
              buildTextField("Last Name *"),
              buildTextField("Email Address *"),
              buildDropdown("Country/Region *", ["India", "USA", "UK"]),
              buildTextField("Mobile phone *"),
              Row(
                children: [
                  Checkbox(
                    value: saveDetails,
                    onChanged: (bool? value) {
                      setState(() {
                        saveDetails = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "Save your details for future bookings",
                      style: GoogleFonts.montserrat(fontSize: 14),
                    ),
                  ),
                ],
              ),
              Text(
                "What is the primary purpose for your trip?",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              RadioListTile(
                title: Text("Leisure",
                    style: GoogleFonts.montserrat(fontSize: 14)),
                value: "Leisure",
                groupValue: tripPurpose,
                onChanged: (value) {
                  setState(() {
                    tripPurpose = value.toString();
                  });
                },
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Rs. 21,600 ",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    TextSpan(
                      text: " Rs. 11,880",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "+ Rs. 2,138.40 taxes and charges",
                style: GoogleFonts.montserrat(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF003580), // Booking.com blue
                  ),
                  onPressed: () {},
                  child: Text(
                    "Next step",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 4),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0)), // Added border
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }

  Widget buildDropdown(String label, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 4),
        DropdownButtonFormField(
          value: selectedCountry,
          items: options.map((String country) {
            return DropdownMenuItem(value: country, child: Text(country));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedCountry = newValue;
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0)), // Added border
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
