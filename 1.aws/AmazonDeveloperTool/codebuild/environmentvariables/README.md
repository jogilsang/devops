
Environment variables in build environments
https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-env-vars.html

```yml
AWS CodeBuild provides several environment variables that you can use in your build commands:

AWS_DEFAULT_REGION: The AWS Region where the build is running (for example, us-east-1). This environment variable is used primarily by the AWS CLI.

AWS_REGION: The AWS Region where the build is running (for example, us-east-1). This environment variable is used primarily by the AWS SDKs.

CODEBUILD_BUILD_ARN: The Amazon Resource Name (ARN) of the build (for example, arn:aws:codebuild:region-ID:account-ID:build/codebuild-demo-project:b1e6661e-e4f2-4156-9ab9-82a19EXAMPLE).

CODEBUILD_BUILD_ID: The CodeBuild ID of the build (for example, codebuild-demo-project:b1e6661e-e4f2-4156-9ab9-82a19EXAMPLE).

CODEBUILD_BUILD_IMAGE: The CodeBuild build image identifier (for example, aws/codebuild/standard:2.0).

CODEBUILD_BUILD_NUMBER: The current build number for the project.

CODEBUILD_BUILD_SUCCEEDING: Whether the current build is succeeding. Set to 0 if the build is failing, or 1 if the build is succeeding.

CODEBUILD_INITIATOR: The entity that started the build. If CodePipeline started the build, this is the pipeline's name (for example, codepipeline/my-demo-pipeline). If an IAM user started the build, this is the user's name (for example, MyUserName). If the Jenkins plugin for CodeBuild started the build, this is the string CodeBuild-Jenkins-Plugin.

CODEBUILD_KMS_KEY_ID: The identifier of the AWS KMS key that CodeBuild is using to encrypt the build output artifact (for example, arn:aws:kms:region-ID:account-ID:key/key-ID or alias/key-alias).

CODEBUILD_LOG_PATH: The log stream name in CloudWatch Logs for the build.

CODEBUILD_RESOLVED_SOURCE_VERSION: An identifier for the version of a build's source code. Its format depends on the source code repository:

For CodeCommit, GitHub, GitHub Enterprise Server, and Bitbucket, it is the commit ID. For these repositories, CODEBUILD_RESOLVED_SOURCE_VERSION is only available after the DOWNLOAD_SOURCE phase.

For CodePipeline, it is the source revision is provided by CodePipeline. For CodePipeline, the CODEBUILD_RESOLVED_SOURCE_VERSION environment variable may not always be available.

For Amazon S3, this does not apply.

CODEBUILD_SOURCE_REPO_URL: The URL to the input artifact or source code repository. For Amazon S3, this is s3:// followed by the bucket name and path to the input artifact. For CodeCommit and GitHub, this is the repository's clone URL. If a build originates from CodePipeline, then this might be empty.

CODEBUILD_SOURCE_VERSION: The value's format depends on the source repository.

For Amazon S3, it is the version ID associated with the input artifact.

For CodeCommit, it is the commit ID or branch name associated with the version of the source code to be built.

For GitHub, GitHub Enterprise Server, and Bitbucket it is the commit ID, branch name, or tag name associated with the version of the source code to be built.
```
