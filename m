From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9561] New: powernow-k8 cpuid c0f13 not supported w/ fx-74 CPUs
Date: Fri, 14 Dec 2007 09:45:14 -0800 (PST)
Message-ID: <bug-9561-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=9561

           Summary: powernow-k8 cpuid c0f13 not supported w/ fx-74 CPUs
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.24-rc4-git6
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: blackprince2000@hotmail.com


Most recent kernel where this bug did not occur: unknown
Distribution: gcc version 4.1.2 (Gentoo 4.1.2 p1.0.2)
Hardware Environment: 2xAMD Athlon FX-74 CPUs on ASUS L1N64-SLI WS NF680a 1207
MB
Software Environment: gentoo

Problem Description:
While trying to enable Cool'n'Quiet, dmesg error with:

powernow-k8: Processor cpuid c0f13 not supported
powernow-k8: Processor cpuid c0f13 not supported
powernow-k8: Processor cpuid c0f13 not supported
powernow-k8: Processor cpuid c0f13 not supported

Tried w/ powernow-k8 build as a module as well as build into kernel... same
result.

Steps to reproduce:
1. compile kernel with powernow-k8 support
2. boot on Athlon FX-74 CPU


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
