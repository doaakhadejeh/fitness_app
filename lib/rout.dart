import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/middleware/middlware.dart';
import 'package:fitnessapp/view/screen/admin/adminhome.dart';
import 'package:fitnessapp/view/screen/admin/categories/addcat.dart';
import 'package:fitnessapp/view/screen/admin/categories/categories.dart';
import 'package:fitnessapp/view/screen/admin/categories/editcat.dart';
import 'package:fitnessapp/view/screen/admin/exercies/addexercies.dart';
import 'package:fitnessapp/view/screen/admin/exercies/exercies.dart';
import 'package:fitnessapp/view/screen/admin/exercies/filterexercies.dart';
import 'package:fitnessapp/view/screen/admin/home.dart';
import 'package:fitnessapp/view/screen/admin/meal/addingredient.dart';
import 'package:fitnessapp/view/screen/admin/meal/addmeal.dart';
import 'package:fitnessapp/view/screen/admin/meal/editgredient.dart';
import 'package:fitnessapp/view/screen/admin/meal/editmael.dart';
import 'package:fitnessapp/view/screen/admin/meal/ingredient.dart';
import 'package:fitnessapp/view/screen/admin/meal/meal.dart';
import 'package:fitnessapp/view/screen/admin/mealplan/addmealplan.dart';
import 'package:fitnessapp/view/screen/admin/mealplan/detmealplan.dart';
import 'package:fitnessapp/view/screen/admin/mealplan/editmealplan.dart';
import 'package:fitnessapp/view/screen/admin/mealplan/mealplan.dart';
import 'package:fitnessapp/view/screen/admin/plan/adddayplan.dart';
import 'package:fitnessapp/view/screen/admin/plan/addexdayplan.dart';
import 'package:fitnessapp/view/screen/admin/plan/addplane.dart';
import 'package:fitnessapp/view/screen/admin/plan/editdayplan.dart';
import 'package:fitnessapp/view/screen/admin/plan/editexdayplan.dart';
import 'package:fitnessapp/view/screen/admin/plan/editplane.dart';
import 'package:fitnessapp/view/screen/admin/plan/exdayplan.dart';
import 'package:fitnessapp/view/screen/admin/plan/plane.dart';
import 'package:fitnessapp/view/screen/admin/plan/viewdayplan.dart';
import 'package:fitnessapp/view/screen/admin/screenadmin/addtrainer.dart';
import 'package:fitnessapp/view/screen/admin/screenadmin/trainermanag.dart';
import 'package:fitnessapp/view/screen/admin/screenadmin/usermang.dart';
import 'package:fitnessapp/view/screen/admin/screentrainer/usermang.dart';
import 'package:fitnessapp/view/screen/admin/setting.dart';
import 'package:fitnessapp/view/screen/admin/trainerhome.dart';
import 'package:fitnessapp/view/screen/auth/signup.dart';
import 'package:fitnessapp/view/screen/auth/forgetpass.dart';
import 'package:fitnessapp/view/screen/auth/login.dart';
import 'package:fitnessapp/view/screen/auth/resivepass.dart';
import 'package:fitnessapp/view/screen/auth/successresetpass.dart';
import 'package:fitnessapp/view/screen/auth/succseesign.dart';
import 'package:fitnessapp/view/screen/auth/veriffyemail.dart';
import 'package:fitnessapp/view/screen/onbording.dart';
import 'package:fitnessapp/view/screen/splash.dart';
import 'package:fitnessapp/view/screen/user/exercies/excat.dart';
import 'package:fitnessapp/view/screen/user/exercies/exercies.dart';
import 'package:fitnessapp/view/screen/user/helthuser/completehelth.dart';
import 'package:fitnessapp/view/screen/user/helthuser/createhelth.dart';
import 'package:fitnessapp/view/screen/user/helthuser/showhelth.dart';
import 'package:fitnessapp/view/screen/user/helthuser/updatehelth.dart';
import 'package:fitnessapp/view/screen/user/home/aboutas.dart';
import 'package:fitnessapp/view/screen/user/home/homescreen.dart';
import 'package:fitnessapp/view/screen/user/home/myprofile.dart';
import 'package:fitnessapp/view/screen/user/meal/mealingredient.dart';
import 'package:fitnessapp/view/screen/user/meal/nutrition.dart';
import 'package:fitnessapp/view/screen/user/plan/exgnplan.dart';
import 'package:fitnessapp/view/screen/user/plan/exrprivplan.dart';
import 'package:fitnessapp/view/screen/user/plan/generaldayplan.dart';
import 'package:fitnessapp/view/screen/user/plan/plan.dart';
import 'package:fitnessapp/view/screen/user/plan/privatdayplan.dart';
import 'package:fitnessapp/view/screen/user/plan/privplan.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> route = [
  GetPage(name: "/", page: () => const SplashScreen()),
  GetPage(
      name: Approut.red,
      page: () => const SizedBox(),
      middlewares: [Mymidlware()]),

  GetPage(name: Approut.login, page: () => const Login()),
  GetPage(
    name: Approut.onbording,
    page: () => const Onbording(),
  ),
  GetPage(name: Approut.signup, page: () => const SignUp()),
  GetPage(name: Approut.forgetpass, page: () => const Forgetpass()),
  GetPage(name: Approut.sucesspass, page: () => const Success()),
  GetPage(name: Approut.sucesssign, page: () => const Successsign()),
  GetPage(name: Approut.resivepass, page: () => const Resivepass()),
  GetPage(name: Approut.verifyemail, page: () => const Veryfiyemail()),
  GetPage(name: Approut.home, page: () => const Homescreen()),
  GetPage(name: Approut.nutrition, page: () => const Nutrition()),
  GetPage(name: Approut.mealin, page: () => const MealIngredientsPage()),

  GetPage(name: Approut.exrecies, page: () => const Exercises()),
  GetPage(name: Approut.showhelth, page: () => const Showhelth()),
  GetPage(name: Approut.updatehelth, page: () => const Updatehelth()),
  GetPage(name: Approut.completehelth, page: () => const Completehelth()),
  GetPage(name: Approut.createhelth, page: () => const Createhelth()),
  GetPage(name: Approut.aboutas, page: () => const AboutUsPage()),
  GetPage(name: Approut.geplan, page: () => const Plan()),
  GetPage(name: Approut.prvplan, page: () => const Privplan()),
  GetPage(name: Approut.expriplan, page: () => const Expriplan()),
  GetPage(name: Approut.exgnrplan, page: () => const Exgnrplan()),
  GetPage(name: Approut.daygnrplan, page: () => const Generaldayplan()),
  GetPage(name: Approut.dayriplan, page: () => const Privatdayplan()),
  GetPage(name: Approut.excat, page: () => const Exercat()),
  GetPage(name: Approut.profile, page: () => const Profile()),

