# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `ruby-progressbar` gem.
# Please instead update this file by running `bin/tapioca gem ruby-progressbar`.

# typed: true

class ProgressBar
  class << self
    def create(*args); end
  end
end

class ProgressBar::Base
  extend ::Forwardable

  def initialize(options = T.unsafe(nil)); end

  def clear(*args, &block); end
  def decrement; end
  def finish; end
  def finished?; end
  def format(other); end
  def format=(other); end
  def increment; end
  def inspect; end
  def log(*args, &block); end
  def pause; end
  def paused?; end
  def progress(*args, &block); end
  def progress=(new_progress); end
  def progress_mark=(mark); end
  def refresh(*args, &block); end
  def remainder_mark=(mark); end
  def reset; end
  def resume; end
  def start(options = T.unsafe(nil)); end
  def started?; end
  def stop; end
  def stopped?; end
  def title; end
  def title=(title); end
  def to_h; end
  def to_s(new_format = T.unsafe(nil)); end
  def total(*args, &block); end
  def total=(new_total); end

  protected

  # Returns the value of attribute autofinish.
  def autofinish; end

  # Sets the attribute autofinish
  def autofinish=(_arg0); end

  # Returns the value of attribute autostart.
  def autostart; end

  # Sets the attribute autostart
  def autostart=(_arg0); end

  # Returns the value of attribute bar.
  def bar; end

  # Sets the attribute bar
  def bar=(_arg0); end

  # Returns the value of attribute finished.
  def finished; end

  # Sets the attribute finished
  def finished=(_arg0); end

  # Returns the value of attribute output.
  def output; end

  # Sets the attribute output
  def output=(_arg0); end

  # Returns the value of attribute percentage.
  def percentage; end

  # Sets the attribute percentage
  def percentage=(_arg0); end

  # Returns the value of attribute progressable.
  def progressable; end

  # Sets the attribute progressable
  def progressable=(_arg0); end

  # Returns the value of attribute rate.
  def rate; end

  # Sets the attribute rate
  def rate=(_arg0); end

  # Returns the value of attribute time.
  def time; end

  # Sets the attribute time
  def time=(_arg0); end

  # Returns the value of attribute timer.
  def timer; end

  # Sets the attribute timer
  def timer=(_arg0); end

  # Returns the value of attribute title_comp.
  def title_comp; end

  # Sets the attribute title_comp
  def title_comp=(_arg0); end

  def update_progress(*args); end
end

module ProgressBar::Calculators; end

class ProgressBar::Calculators::Length
  def initialize(options = T.unsafe(nil)); end

  def calculate_length; end

  # Returns the value of attribute current_length.
  def current_length; end

  # Sets the attribute current_length
  def current_length=(_arg0); end

  def length; end
  def length_changed?; end

  # Returns the value of attribute length_override.
  def length_override; end

  def length_override=(other); end

  # Returns the value of attribute output.
  def output; end

  # Sets the attribute output
  def output=(_arg0); end

  def reset_length; end

  private

  def dynamic_width; end
  def dynamic_width_stty; end
  def dynamic_width_tput; end
  def dynamic_width_via_io_object; end
  def dynamic_width_via_output_stream_object; end
  def dynamic_width_via_system_calls; end
  def terminal_width; end
  def unix?; end
end

class ProgressBar::Calculators::RunningAverage
  class << self
    def calculate(current_average, new_value_to_average, smoothing_factor); end
  end
end

module ProgressBar::Components; end

class ProgressBar::Components::Bar
  def initialize(options = T.unsafe(nil)); end

  # Returns the value of attribute length.
  def length; end

  # Sets the attribute length
  def length=(_arg0); end

  # Returns the value of attribute progress.
  def progress; end

  # Sets the attribute progress
  def progress=(_arg0); end

  # Returns the value of attribute progress_mark.
  def progress_mark; end

  # Sets the attribute progress_mark
  def progress_mark=(_arg0); end

  # Returns the value of attribute remainder_mark.
  def remainder_mark; end

  # Sets the attribute remainder_mark
  def remainder_mark=(_arg0); end

  def to_s(options = T.unsafe(nil)); end

  # Returns the value of attribute upa_steps.
  def upa_steps; end

  # Sets the attribute upa_steps
  def upa_steps=(_arg0); end

  private

  def bar(length); end
  def bar_with_percentage(length); end
  def complete_bar(length); end
  def complete_bar_with_percentage(length); end
  def completed_length; end
  def incomplete_space(length); end
  def incomplete_string; end
  def integrated_percentage_complete_string; end
  def standard_complete_string; end
  def unknown_progress_frame; end
  def unknown_string; end
end

ProgressBar::Components::Bar::DEFAULT_PROGRESS_MARK = T.let(T.unsafe(nil), String)
ProgressBar::Components::Bar::DEFAULT_REMAINDER_MARK = T.let(T.unsafe(nil), String)
ProgressBar::Components::Bar::DEFAULT_UPA_STEPS = T.let(T.unsafe(nil), Array)

