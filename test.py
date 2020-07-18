skf = StratifiedKFold(n_splits = 5, random_state = 50, shuffle = True)
splits = skf.split(X, y)
parameters = {'max_depth': [3, 5, 6],
              'eta': [0.01, 0.5, 0.1],
              'n_estimators': [50, 100, 200, 500],
              'reg_alpha': [0.5, 1, 10],
              'objective': ['binary:logistic'],
              # 'early_stopping_rounds': [10],
              'random_state': [42]}
parameter_names = parameters.keys()
all_combinations = itertools.product(*parameters.values())
results = {}
for combination in all_combinations:
    params = dict(zip(parameter_names, combination))
    print(params)
    param_results = []
    for train_index, test_index in skf.split(X, y):
        model = XGBClassifier(**params)
        X_train, X_test = X.iloc[train_index].to_numpy(), X.iloc[test_index].to_numpy()
        y_train, y_test = y.iloc[train_index].to_numpy().ravel(), y.iloc[test_index].to_numpy().ravel()
        fitted_model = model.fit(X_train, y_train, 
                                 eval_set=[(X_test, y_test)],
                                 eval_metric='auc',
                                 verbose=False)
        param_results.append(fitted_model.evals_result()["validation_0"]["auc"][-1])
    print(param_results)
    results[combination] = mean(param_results)
print(results)
best_combination = max(results, key=results.get)
print("Best Results:")
print(best_combination, max(results.values()))

best_params = dict(zip(parameter_names, best_combination))
final_model = XGBClassifier(**best_params)
final_fitted_model = final_model.fit(X.to_numpy(), y.to_numpy().ravel())
sorted_feature_importances = list(zip(feature_names, final_fitted_model.feature_importances_))
sorted_feature_importances.sort(key = lambda x: -x[1])
print("Feature importances:")
print("\n".join([str(x) for x in sorted_feature_importances]))
