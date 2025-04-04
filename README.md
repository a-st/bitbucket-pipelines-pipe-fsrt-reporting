# Bitbucket Pipelines Pipe: ESLint Reporting

This pipe runs the [FSRT - Forge Security Requirements Tester](https://github.com/atlassian-labs/FSRT) in Bitbucket Pipelines

## YAML Definition

Add the following snippet to the script section of your `bitbucket-pipelines.yml` file:

```yaml
- pipe: docker://astraube/fsrt-report-pipe:latest
  variables:
    FSRT_OPTIONS: "<string>" # Optional options
    FSRT_DIRS: "<string>" # The directory to scan
```

## Variables

| Variable     | Usage                                                                                                                                    |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| FSRT_OPTIONS | Optional options                                                                                                                         |
| FSRT_DIRS    | The directory to scan. Assumes there is a `manifest.yaml` file in the top level directory, and that the source code is located in `src/` |

_(\*) = required variable._

## Examples

### Basic example

```yaml
pipelines:
  default:
    - step:
        name: Run NPM
        script:
          - npm install
          - forge lint
    - step:
        name: FSRT Reporting
        script:
          - pipe: docker://astraube/fsrt-report-pipe:latest
            variables:
              FSRT_OPTIONS: "--out fsrt-report.json"
              FSRT_DIRS: $BITBUCKET_CLONE_DIR
```

## References

- https://github.com/atlassian-labs/FSRT
- https://bitbucket.org/snyk/snyk-scan
- https://dev.to/julian_c/eslint-code-insights-from-bitbucket-pipelines-5dgo