class ProgressBar::Components::Percentage
  def initialize(options = T.unsafe(nil)); end

  # Returns the value of attribute progress.
  def progress; end

  # Sets the attribute progress
  def progress=(_arg0); end

  private

  def justified_percentage; end
  def justified_percentage_with_precision; end
  def percentage; end
  def percentage_with_precision; end
end

class ProgressBar::Components::Rate
  def initialize(options = T.unsafe(nil)); end

  # Returns the value of attribute progress.
  def progress; end

  # Sets the attribute progress
  def progress=(_arg0); end

  # Returns the value of attribute rate_scale.
  def rate_scale; end

  # Sets the attribute rate_scale
  def rate_scale=(_arg0); end

  # Returns the value of attribute started_at.
  def started_at; end

  # Sets the attribute started_at
  def started_at=(_arg0); end

  # Returns the value of attribute stopped_at.
  def stopped_at; end

  # Sets the attribute stopped_at
  def stopped_at=(_arg0); end

  # Returns the value of attribute timer.
  def timer; end

  # Sets the attribute timer
  def timer=(_arg0); end

  private

  def base_rate; end
  def elapsed_seconds; end
  def rate_of_change(format_string = T.unsafe(nil)); end
  def rate_of_change_with_precision; end
  def scaled_rate; end
end

class ProgressBar::Components::Time
  def initialize(options = T.unsafe(nil)); end

  def elapsed_with_label; end
  def estimated_with_label; end

  protected

  def estimated_with_friendly_oob; end
  def estimated_with_no_oob; end
  def estimated_with_unknown_oob; end

  # Returns the value of attribute out_of_bounds_time_format.
  def out_of_bounds_time_format; end

  def out_of_bounds_time_format=(format); end

  # Returns the value of attribute progress.
  def progress; end

  # Sets the attribute progress
  def progress=(_arg0); end

  # Returns the value of attribute timer.
  def timer; end

  # Sets the attribute timer
  def timer=(_arg0); end

  private

  def elapsed; end
  def estimated; end
  def estimated_seconds_remaining; end
  def estimated_with_elapsed_fallback; end
end

ProgressBar::Components::Time::ELAPSED_LABEL = T.let(T.unsafe(nil), String)
ProgressBar::Components::Time::ESTIMATED_LABEL = T.let(T.unsafe(nil), String)
ProgressBar::Components::Time::NO_TIME_ELAPSED_TEXT = T.let(T.unsafe(nil), String)
ProgressBar::Components::Time::OOB_FRIENDLY_TIME_TEXT = T.let(T.unsafe(nil), String)
ProgressBar::Components::Time::OOB_LIMIT_IN_HOURS = T.let(T.unsafe(nil), Integer)
ProgressBar::Components::Time::OOB_TEXT_TO_FORMAT = T.let(T.unsafe(nil), Hash)
ProgressBar::Components::Time::OOB_TIME_FORMATS = T.let(T.unsafe(nil), Array)
ProgressBar::Components::Time::OOB_UNKNOWN_TIME_TEXT = T.let(T.unsafe(nil), String)
ProgressBar::Components::Time::TIME_FORMAT = T.let(T.unsafe(nil), String)

class ProgressBar::Components::Title
  def initialize(options = T.unsafe(nil)); end

  # Returns the value of attribute title.
  def title; end

  # Sets the attribute title
  def title=(_arg0); end
end

ProgressBar::Components::Title::DEFAULT_TITLE = T.let(T.unsafe(nil), String)
module ProgressBar::Format; end

class ProgressBar::Format::Formatter
  class << self
    def process(format_string, max_length, bar); end
  end
end

class ProgressBar::Format::Molecule
  def initialize(letter); end

  def bar_molecule?; end
  def full_key; end

  # Returns the value of attribute key.
  def key; end

  # Sets the attribute key
  def key=(_arg0); end

  def lookup_value(environment, length = T.unsafe(nil)); end

  # Returns the value of attribute method_name.
  def method_name; end

  # Sets the attribute method_name
  def method_name=(_arg0); end

  def non_bar_molecule?; end
end

ProgressBar::Format::Molecule::BAR_MOLECULES = T.let(T.unsafe(nil), Array)
ProgressBar::Format::Molecule::MOLECULES = T.let(T.unsafe(nil), Hash)

class ProgressBar::Format::String < ::String
  def bar_molecule_placeholder_length; end
  def bar_molecules; end
  def displayable_length; end
  def molecules; end
  def non_bar_molecules; end
end

ProgressBar::Format::String::ANSI_SGR_PATTERN = T.let(T.unsafe(nil), Regexp)
ProgressBar::Format::String::MOLECULE_PATTERN = T.let(T.unsafe(nil), Regexp)
class ProgressBar::InvalidProgressError < ::RuntimeError; end

