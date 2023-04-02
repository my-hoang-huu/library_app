// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:core/core.dart';
// import 'package:core/error/failure.dart';
// import 'package:domain/domain.dart';
// import 'package:investment/config/global_manager.dart';

// import 'new_investment_event.dart';
// import 'new_investment_state.dart';

// enum StepType { personalInfo, pricing, eContract, signature }

// class NewInvestBloc extends Bloc<NewInvestEvent, NewInvestState> {
//   final GetNewInvestUserInfo _getNewInvestUserInfo;
//   final PostNewInvestUserInfo _updateNewInvestUserInfo;
//   final PostPriceCalculate _postPriceCalculate;
//   final PostFillEContract _postFillEContract;
//   final PostSignature _postSignature;

//   double _amountOfMoney = 0;
//   int _maxAvailableStep = 0;

//   NewInvestBloc(
//       {required GetNewInvestUserInfo getNewInvestUserInfo,
//       required PostFillEContract postFillEContract,
//       required PostPriceCalculate postPriceCalculate,
//       required PostSignature postSignature,
//       required PostNewInvestUserInfo updateNewInvestUserInfo})
//       : _getNewInvestUserInfo = getNewInvestUserInfo,
//         _updateNewInvestUserInfo = updateNewInvestUserInfo,
//         _postPriceCalculate = postPriceCalculate,
//         _postFillEContract = postFillEContract,
//         _postSignature = postSignature,
//         super(NewInvestLoadingState(type: StepType.personalInfo)) {
//     on<NewInvestInitStepEvent>(_initFirstStep);
//     on<NewInvestProfileUpdateEvent>(_profileUpdate);
//     on<NewInvestOnTapEvent>(_onStepTappedEvent);
//     on<NewInvestOnContinueEvent>(_onContinueEvent);
//     on<NewInvestCancelEvent>(_onCancelEvent);
//     on<NewInvestMoneyChangedEvent>(_onMoneyChanged);
//     on<NewInvestSignatureCompletedEvent>(_onSignatureCompleted);
//     on<NewInvestSignatureClearEvent>(_onClearSignature);
//     on<NewInvestSignatureSubmitEvent>(_onSubmitSignature);
//   }

//   Future<FutureOr<void>> _initFirstStep(
//       NewInvestInitStepEvent event, Emitter<NewInvestState> emit) async {
//     await _handleRequest<NewInvestUserInfo, GetNewInvestUserInfoParams, GetNewInvestUserInfo>(
//         emit: emit,
//         type: event.type,
//         useCase: _getNewInvestUserInfo,
//         params: GetNewInvestUserInfoParams());
//   }

//   Future<FutureOr<void>> _profileUpdate(
//       NewInvestProfileUpdateEvent event, Emitter<NewInvestState> emit) async {
//     final info = event.info;
//     await _handleRequest<NewInvestUserInfo, PostNewInvestUserInfoParams, PostNewInvestUserInfo>(
//         listenType: NewInvestListenType.dialog,
//         emit: emit,
//         type: event.type,
//         useCase: _updateNewInvestUserInfo,
//         params: PostNewInvestUserInfoParams(
//             address: info.address,
//             dateOfBirth: DateTime.tryParse(info.dateOfBirth) ?? DateTime.now(),
//             firstName: info.firstName,
//             lastName: info.lastName,
//             phone: info.phone));
//   }

//   Future<FutureOr<void>> _onMoneyChanged(
//       NewInvestMoneyChangedEvent event, Emitter<NewInvestState> emit) async {
//     await getPricingData(emit, event);
//   }

//   Future<FutureOr<void>> _initPricingStep(
//       {required StepType type, required Emitter<NewInvestState> emit}) async {
//     final event = NewInvestMoneyChangedEvent(money: _amountOfMoney);
//     await getPricingData(emit, event);
//   }

//   Future<void> getPricingData(
//       Emitter<NewInvestState> emit, NewInvestMoneyChangedEvent event) async {
//     return await _handleRequest<NewInvestPricing, PriceCalculateParams, PostPriceCalculate>(
//         emit: emit,
//         type: event.type,
//         useCase: _postPriceCalculate,
//         canContinue: event.money >= 25,
//         params: PriceCalculateParams(amountOfMoney: event.money));
//   }

//   Future<FutureOr<void>> _onLoadingEContract(Emitter<NewInvestState> emit) async {
//     await _handleRequest<NewInvestEContract, EContractParams, PostFillEContract>(
//         emit: emit,
//         type: StepType.eContract,
//         useCase: _postFillEContract,
//         canContinue: true,
//         params: EContractParams(amountOfMoney: _amountOfMoney));
//   }

//   Future<FutureOr<void>> _initSignEContractStep(Emitter<NewInvestState> emit) async {
//     _emitSignInitState(emit);
//   }

//   FutureOr<void> _onClearSignature(event, emit) => _emitSignInitState(emit);

