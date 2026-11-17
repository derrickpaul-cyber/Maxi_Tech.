# MaxiTech setup (GitHub + Supabase)

## A. Create the database (free)
1. Go to supabase.com, sign up, click **New project** (any name, choose a password, pick a region near you).
2. Open **SQL Editor** > New query. Paste everything from `supabase-setup.sql`.
   **First change `CHANGE-ME@example.com` to your own email**, then click Run.
3. Open **Authentication > Users > Add user > Create new user**. Enter your email and a strong password, tick "Auto Confirm User".
4. Open **Authentication > Sign In / Providers** and turn **OFF** "Allow new users to sign up" (so only you can ever log in).
5. Open **Project Settings > API**. Copy the **Project URL** and the **Publishable key** (sb_publishable_...). Never use a secret key.

## B. Connect the site
6. Open `config.js` and paste the two values between the quotes. Save.
7. In `script.js`, near the top, change WA / PHONE / LOCATION to your real details.

## C. Put it on GitHub
8. Create a public GitHub repository. Upload ALL files in this folder (index.html, style.css, script.js, config.js) to the top level.
9. Repository **Settings > Pages > Deploy from a branch > main / (root) > Save**.
10. In about a minute your shop is live at https://YOUR-USERNAME.github.io/YOUR-REPO/

## D. Using the admin
- Open **About**, tap **"Quality to the Max."** twice, enter the PIN (8899), then log in with your Supabase email and password.
- First time only: in Manage Products tap **Add missing sample products** to put the products into your database.
- You can then add/edit phones (with photos and release dates), switch stock on/off, and see Orders and Visitors.

Notes: the publishable key in config.js is meant to be public; the database rules (supabase-setup.sql) are what protect your data. Customers' orders are saved in the Orders tab and also sent to WhatsApp.
