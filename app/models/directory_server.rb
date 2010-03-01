require 'net/ldap'

class DirectoryServer

  attr_accessor :base, :bind_dn, :host, :port, :password, :default_filter, :single_scope

  def initialize(params)
    @base     = params[:base]
    @bind_dn  = params[:bind_dn]
    @host     = params[:host].nil? ? 'localhost' : params[:host]
    @port     = params[:port]
    @password = params[:password]

    @default_filter = Net::LDAP::Filter.eq( "objectclass", "*" )
    @single_scope   = Net::LDAP::SearchScope_SingleLevel 
  end

  def authenticate
    begin
      ldap = Net::LDAP.new(:host => self.host, :port => self.port)
      ldap.auth(self.bind_dn, self.password)
      return ldap
    rescue Exception => e
      logger.warn "#{e.backtrace}"
      return false
    end
  end

  def get_tree
    if ldap = self.authenticate
      ldap.search(:base => "", :filter => self.default_filter, :attributes => '*', :return_result => true, :scope => self.single_scope)
    end
  end

  def get_sub_entries(base_dn)
    if ldap = self.authenticate
      ldap.search(:base => base_dn, :filter => self.default_filter, :attributes => '*', :return_result => true, :scope => self.single_scope)
    end
  end

end
