module OnlineVoting
  module Crypto
    module Message
      def self.encrypt(message, key = nil, iv = nil)
        cipher = OpenSSL::Cipher::AES256.new :CBC
        cipher.encrypt
        random_iv = cipher.random_iv || iv
        random_key = SecureRandom.hex(16) || key
        cipher.key = random_key

        encrypted_text = cipher.update(message) + cipher.final
        [
          encrypted_text,
          random_key,
          random_iv,
        ]
      end

      def self.decrypt(base64encrypted, key, base64iv)
        encrypted = Base64.decode64(base64encrypted)
        iv = Base64.decode64(base64iv)
        decipher = OpenSSL::Cipher::AES256.new :CBC
        decipher.decrypt
        decipher.iv = iv
        decipher.key = key
        decipher.update(encrypted) + decipher.final
      end
    end
  end
end
