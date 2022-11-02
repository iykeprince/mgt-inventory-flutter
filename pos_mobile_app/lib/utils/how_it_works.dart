import '../models/how_it_work.model.dart';

List<HowItWork> MERCHANT_HOW_IT_WORKS = [
  HowItWork(
    title: 'Register a merchant account',
    content:
        'Your manager/admin will have to create a merchant account under your business account with your email address, where you will be sent a confirmation email. \n\n\nRegister a merchant account with the registered email address, and verify it with the provided OTP code to complete your account registration.',
  ),
  HowItWork(
    title: 'Complete your profile',
    content:
        'Create a password for your account, confirm your name and username in order to gain full control over your account.',
  ),
  HowItWork(
    title: 'Begin logging transactions',
    content:
        'Kick the gear and begin the usage of your account by updating the opening cash, POS, and bank account balances for the day, for an automated calculation of incoming and outgoing transactions.',
  ),
  HowItWork(
    title: 'Manage logged transactions',
    content: 'Add, view, edit, and delete transactions.',
  ),
  HowItWork(
    title: 'Close for the day!',
    content:
        'Enter the closing balances for the day, such as cash at hand, balance at bank and POS; and voila! All transactions are saved and a fresh interface is ready for a new day!',
  ),
];

List<HowItWork> ADMIN_HOW_IT_WORKS = [
  HowItWork(
    title: 'Create an admin account',
    content:
        'Start by creating your account with your personal email or business email (if available). An OTP code will be sent to the registered email for verification. \n\nYou can then proceed to entering your business details like Business Name, Number of Branches, and account password.',
  ),
  HowItWork(
    title: 'Add details for each branch',
    content:
        'Enter the details for each of your branch. Required details include name of branch, location, number of merchants in the branch, name of POS accounts and bank account details used in the branch.',
  ),
  HowItWork(
    title: 'Add merchant details',
    content:
        'After branch details have been added, you can proceed to registering the merchants managing each branch. Required information includes merchant name and email address.\n\nEach registered merchant is sent an email to inform them that they have been registered under a branch in your business. Your merchant can only complete their registration with the email address you’ve registered them with.',
  ),
  HowItWork(
    title: 'Relax, manage and oversee transactions!',
    content:
        'Once your merchant accounts are fully registered, and they begin logging transactions into the app, you can supervise the transactions by switching between branches, POS accounts, and bank accounts.\n\nYou can also download reports, and even create new merchant accounts and branches.',
  ),
  HowItWork(
    title: 'Enjoy!!!',
    content: '',
  ),
];
