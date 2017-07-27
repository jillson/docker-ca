openssl genrsa 2048 > $1.key
echo -e "\n\n\n\n\n$1\n\n\n\n" | openssl req -new -key $1.key -out $1.csr
openssl x509 -req -days 365 -in $1.csr -CA ca.crt -CAkey ca.key -out $1.crt -extfile extfile.cnf
rm -f $1.csr
