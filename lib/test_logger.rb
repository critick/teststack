## To make your application log events or diagnostic data to a file or stream.

## Note
## A production application usually has a log level of Logger::INFO or Logger::WARN.
## The DEBUG log level is useful for step-by-step diagnostics of a complex task
## The ERROR level is often used when handling exceptions
## The FATAL level is used only when the program cannot recover or about to crash.

 
require 'logger'
$LOG = Logger.new($stderr)

## OR
## # Keep data for today and the past 1 day.
## # $LOG = Logger.new('application.log', 1, 'daily')


## Example

def log_example (message)
  $LOG.debug(message)
  $LOG.error "Error: #{message}"
end
