import 'package:flutter_bloc/flutter_bloc.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

// create object from NewsCubit
  static NewsCubit get(context) => BlocProvider.of(context);
}
