module Mono


class Tool
  def self.main( args=ARGV )

   ## note: for now assume first argument is command
   ##  add options later

   cmd = if args.size == 0
           'status'   ## make status "default" command
         else
           args.shift   ## remove first (head) element
         end

   ## note: allow shortcut for commands
   case cmd.downcase
   when 'status', 'stati', 'stat', 'st', 's'
      Mono.status
   when 'sync', 'syn', 'sy',  ## note: allow aliases such as install, get & up too
        'get', 'g',
        'install', 'insta', 'inst', 'ins', 'i',
        'up', 'u'
      Mono.sync
   when 'fetch', 'f'
      Mono.fetch
   when 'env', 'e'
      Mono.env
   when 'backup', 'back', 'b'
      Mono.backup
   when 'run', 'r', 'exec'
      Mono.run( args )

   ##################
   ## for debugging / linting
   when 'walk'
      Mono.walk
   else
     puts "!! ERROR: unknown command >#{cmd}<"
     exit 1
   end

  end  # method self.main
end # class Tool

end # module Mono