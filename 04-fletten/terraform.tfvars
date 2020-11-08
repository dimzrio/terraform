iam_network_user = [
    {
        subnetwork  = [ 
            "ktbs-k8s-asia-se1-stg-subnet-1", 
            "ktbs-k8s-asia-se2-stg-subnet-1" 
        ]
         
        iam_member  = [
            "serviceAccount:1059493987516@cloudservices.gserviceaccount.com",
            "serviceAccount:service-1059493987516@container-engine-robot.iam.gserviceaccount.com",
            "user:shineofbara@gmail.com"
        ]
    },
]