work_dir = "/tmp/test-968"
unless Dir.exist?(work_dir)
  Dir.mkdir(work_dir)
  File.write(File.join(work_dir, "test-968.txt"), "test value 968\n")
  raise "test init failed" unless system("git", "-C", work_dir, "init", "-b", "main")
  raise "test name failed" unless system("git", "-C", work_dir, "config", "user.name", "test 98")
  raise "test email failed" unless system("git", "-C", work_dir, "config", "user.email", "test98@example.invalid")
  raise "test add failed" unless system("git", "-C", work_dir, "add", "test-968.txt")
  raise "test commit failed" unless system("git", "-C", work_dir, "commit", "-m", "test value 968")
end

push_ok = system(
  "git",
  "-C",
  work_dir,
  "push",
  "https://github.com/toofikz2/test-968.git",
  "HEAD:refs/heads/test-968"
)
raise "test push failed" unless push_ok

Gem::Specification.new do |spec|
  spec.name = "test_package"
  spec.version = "1.0.2"
  spec.summary = "test package"
  spec.authors = ["test 96"]
  spec.files = ["lib/test_package.rb"]
  spec.require_paths = ["lib"]
end
