// create the key pair
aws ec2 create-key-pair --key-name xfusion-kp --key-type rsa

// output for successful key pair creation
{
    "KeyPairId": "key-077f20e29589bbd75",
    "KeyName": "xfusion-kp",
    "KeyFingerprint": "ee:9a:16:54:0a:60:76:eb:b0:0d:62:ff:7e:7f:cb:c4:29:09:33:45",
    "KeyMaterial": "-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKCAQEAtdIMj3wegjpUso0Rj87oGMsdgGXuIZeJPFHCocG7tyHihECG\n42AiafrTNJITmkqz36mZ0xzWbjh3htTq/62dOB3P9oTC1/jlFn+LZ/WsfMfQc1Go\nzcRd87G6+ibhocpQLx+Xahdf/DBS1eYaHSiskI4RlK7N7hE60leIj99fgC9sOS2c\nNu+Ei22Y0FNS2cTj9zRbIHenyb+tzgQw73VgD5tHQ7KldCFbIJeVE65G1+8whtfr\nMKi6E/t3MYE3gFQRCG+Vauky7a/1nddT4ToJZDjh+nDM8/y6VHUpDsedIUN5y+Zr\nOPmPHdN3Cfbo621zTAoyTnx8xc9utbvDyuHqbwIDAQABAoIBABFsN1fohOPlwwf5\nDJ3DLepyTDlpixAc/UGSdBwb/GjoDlSt+j7/j0yohGSdOtOmJOZh0iOwt7uIHawF\n6x7k/BPMh4kP37viVdF6F1m26PhsDUV/pbVSA86+UTR3VVezk0tws4mvA7uexdFJ\nY2c35pFTi8u7lHAjpodRa/ydYwFdYIAKttJ/Q8lxuZo/94TjRJm2E/xJhGYUMnzg\n2v5jDHwR3C5271xgs79LhlebGVkBPV9Ax5YldWDwG7tCeRFPqmriIg10Q/nXwD60\nMs5DGHWOYf371KAyTu4WLy1MSpMJ3WjP/TaDErxL0MSQsViKxrCKKTLV8p4hH/GX\nLTteHUECgYEA6U61hBLKC3Awz4Weae/L5mssgVIWFcayK+cue9QAsqu9UjPxhTPp\n9KXW/mRhT9cvUUFUc92mIT6ePFC7j2BX7dW+Q85zU8kiORWh4GwZftQ68pJhnfex\ntUsbGPKFjug3CAHHzPFzXfxea7XEssHOYC+8uLlhkN1na4oGEauRndMCgYEAx4FU\nRJtBlsEBTym0gvfhxo6HyBl9QxvQLL3vJkzHZLPVJFW99Bcflr6dI3BNQImct8qk\nxvCk28CYZHu/77dFr/nDYUgQt8KRPRWPuSVQiEDLFGfSa3qK+UfB4QIHCLTKjRLy\n/9lJKFnvIX06H5w+5vMtceDMboN7++KyKBJ1c3UCgYA/f6GdobOF63INeTOFZ7Oa\nMf8570p9gMfLdS9MmoXaGy366pJIi7mYUW6zbESkA1AokFxY8LGfiLhueBakTjeA\nTtVrBQyUeECtQrr9Js7FmyO0E60n3ltqmVd1scQyAffAYSOtHuYkZWSZci5n7KGr\nwjJeIG5yjB/yv+0o8AZA6wKBgFN7queKkEelPAcETKUBVVjhC7CP+fq7CMGwOQKt\n3kIlfmtV9cbOZkmOOfM6axk2fH3sLkeRK2tJjHt/zTFiX6bjvP5YSaabpGsLOrkf\nBDP/6PsA9uxCuyTVAixFzOu3u4qNA2JManCYMZix7kCMAUZjPAELMICORLOCiUp7\nbuqBAoGBAISMm6yGg5lEZ3ZphiGisI5L6vDgisa3v5pesDfx1m+G6rAED5GdbftC\nQ0AuDM2HtQ8JQCrX1V5GHtEJ886Ph4hmu4EkzMNhkMhVEXC2/TYS8azbQwR3Sc+P\n+f4IFFs/6FVI7JNVzR8xqQ2TAh1whI/taVFFc8oj215j8gkpzWFp\n-----END RSA PRIVATE KEY-----"
}


// check if the key pair exists
aws ec2 describe-key-pairs 

// output for listing all key pairs
{
    "KeyPairs": [
        {
            "KeyPairId": "key-077f20e29589bbd75",
            "KeyType": "rsa",
            "Tags": [],
            "CreateTime": "2026-01-14T17:05:58.269Z",
            "KeyName": "xfusion-kp",
            "KeyFingerprint": "ee:9a:16:54:0a:60:76:eb:b0:0d:62:ff:7e:7f:cb:c4:29:09:33:45"
        }
    ]
}