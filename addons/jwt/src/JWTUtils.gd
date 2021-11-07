extends Reference
class_name JWTUtils

static func base64_encode(input: PoolByteArray) -> String:
    return Marshalls.raw_to_base64(input).replacen("+","-").replacen("/","_").replacen("=","")

static func base64URL_encode(input: PoolByteArray) -> String:
    return base64_encode(input)

static func base64URL_decode(input: String) -> String:
    match (input.length() % 4):
        2: input += "=="
        3: input += "="
    return Marshalls.base64_to_utf8(input.replacen("_","/").replacen("-","+"))
