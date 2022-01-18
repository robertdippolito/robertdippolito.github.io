1. build the gatsby site (npm run build)
2. upload public folder to s3 
3. setup cloudfront 
    a) origin name -> s3 bucket name
    b) origin path -> public/
    c) yes use OAI
    d) access-identity-static-content
    e) yes, update the policy
    f) custom ssl certificate
    g) defaults
4. route53
    a) setup hosted zones in domain server (namecheap)
    b) setup cloudfront a record
        i) name: domain | alias: yes | detail: alias to cloudfront distro | cloudfront distro url
    c) setup cname record (from certificate)
5. certificate
    a) request certificate from domain provider 
    b) apply to cloudfront
    c) 'create records in route53'

