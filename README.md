# ΠΜΣ16 Διαχείριση Δικτυακών και Υπολογιστικών Πόρων

Το παρόν repository αποτελεί υλοποίηση της εξαμηνιαίας εργασίας για το μάθημα "Διαχείριση Δικτυακών και Υπολογιστικών Πόρων" του μεταπτυχιακού προγράμματος του Χαροκοπείου Πανεπιστημίου. Η εκφώνηση της εργασίας είναι διαθέσιμη [εδώ](https://docs.google.com/document/d/e/2PACX-1vRRQams_f-c24aZT5xKaGIckjJrgfBYl53xfTcBgdEVjr2EUA13dfKvmRZbYbqDAX7_8Vji2YLm1FHc/pub).

To project έχει την ακόλουθη δομή:
  * **disks**: περιέχει τα απαραίτητα αρχεία για να προετοιμαστούν κατάλληλα οι δίσκοι (*ready_disks.sh*) και να δημιουργηθεί το raid-5 (*raid_5.sh*) 
  * **οpenvpn**: περιέχει τα κάταλληκα config files ώστε το Headnode να τρέχει τον OpenVPN server και τα Nodes 1 και 2 να συνδέονται σαν clients
  * **scripts**: περιέχει τα scripts με τα οποία τα Nodes 1 και 2 παράγουν περιοδικά εγγραφές με τα CPU context switches και το Headnode υπολογίζει τον μέσο όρο τους
