package user

import (
	"fmt"

	"github.com/golang-jwt/jwt/v4"
)

const (
	Redis_Verification = "verification:"
)

func parseToken(tokenString string, secretKey []byte) (*jwt.RegisteredClaims, error) {
	parsedToken, err := jwt.ParseWithClaims(tokenString, &jwt.RegisteredClaims{}, func(token *jwt.Token) (interface{}, error) {
		// Ensure the token method conforms to "SigningMethodHMAC"
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
		}
		return secretKey, nil
	})
	if err != nil {
		return nil, err
	}

	// Validate the token and extract the claims
	if claims, ok := parsedToken.Claims.(*jwt.RegisteredClaims); ok && parsedToken.Valid {
		return claims, nil
	} else {
		return nil, fmt.Errorf("invalid token")
	}
}
