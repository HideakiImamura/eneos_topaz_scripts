myrun:
	kubectl --context=mnj apply -f my_pod.yaml
.PHONY: myrun

run:
	kubectl apply --context=mnj -f pod.yaml
.PHONY: run


delete:
	kubectl --context=mnj delete pod topaz-optuna-policy
.PHONY: delete

scp:
	scp topaz/src/topaz/planning/policies/optuna_policy.py mamu@jm00z0cm07.mnj.pfn.io:~/eneos_topaz/topaz/src/topaz/planning/policies/optuna_policy.py
.PHONY: scp

scp-config:
	scp topaz/config.yaml mamu@jm00z0cm07.mnj.pfn.io:~/eneos_topaz/topaz/config.yaml
.PHONY: scp-config

scp-r:
	scp -r topaz mamu@jm00z0cm07.mnj.pfn.io:~/eneos_topaz/
.PHONY: scp-r

scp-res:
	rm -rf ./result_cmaes && scp -r mamu@jm00z0cm07.mnj.pfn.io:~/eneos_topaz/topaz/optuna-policy ./result_cmaes
.PHONY: scp-res

watch:
	watch -n 5 "kubectl get all -o wide"
.PHONY: watch
