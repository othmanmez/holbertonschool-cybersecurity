# Career Mapping – Offensive Security Roles

## Roles selected

* Infrastructure Penetration Tester
* Web Application Security Consultant
* Cloud Security Assessor

---

# 1. Infrastructure Penetration Tester

## Role positioning

An Infrastructure Penetration Tester works on the network and systems side of an offensive security consulting firm. This person usually works with other penetration testers, security consultants, and the client's IT and security teams.

The role is focused on finding weaknesses in infrastructure that could allow an attacker to gain access, move through a network, or obtain higher privileges.

## Scope of intervention

An Infrastructure Penetration Tester can assess:

* Internal and external networks
* Servers and network devices
* Active Directory environments
* VPNs and remote access systems
* Network segmentation
* Authentication and access controls
* Windows and Linux systems

This role is not mainly focused on testing web application code, mobile applications, cloud-specific configurations, or human behavior. These areas may sometimes overlap with infrastructure testing, but they are usually handled by specialists.

## Key technical skills

* TCP/IP networking
* Network scanning and enumeration
* Windows and Linux administration
* Active Directory and Kerberos
* Authentication protocols
* Privilege escalation
* Network segmentation
* Tools such as Nmap, Burp Suite, Impacket, and Metasploit
* Basic scripting with Python, Bash, or PowerShell

## Soft skills

The tester must be able to explain technical vulnerabilities to people who may not have a technical background.

They also need to be careful because infrastructure testing can affect production systems. Good documentation and the ability to respect the agreed scope are very important.

## Relevant certifications

* **OSCP**: Demonstrates practical penetration testing skills and the ability to compromise systems in a controlled environment.
* **CRTP**: Useful for developing a deeper understanding of Active Directory attacks and enterprise Windows environments.
* **PNPT**: Focuses on practical penetration testing and reporting, including internal network assessments.

## Distinction from adjacent roles

Unlike a Web Application Security Consultant, this role focuses mainly on operating systems, networks, and enterprise infrastructure.

Unlike a Cloud Security Assessor, the main focus is not cloud identity and cloud configuration.

Unlike a Red Team Operator, an infrastructure penetration test usually has a more defined technical scope and focuses on finding vulnerabilities rather than simulating a complete long-term attacker operation.

## Typical engagement scenario

A client asks Vanguard to test its internal network after an employee account was compromised. The tester receives the agreed IP ranges and rules of engagement before starting enumeration. During the test, they identify weaknesses in Active Directory and demonstrate how a low-privileged account could potentially lead to higher privileges. The tester documents the evidence and explains the risks and remediation steps in the final report.

---

# 2. Web Application Security Consultant

## Role positioning

A Web Application Security Consultant specializes in finding security weaknesses in websites, APIs, and web applications.

This person works closely with penetration testers, developers, application owners, and security teams. They need to understand both how applications are built and how attackers try to abuse them.

## Scope of intervention

The role can include testing:

* Web applications
* REST and GraphQL APIs
* Authentication and authorization
* Session management
* Input validation
* Business logic
* File upload functionality
* Access control
* Common OWASP vulnerabilities

The role is not mainly focused on network infrastructure, physical intrusion, cloud architecture, or social engineering.

## Key technical skills

* HTTP and HTTPS
* Web application architecture
* HTML, JavaScript, and basic backend technologies
* REST and API security
* Authentication and session management
* SQL and databases
* OWASP Top 10
* Manual testing using Burp Suite
* Basic scripting and code reading

## Soft skills

A consultant needs strong analytical skills because many important vulnerabilities are not found by simply running an automated scanner.

They also need to communicate well with developers. A good report should explain not only what the vulnerability is, but also why it exists and how it can be fixed.

## Relevant certifications

* **OSWE**: Focuses heavily on advanced web application security and source code analysis.
* **eWPT**: Demonstrates practical web application penetration testing skills.
* **OSCP**: Provides a broader penetration testing foundation and helps understand how web vulnerabilities can be used during a larger attack.

