iam_network_user = [
    {
        subnetwork  = [ 
            "ktbs-k8s-asia-se1-stg-subnet-1", 
            "ktbs-k8s-asia-se2-stg-subnet-1" 
        ]
         
        iam_member  = [
            "serviceAccount:13327c807a89@cloudservices.gserviceaccount.com",
            "serviceAccount:service-13327c807a89@container-engine-robot.iam.gserviceaccount.com",
            "user:shineofbara@gmail.com"
        ]
    },
]