# Nest Cafe Website

A single-page cafe website with menu, table booking, ordering, UPI payment (QR), receipt, and WhatsApp messages.

## Project structure

```
nest-cafe-project/
├── index.html          Main website (HTML, CSS and JavaScript in one file)
├── supabase-schema.sql Database tables and security rules for Supabase
├── images/             Cafe photos used on the page
│   ├── cafe-latte-pair.jpg
│   ├── cafe-heart-latte.jpg
│   └── cafe-coffee-menu.jpg
└── README.md           This file
```

## Run it locally

1. Open `index.html` in any browser. No install needed.
2. Keep the `images/` folder next to `index.html`.
3. The QR code and fonts load from the internet, so you need internet access.

## Setup the database (Supabase)

1. Go to https://supabase.com and create a free account.
2. Click **New project**, give it a name (for example `nest-cafe`), and set a database password. Save the password somewhere safe.
3. Open **SQL Editor > New query**, paste everything from `supabase-schema.sql`, and click **Run**.
4. Go to **Project Settings > API** and copy:
   - **Project URL**
   - **anon public key**

   Do NOT copy or share the `service_role` key. It must never go in the website code.

Tables created: `bookings`, `orders`, `stamps`, `waitlist`, `contacts`.

## Put the website online (free)

Option A, Netlify Drop: go to https://app.netlify.com/drop and drag the whole `nest-cafe-project` folder in. You get a public link in under a minute.

Option B, GitHub Pages: upload the folder to a GitHub repository, then turn on Pages in the repository settings.

## What works now and what is next

| Feature | Status |
|---|---|
| Menu, mood picker, daily special | Works (front end) |
| Table booking, booking ticket | Works. Customer sends details to the cafe on WhatsApp |
| Order, cart, UPI QR payment | Works. Payment is confirmed manually by staff |
| Receipt | Works. Shows "Order received", not "paid" |
| Stamp card | Works on one device only (saved in the browser) |
| Waiting list, contact form | Works. Details sent to the cafe on WhatsApp |
| Save bookings and orders to Supabase | **Next step** (not connected yet) |
| Automatic payment confirmation (Razorpay) | **Later step** |
| Staff admin page with login | **Later step** |

## Security notes

- Only the **anon** key goes in the website code. It is safe to be public, because the security rules in `supabase-schema.sql` allow only inserts.
- Never put the `service_role` key or the Razorpay secret key in `index.html`. Those belong on a server.
- Staff should read bookings and orders from the Supabase dashboard, not from the public website.

## Business details to update

Search `index.html` and replace these placeholders:
- `12 Market Lane, Your City` (address)
- `+1 000 000 0000` (phone number)
- Opening hours in the "Open hours" card
- Menu items and prices (Menu, Sweets and bubble tea sections, and the `MENU` list in the script)
- UPI ID `dkamali751@oksbi` (in the payment QR code)
- WhatsApp number `918248690128` (in the `waSend` function, use country code + number)
- Instagram and Facebook links in the footer
- Reviews in the "Kind words" section (use real customer reviews only)