## Distinction from adjacent roles

Unlike an Infrastructure Penetration Tester, this role focuses on the application's functionality and code rather than primarily on servers and networks.

Unlike a Mobile Application Penetration Tester, the target is mainly web applications and APIs rather than mobile apps and mobile operating systems.

Unlike a Social Engineering Specialist, this role attacks technical application weaknesses rather than human behavior.

## Typical engagement scenario

A financial company asks Vanguard to test a new customer portal and its API before launch. The consultant reviews the application and then manually tests authentication, authorization, input validation, and business logic. They discover that one user can access another user's account by changing an identifier in an API request. The issue is documented with evidence and a remediation recommendation, and the consultant discusses the finding with the development team.

---

# 3. Cloud Security Assessor

## Role positioning

A Cloud Security Assessor focuses on security risks in cloud environments. They work with cloud engineers, DevOps teams, security teams, and system owners.

The role is increasingly important because companies often run important infrastructure and sensitive data in platforms such as AWS, Microsoft Azure, or Google Cloud.

## Scope of intervention

A Cloud Security Assessor can assess:

* Cloud identity and access management
* Storage permissions
* Virtual networks
* Security groups and firewall rules
* Cloud logging and monitoring
* Containers
* Serverless applications
* Infrastructure as Code
* Cloud configuration and architecture

The role is not mainly focused on physical security, traditional social engineering, or testing a mobile application's user interface.

## Key technical skills

* AWS, Azure, or Google Cloud
* Identity and Access Management
* Cloud networking
* Storage security
* Containers and Kubernetes
* Infrastructure as Code
* Linux and networking
* Cloud logging and monitoring
* Understanding of cloud attack techniques

The assessor should also understand the shared responsibility model, because the cloud provider and the customer are responsible for different parts of security.

## Soft skills

Cloud environments can be complicated, so the assessor must be able to explain technical risks clearly.

They also need to work with cloud and DevOps teams because many findings require changes to architecture, permissions, or deployment processes.

## Relevant certifications

* **AWS Certified Security – Specialty**: Demonstrates knowledge of securing AWS environments and services.
* **CCSP**: Covers broader cloud security concepts and helps understand cloud governance and risk.
* **Cloud-focused practical certifications**: Can demonstrate practical ability to identify and exploit cloud misconfigurations in controlled environments.

## Distinction from adjacent roles

Unlike an Infrastructure Penetration Tester, the Cloud Security Assessor focuses specifically on cloud architecture, identity, and cloud service configuration.

Unlike a Web Application Security Consultant, the main target is the cloud environment supporting applications rather than the application's functionality itself.

Unlike a Red Team Operator, the assessment is usually more focused on cloud security weaknesses and misconfigurations rather than simulating a complete attack campaign.

## Typical engagement scenario

A company asks Vanguard to review its AWS environment before moving more production systems to the cloud. The assessor reviews the cloud architecture, IAM permissions, storage, networking, and logging configuration. They identify an overly privileged service account and a storage resource that is accessible more widely than intended. The assessor explains the risks and provides practical recommendations to reduce unnecessary permissions and improve the cloud security architecture.

---

# Why I chose these three roles

I chose these three roles because they cover three important parts of a modern company's attack surface: networks, applications, and cloud environments. An Infrastructure Penetration Tester can identify weaknesses in traditional enterprise systems and internal networks. A Web Application Security Consultant focuses on the applications that customers and employees use every day. A Cloud Security Assessor covers the growing number of companies moving their infrastructure and data to cloud platforms. Together, these roles give Vanguard a broad technical capability without choosing three roles that are too similar. This hiring plan suggests that Vanguard wants to remain a general offensive security consultancy while also adapting to modern cloud-based environments. It also creates opportunities for the different specialists to work together during larger engagements.