class ProgressBar::Output
  def initialize(options = T.unsafe(nil)); end

  def clear_string; end
  def length; end
  def log(string); end
  def refresh(options = T.unsafe(nil)); end

  # Returns the value of attribute stream.
  def stream; end

  # Sets the attribute stream
  def stream=(_arg0); end

  def with_refresh; end

  protected

  # Returns the value of attribute bar.
  def bar; end

  # Sets the attribute bar
  def bar=(_arg0); end

  # Returns the value of attribute length_calculator.
  def length_calculator; end

  # Sets the attribute length_calculator
  def length_calculator=(_arg0); end

  # Returns the value of attribute throttle.
  def throttle; end

  # Sets the attribute throttle
  def throttle=(_arg0); end

  private

  def print_and_flush; end

  class << self
    def detect(options = T.unsafe(nil)); end
  end
end

ProgressBar::Output::DEFAULT_OUTPUT_STREAM = T.let(T.unsafe(nil), IO)
module ProgressBar::Outputs; end

class ProgressBar::Outputs::NonTty < ::ProgressBar::Output
  def bar_update_string; end
  def clear; end
  def default_format; end
  def eol; end
  def last_update_length; end
  def refresh_with_format_change(*_arg0); end
  def resolve_format(*_arg0); end

  protected

  # Sets the attribute last_update_length
  def last_update_length=(_arg0); end
end

ProgressBar::Outputs::NonTty::DEFAULT_FORMAT_STRING = T.let(T.unsafe(nil), String)

class ProgressBar::Outputs::Tty < ::ProgressBar::Output
  def bar_update_string; end
  def clear; end
  def default_format; end
  def eol; end
  def refresh_with_format_change; end
  def resolve_format(other_format); end
end

ProgressBar::Outputs::Tty::DEFAULT_FORMAT_STRING = T.let(T.unsafe(nil), String)

class ProgressBar::Progress
  def initialize(options = T.unsafe(nil)); end

  def absolute; end
  def decrement; end
  def finish; end
  def finished?; end
  def increment; end
  def none?; end
  def percentage_completed; end
  def percentage_completed_with_precision; end

  # Returns the value of attribute progress.
  def progress; end

  def progress=(new_progress); end
  def reset; end

  # Returns the value of attribute running_average.
  def running_average; end

  # Sets the attribute running_average
  def running_average=(_arg0); end

  # Returns the value of attribute smoothing.
  def smoothing; end

  # Sets the attribute smoothing
  def smoothing=(_arg0); end

  def start(options = T.unsafe(nil)); end

  # Returns the value of attribute starting_position.
  def starting_position; end

  # Sets the attribute starting_position
  def starting_position=(_arg0); end

  # Returns the value of attribute total.
  def total; end

  def total=(new_total); end
  def total_with_unknown_indicator; end
  def unknown?; end
end

ProgressBar::Progress::DEFAULT_BEGINNING_POSITION = T.let(T.unsafe(nil), Integer)
ProgressBar::Progress::DEFAULT_SMOOTHING = T.let(T.unsafe(nil), Float)
ProgressBar::Progress::DEFAULT_TOTAL = T.let(T.unsafe(nil), Integer)
module ProgressBar::Refinements; end
module ProgressBar::Refinements::Enumerator; end

class ProgressBar::Throttle
  def initialize(options = T.unsafe(nil)); end

  def choke(options = T.unsafe(nil)); end

  # Returns the value of attribute rate.
  def rate; end

  # Sets the attribute rate
  def rate=(_arg0); end

  # Returns the value of attribute started_at.
  def started_at; end

  # Sets the attribute started_at
  def started_at=(_arg0); end

  # Returns the value of attribute stopped_at.
  def stopped_at; end

  # Sets the attribute stopped_at
  def stopped_at=(_arg0); end

  # Returns the value of attribute timer.
  def timer; end

  # Sets the attribute timer
  def timer=(_arg0); end
end

class ProgressBar::Time
  def initialize(time = T.unsafe(nil)); end

  def now; end
  def unmocked_time_method; end

  protected

  # Returns the value of attribute time.
  def time; end

  # Sets the attribute time
  def time=(_arg0); end
end

ProgressBar::Time::TIME_MOCKING_LIBRARY_METHODS = T.let(T.unsafe(nil), Array)

class ProgressBar::Timer
  def initialize(options = T.unsafe(nil)); end

  def divide_seconds(seconds); end
  def elapsed_seconds; end
  def elapsed_whole_seconds; end
  def pause; end
  def reset; end
  def reset?; end
  def restart; end
  def resume; end
  def start; end
  def started?; end

  # Returns the value of attribute started_at.
  def started_at; end

  # Sets the attribute started_at
  def started_at=(_arg0); end

  def stop; end
  def stopped?; end

  # Returns the value of attribute stopped_at.
  def stopped_at; end

  # Sets the attribute stopped_at
  def stopped_at=(_arg0); end

  protected

  # Returns the value of attribute time.
  def time; end

  # Sets the attribute time
  def time=(_arg0); end
end
