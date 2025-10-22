class Applink {
  static const String server = "http://192.168.43.190:8000/api";
  // static const String server = "http://192.168.188.190:8000/api";

  // ------------------ Auth ------------------
  static const String login = "$server/login";
  static const String signin = "$server/register";
  static const String forgetpass = "$server/send-password-reset-code";
  static const String resetpass = "$server/reset-password";
  static const String verifyemail = "$server/verify-code";
  static const String resendverifyemail = "$server/send-verify-code";

  // -------------profile---------------
  static const String changepassword = "$server/user/change-password";
  static const String updateprogile = "$server/user/update-profile";

  // ------------------ Health Profile ------------------
  static const String progress = "$server/my-progress";
  static const String createhelth = "$server/";
  static const String showhelth = "$server/";
  static const String updatehelth = "$server/";
  static const String completehelth = "$server/complete";

  // 🔍 عرض وتعديل الملف الصحي لمستخدم معيّن
  static String showHealthById(userId) => "$server/user/$userId";
  static String updateHealthByAdmin(userId) => "$server/$userId";
  static String deleteHealthProfile(userId) => "$server/$userId";
  static const String healthComparison = "$server/comparison";

  // ------------------ Exercises ------------------
  static const String category = "$server/exercise-categories/";
  static const String exercise = "$server/exercises/";
  static const String filterexercises = "$server/exercises/filter/filter";
  static const String search = "$server/exercises/search-by-category";

  // --------- التمارين (CRUD) ---------
  static const String exercises = "$server/exercises";
  static const String addExercise = "$server/exercises";
  static const String filterExercises = "$server/exercises/filter/filter";
  static String showExercise(id) => "$server/exercises/$id";
  static String deleteExercise(id) => "$server/exercises/$id";
  static String editExercise(id) => "$server/exercises/$id";

  // ------------------ Plans (عام وخاص) ------------------
  static const String generalplan = "$server/general-plan";
  static const String generalplanexercises = "$server/general-plan/exercises";

  static String privPlan(userId) => "$server/users/$userId/assigned-plans";
  static String dayPlan(planId) => "$server/exercise-plans/$planId/days";
  static String exPlan(dayId) => "$server/exercise-plan-days/$dayId/exercises";

  static const String plans = "$server/exercise-plans";
  static const String addPlan = "$server/exercise-plans";
  static const String editPlan = "$server/exercise-plans";

  static String showPlan(id) => "$server/exercise-plans/$id";
  static String deletePlan(id) => "$server/exercise-plans/$id";

  // ------------------ Day Plan ------------------
  static String getdayplan(planId) => "$server/exercise-plans/$planId/days";
  static String adddayplan(planId) => "$server/exercise-plans/$planId/days";
  static String editdayplan(dayId) => "$server/exercise-plan-days/$dayId";
  static String deletedayplan(dayId) => "$server/exercise-plan-days/$dayId";

  // ------------------ Exercises in Day Plan ------------------
  static String getexdayplan(dayId) =>
      "$server/exercise-plan-days/$dayId/exercises";
  static String addexdayplan(planId, dayId) =>
      "$server/exercise-plans/$planId/days/$dayId/exercises";
  static String editexdayplan(planId, dayId, exerciseId) =>
      "$server/exercise-plans/$planId/days/$dayId/exercises/$exerciseId";
  static String deleteexdayplan(planId, dayId, exerciseId) =>
      "$server/exercise-plans/$planId/days/$dayId/exercises/$exerciseId";

  // ------------------ الفئات ------------------
  static const String categories = "$server/exercise-categories";
  static const String addCategory = "$server/exercise-categories";
  static const String editCategory = "$server/exercise-categories";
  static String showCategory(id) => "$server/exercise-categories/$id";
  static String deleteCategory(id) => "$server/exercise-categories/$id";

  // ------------------ المتدربين ------------------
  static const String listtraineruser = "$server/trainer/users";
  static const String addTraineuser = "$server/trainer/users/add";
  static String deleteTruser(id) => "$server/trainer/users/$id";

  // ------------------ المدرّبين ------------------
  static const String listTrainers = "$server/trainers";
  static const String addTrainer = "$server/register-trainer";
  static const String addadmin = "$server/register-superadmin";
  static String deleteadminTrainer(id) => "$server/trainers/$id";

  // ------------------ المستخدمين ------------------
  static const String listadminUsers = "$server/users";
  static String deleteadminUser(id) => "$server/users/$id";
  static String blockUser(id) => "$server/users/$id/block";
  static String unblockUser(id) => "$server/users/$id/unblock";

  // ------------------ Meal ------------------
  static const String meal = "$server/meals";
  static const String gnmealplan = "$server/meal-plans/general";

  static const String addmeal = "$server/meals";
  static String editmeal(id) => "$server/meals/$id";
  static String deletemeal(id) => "$server/meals/$id";

  static String addmealgr(mealId) => "$server/meals/$mealId/ingredients";
  static String getmealgr(mealId) => "$server/meals/$mealId/ingredients";
  static String editmealgr(mealId, ingredientId) =>
      "$server/meals/$mealId/ingredients/$ingredientId";
  static String deletemealgr(mealId, ingredientId) =>
      "$server/meals/$mealId/ingredients/$ingredientId";

  // ------------------ Meal Plan ------------------
  static const String mealplan = "$server/meal-plans";
  static const String mymealplan = "$server/my-meal-plan";
  static const String addmealplan = "$server/meal-plans";
  static String editmealplan(id) => "$server/meal-plans/$id";
  static String deletemealplan(id) => "$server/meal-plans/$id";
  static String gedettmealplan(id) => "$server/meal-plans/$id";

  // ------------------ Assign Plans to User ------------------
  static String assignplantouser(userId) => "$server/users/$userId/assign-plan";
  static String showassignplantouser(userId) =>
      "$server/users/$userId/assigned-plans";
  static String updateassignplantouser(assignmentId) =>
      "$server/assignments/$assignmentId";
  static String deleteassignplantouser(assignmentId) =>
      "$server/assignments/$assignmentId";

  // ------------------ Assign Meal Plans to User ------------------
  static String assignmealplantouser(userId) =>
      "$server/users/$userId/assign-meal-plan";
  static String showassignmealplantouser(userId) =>
      "$server/users/$userId/meal-plans";
  static String updateassignmealplantouser(assignmentId) =>
      "$server/meal-plan-assignments/$assignmentId";
  static String deleteassignmealplantouser(assignmentId) =>
      "$server/meal-plan-assignments/$assignmentId";

  // --------------chat----------------
  static const String chatrooms = "$server/chat/rooms";
  static String chatmessages(chatRoomId) =>
      "$server/chat/rooms/$chatRoomId/messages";
  static String chatsend(chatRoomId) => "$server/chat/rooms/$chatRoomId/send";
  static String chatseen(messageId) => "$server/chat/messages/$messageId/seen";
  static String chatdelete(messageId) => "$server/chat/messages/$messageId";
  static const String chatcreateroom = "$server/chat/rooms/create";
  static String chataddusers(chatRoomId) =>
      "$server/chat/rooms/$chatRoomId/add-users";
  static String chatupdateroom(chatRoomId) => "$server/chat/rooms/$chatRoomId";
  static String viewuserchat = "$server/allusers";
  static String getuserinchat(chatRoom) => "$server/chat-rooms/$chatRoom/users";
}
