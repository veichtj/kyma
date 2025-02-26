module github.com/kyma-project/kyma/tests/function-controller

go 1.15

require (
	github.com/avast/retry-go v2.6.0+incompatible
	github.com/go-git/go-billy/v5 v5.0.0
	github.com/go-git/go-git/v5 v5.2.0
	github.com/go-logr/zapr v0.1.1 // indirect
	github.com/hashicorp/errwrap v1.0.0
	github.com/hashicorp/go-multierror v1.1.0
	github.com/kyma-project/kyma/components/eventing-controller v0.0.0-20210315102435-c682d6366c7d
	github.com/kyma-project/kyma/components/function-controller v0.0.0-20210708083136-5479837a0948
	github.com/onsi/gomega v1.17.0
	github.com/pkg/errors v0.9.1
	github.com/sirupsen/logrus v1.8.1
	github.com/spf13/pflag v1.0.5
	github.com/vrischmann/envconfig v1.3.0
	golang.org/x/sync v0.0.0-20201207232520-09787c993a3a
	k8s.io/api v0.19.3
	k8s.io/apimachinery v0.19.3
	k8s.io/client-go v11.0.1-0.20190805182717-6502b5e7b1b5+incompatible
	sigs.k8s.io/controller-runtime v0.6.5
)

replace (
	github.com/googleapis/gnostic => github.com/googleapis/gnostic v0.3.1
	go.etcd.io/etcd => go.etcd.io/etcd v3.3.25+incompatible
	golang.org/x/crypto => golang.org/x/crypto v0.0.0-20200820211705-5c72a883971a
	golang.org/x/text => golang.org/x/text v0.3.3
	k8s.io/api => k8s.io/api v0.18.12
	k8s.io/apimachinery => k8s.io/apimachinery v0.18.12
	k8s.io/client-go => k8s.io/client-go v0.18.12
	k8s.io/kube-openapi => k8s.io/kube-openapi v0.0.0-20200410145947-bcb3869e6f29
)
