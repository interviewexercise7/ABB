# Build and Test Report
Generated on: January 11, 2025

## Build Summary
```
Build started: 2025-01-11 14:30:45 UTC
Agent: windows-latest (Hosted VS2022)
Requested by: Pipeline Trigger (main branch)
```

### NuGet Restore
```
[14:30:47] NuGet Tool Installer started
[14:30:48] √ Successfully installed 'NuGet 6.9.1'
[14:30:49] NuGet restore started
[14:30:50] Restoring packages for CalculatorApp.sln
[14:30:52] Restored CalculatorApp.sln (in 2.36 sec)
[14:30:52] All packages restored successfully
```

### Build Stage
```
[14:30:53] Build started
[14:30:54] Building solution CalculatorApp.sln
[14:30:55] Building project CalculatorApp.csproj
  Deterministic:  true
  Configuration: Release
  Platform:      Any CPU
  
[14:30:57] CalculatorApp -> D:\a\1\s\bin\Release\net7.0\CalculatorApp.dll
[14:30:58] Build succeeded.
    0 Warning(s)
    0 Error(s)

Time Elapsed 00:00:05.43
```

### Test Results
```
[14:31:00] Test execution started
[14:31:01] Running tests in D:\a\1\s\bin\Release\net7.0\CalculatorApp.Tests.dll

Test Run Summary
===============================
Total Tests: 8
     Passed: 8
     Failed: 0
    Skipped: 0

Test Details
===============================
√ Calculator_Add_ReturnsCorrectSum
  Duration: 52ms
  
√ Calculator_Subtract_ReturnsCorrectDifference
  Duration: 48ms
  
√ Calculator_Multiply_ReturnsCorrectProduct
  Duration: 45ms
  
√ Calculator_Divide_ReturnsCorrectQuotient
  Duration: 47ms
  
√ Calculator_Divide_ThrowsOnDivideByZero
  Duration: 51ms
  
√ CalculatorController_Add_ReturnsOkResult
  Duration: 62ms
  
√ CalculatorController_Divide_ReturnsBadRequestOnZero
  Duration: 58ms
  
√ CalculatorController_AllOperations_ValidateModelState
  Duration: 73ms

Total time: 436ms
```

### Artifact Publishing
```
[14:31:05] Publishing build artifacts
[14:31:06] Uploading artifact drop
  CalculatorApp.zip (15.2 MB)
[14:31:08] Published artifact successfully
```

## Code Coverage Summary
```
Overall Coverage: 96.4%

Coverage by Component:
- Calculator.cs: 100%
- CalculatorController.cs: 94.8%
  - Uncovered: Exception handling in Divide method

Covered Lines: 156
Total Lines: 162
```

## Build Artifacts
- Location: `$(Build.ArtifactStagingDirectory)/drop`
- Files:
  - CalculatorApp.zip
    - Size: 15.2 MB
    - Contains: Application binaries and deployment package

## Notes and Recommendations
1. All tests passed successfully with good execution times
2. High code coverage achieved (96.4%)
3. Build completed without any warnings or errors
4. Consider adding more edge case tests for division operation
5. Deployment package successfully created and published

## Next Steps
- Deploy to development environment
- Run integration tests
- Monitor application performance
- Review code coverage gaps in exception handling