//GetPage(name: , page:() => const ),

//admin rout
  //
  GetPage(name: Approut.homeadmin, page: () => const HomeA()),

  GetPage(name: Approut.adminHome, page: () => const AdminHome()),
  GetPage(name: Approut.trainerHome, page: () => const TrainerHome()),
  GetPage(name: Approut.setting, page: () => const Settingadmintr()),

  //adminscreen
  GetPage(name: Approut.usermanage, page: () => const Usermanag()),
  GetPage(name: Approut.trainermang, page: () => const Trainermanag()),
  GetPage(name: Approut.addtrainer, page: () => const Addtrainer()),

  //trainerscreen
  GetPage(name: Approut.usermanaget, page: () => const Usermanagt()),
  GetPage(name: Approut.categories, page: () => const TrainerCategoriesPage()),
  GetPage(name: Approut.addcat, page: () => const AddCategoryPage()),
  GetPage(name: Approut.editcat, page: () => const EditCategoryPage()),
  GetPage(name: Approut.exercies, page: () => const ExercisesPage()),
  GetPage(name: Approut.addexercies, page: () => const AddExercisePage()),
  GetPage(name: Approut.editexercies, page: () => const FilterExercisesPage()),
  GetPage(name: Approut.plane, page: () => const PlansPage()),
  GetPage(name: Approut.addplane, page: () => const AddPlan()),
  GetPage(name: Approut.editplane, page: () => const EditPlan()),

  GetPage(name: Approut.adddayplan, page: () => const Adddayplan()),
  GetPage(name: Approut.addexdayplan, page: () => const AddExDayPlan()),
  GetPage(name: Approut.editdayplan, page: () => const Editdayplan()),
  GetPage(name: Approut.editexdayplan, page: () => const EditExDayPlan()),
  GetPage(name: Approut.exdayplan, page: () => const DayExPlanView()),
  GetPage(name: Approut.dayplan, page: () => const Viewdayplan()),

  GetPage(name: Approut.meal, page: () => const Meal()),
  GetPage(name: Approut.addmeal, page: () => const AddMealPage()),
  GetPage(name: Approut.editmeal, page: () => const EditMealPage()),
  GetPage(name: Approut.mealing, page: () => const MealIngredientsAdminPage()),
  GetPage(name: Approut.addmealing, page: () => const AddMealIngredientPage()),
  GetPage(
      name: Approut.editmealing, page: () => const EditMealIngredientPage()),

  GetPage(name: Approut.editmealplan, page: () => const EditMealPlanPage()),
  GetPage(name: Approut.mealplan, page: () => const Mealplanadmin()),
  GetPage(name: Approut.addmealplan, page: () => const AddMealPlanPage()),
  GetPage(name: Approut.detmealplan, page: () => const MealPlanDetailsPage()),
];
