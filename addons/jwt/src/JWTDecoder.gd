extends Reference
class_name JWTDecoder

var parts: Array = []
var header_claims: Dictionary = {}
var payload_claims: Dictionary = {}

func _init(jwt: String):
    self.parts = jwt.split(".")
    var header: String = JWTUtils.base64URL_decode(self.parts[0])
    var payload: String = JWTUtils.base64URL_decode(self.parts[1])
    self.header_claims = JSON.parse(header).result
    self.payload_claims = JSON.parse(payload).result


func get_algorithm() -> String:
    return self.header_claims.get(JWTClaims.Public.ALGORITHM, "null")

func get_type() -> String:
    return self.header_claims.get(JWTClaims.Public.TYPE, "null")

func get_content_type() -> String:
    return self.header_claims.get(JWTClaims.Public.CONTENT_TYPE, "null")

func get_key_id() -> String:
    return self.header_claims.get(JWTClaims.Public.KEY_ID, "null")

func get_header_claim(name: String):
    return self.header_claims.get(name, null)

func get_header_claims() -> Dictionary:
    return self.header_claims

func get_issuer() -> String:
    return self.payload_claims.get(JWTClaims.Public.ISSUER, "null")

func get_subject() -> String:
    return self.payload_claims.get(JWTClaims.Public.SUBJECT, "null")

func get_audience() -> PoolStringArray:
    return self.payload_claims.get(JWTClaims.Public.AUDIENCE, "null")

func get_expires_at() -> int:
    return self.payload_claims.get(JWTClaims.Public.EXPRIES_AT, -1)

func get_not_before() -> int:
    return self.payload_claims.get(JWTClaims.Public.NOT_BEFORE, -1)

func get_issued_at() -> int:
    return self.payload_claims.get(JWTClaims.Public.ISSUED_AT, -1)

func get_id() -> String:
    return self.payload_claims.get(JWTClaims.Public.JWT_ID, "null")

func get_claim(name: String):
    return self.payload_claims.get(name, "null")

func get_claims() -> Dictionary:
    return self.payload_claims

func get_header() -> String:
    return self.parts[0]

func get_payload() -> String:
    return self.parts[1]

func get_signature() -> String:
    return self.parts[2]

func get_token() -> String:
    return ("%s.%s.%s" % parts)
