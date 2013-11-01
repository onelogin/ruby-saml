module OneLogin
  module RubySaml
    class PermissiveAssertionIdValidator
      def valid?(id)
        true
      end
    end

    class PermissiveTimeRangeValidator
      def valid?(begin_time, end_time)
        true
      end
    end

    class PermissiveRecipientValidator
      def valid?(recipient_url, assertion_consumer_url)
        true
      end
    end

    class PermissiveDestinationValidator
      def valid?(destination_url, assertion_consumer_url)
        true
      end
    end

    class Settings
      def initialize(overrides = {})
        config = DEFAULTS.merge(overrides)
        config.each do |k,v|
          acc = "#{k.to_s}=".to_sym
          self.send(acc, v) if self.respond_to? acc
        end
      end
      attr_accessor :assertion_consumer_service_url, :issuer, :sp_name_qualifier
      attr_accessor :idp_sso_target_url, :idp_cert_fingerprint, :idp_cert, :name_identifier_format
      attr_accessor :authn_context
      attr_accessor :idp_slo_target_url
      attr_accessor :name_identifier_value
      attr_accessor :sessionindex
      attr_accessor :assertion_consumer_logout_service_url
      attr_accessor :compress_request
      attr_accessor :double_quote_xml_attribute_values
      attr_accessor :passive
      attr_accessor :protocol_binding
      attr_accessor :assertion_id_validator
      attr_accessor :time_range_validator
      attr_accessor :passive
      attr_accessor :destination_validator
      attr_accessor :recipient_validator
      
      private

      DEFAULTS = {
        :compress_request                  => true,
        :double_quote_xml_attribute_values => false,
        :assertion_id_validator            => PermissiveAssertionIdValidator.new,
        :time_range_validator              => PermissiveTimeRangeValidator.new,
        :recipient_validator               => PermissiveRecipientValidator.new,
        :destination_validator             => PermissiveDestinationValidator.new
      }
    end
  end
end