//   FutureOr<void> _emitSignInitState(emit) {
//     emit(NewInvestLoadedState<InvestEmptyEntity>(
//         type: StepType.signature,
//         info: InvestEmptyEntity(),
//         needRebuild: true,
//         listenType: NewInvestListenType.none));
//   }

//   FutureOr<void> _onSignatureCompleted(
//       NewInvestSignatureCompletedEvent event, Emitter<NewInvestState> emit) {
//     emit(NewInvestLoadedState<NewInvestSignature>(
//         type: StepType.signature,
//         info: NewInvestSignature(event.signature),
//         needRebuild: true,
//         canContinue: event.signature.isNotEmpty,
//         listenType: NewInvestListenType.none));
//   }

//   Future<FutureOr<void>> _onSubmitSignature(
//       NewInvestSignatureSubmitEvent event, Emitter<NewInvestState> emit) async {
//     await _handleRequest<NewInvestResult, SignatureParams, PostSignature>(
//         emit: emit,
//         type: StepType.signature,
//         useCase: _postSignature,
//         successMessage: "Invest successfully",
//         listenType: NewInvestListenType.done,
//         params: SignatureParams(signature: event.signature, amountOfMoney: _amountOfMoney));
//   }

//   FutureOr<void> _onStepTappedEvent(NewInvestOnTapEvent event, Emitter<NewInvestState> emit) async {
//     await _jumpToStep(targetIndex: event.targetIndex, emit: emit);
//   }

//   FutureOr<void> _onCancelEvent(NewInvestCancelEvent event, Emitter<NewInvestState> emit) async {
//     await _jumpToStep(targetIndex: event.targetIndex, emit: emit);
//   }

//   FutureOr<void> _onContinueEvent(
//       NewInvestOnContinueEvent event, Emitter<NewInvestState> emit) async {
//     await _jumpToStep(targetIndex: event.targetIndex, emit: emit);
//   }

//   FutureOr<void> _jumpToStep(
//       {required int targetIndex, required Emitter<NewInvestState> emit}) async {
//     if (targetIndex > _maxAvailableStep) return;
//     switch (targetIndex) {
//       case 0:
//         return await _initFirstStep(NewInvestInitStepEvent(StepType.personalInfo), emit);
//       case 1:
//         return await _initPricingStep(type: StepType.pricing, emit: emit);
//       case 2:
//         return await _onLoadingEContract(emit);
//       case 3:
//         return await _initSignEContractStep(emit);
//     }
//   }

//   Future<void> _handleRequest<E extends InvestEntity, P extends InvestParamsAbstract,
//           U extends InvestUseCase<E, P>>(
//       {required Emitter<NewInvestState> emit,
//       NewInvestListenType listenType = NewInvestListenType.none,
//       bool needRebuild = true,
//       bool canContinue = false,
//       String? successMessage,
//       required StepType type,
//       required U useCase,
//       required P params}) async {
//     emit(NewInvestLoadingState(type: type));
//     try {
//       String? aToken = await appToken;
//       String? uToken = 'fake token';
//       final response = await useCase.call(params
//         ..appToken = aToken!
//         ..userToken = uToken);
//       await response.fold((l) {
//         if (l is ServerFailure) {
//           emit(NewInvestErrorState(errorMessage: l.message ?? "Có lỗi xảy ra", type: type));
//         }
//       }, (r) async {
//         if (type == StepType.eContract) await eContractDelay(type, emit, r, listenType);
//         updateBlocInfo(r, type);
//         emit(NewInvestLoadedState<E>(
//           type: type,
//           info: r,
//           listenType: listenType,
//           needRebuild: needRebuild,
//           successMessage: successMessage,
//           canContinue: canContinue,
//         ));
//       });
//     } catch (e) {
//       print('ERROR: ' + e.toString());
//       emit(NewInvestErrorState(errorMessage: e.toString(), type: type));
//     }
//   }

//   void updateBlocInfo(InvestEntity response, StepType type) {
//     if (response is NewInvestPricing) _amountOfMoney = response.money;
//     if (type == StepType.pricing && _amountOfMoney == 0) {
//       _maxAvailableStep = StepType.pricing.index;
//       return;
//     }
//     final nextIndex = type.index + 1;
//     _maxAvailableStep = _maxAvailableStep > nextIndex ? _maxAvailableStep : nextIndex;
//   }

//   Future<void> eContractDelay(
//       StepType type, Emitter<NewInvestState> emit, r, NewInvestListenType listenType) async {
//     emit(NewInvestLoadedState<NewInvestEContract>(
//       type: type,
//       info: r,
//       listenType: listenType,
//       needRebuild: true,
//       canContinue: false,
//     ));
//     await Future.delayed(const Duration(milliseconds: 400));
//     emit(NewInvestLoadingState(type: type));
//   }
// }
