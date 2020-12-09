# General Jenkins Notes

## Contents
1. [Jobs](#Jobs)
2. [Builds](#Builds)
3. [Tests](#Tests)
4. [Artifacts & Fingerprints](#Artifacts & Fingerprints)

---
## Jobs

* Job - Any runnable task that is controlled by Jenkins
  * Job and Project are the same thing

#### Job Types
* Freestyle Project - Most common type of project; Often executes a shell command
* Pipeline - Pipelines are for things that don't fit a freestyle project and are too complicated or span multiple nodes 
  * Formerly called a `workflow`
  * Normally written in `Jenkins Domain Specific Language (DSL)`
* Multi-Configuration Project - Used  for projects that are tested on multiple environments, and require different configurations
* Git-Hub Organization - This type of project can allow Jenkins to act on Jenkinsfiles stored within the organization's repositories
* Folder - This is not technically a project, but provides a method to group projects together.  Acts as a directory structure for projects, and the folder name becomes part of the path of the projects.
* Multi-Branch Pipeline - Jenkins uses a Jenkinsfile to mark repositores.  if a branch is created in that repository, Jenkins will make a new project in jenkins for that branch.
 
#### Job/Project Scope
This includes all of the items that are part of that particular Job/Project.  In some cases, there are Global libraries that are brought into the scope of a project simply by being included. Other items that are declared within a project only exist in that project's scope, and are not available as a shared resource.

---
## Builds

Build - The result of a single execution of a project

Build Steps - A single task within a project

Build Triggers - A criteria for starting a new pipeline run or build

Artifacts - Refers to immutable files that are generated during a build or a pipeline run.  These are  archived on the Jenkins master for later retrieval.
 * A single build can have multiple artifacts associated with it.  These can include various files and generated assets.
 * Artifacts are maintained in a repository

Build Tools - Software that actually performs the build portion of the pipeline.
* Build tools can include Maven, Ant, shell scripting, etc..
* Build Tool Process:
  1. Start jenkins and install required plugins.
  2. Perform global configuration steps. 
  3. Create a Job/Pipeline that utilizes the build tool
  4. Update the tools configuration file: POM, XML, .config etc.

---
## Tests

Unit Test - Test individual components (classes, methods, modules) to ensure that outputs are as expected.

Smoke Test - Test checks the main functionality of the software to ensure that it is stable enough for further testing

---
## Artifacts & Fingerprints

Artifact - An immutable file that is generated during a build or pipeline run
  * Used to provide the compiled project to end users, facilitate the testing process, create classes, and prevent rebuilding of known good code. 
  * Used as a way to version software


  * Artifacts are stored in a repo, `fingerprinting` is used to determine which build produced that artifact

Fingerprints - A globally unique hash that is used to track Artifacts or other entities across multiple pipelines or projects

  * Stored in `/var/lib/jenkins/fingerprints`
    * Files are stored in a hierarchy based on the first characters of the checksum:
      * `/var/lib/jenkins/fingerprints/98/b8` 
