From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 11139] New: warning in cpufreq.c on E450
Date: Mon, 21 Jul 2008 15:02:44 -0700 (PDT)
Message-ID: <bug-11139-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=11139

           Summary: warning in cpufreq.c on E450
           Product: Power Management
           Version: 2.5
     KernelVersion: 2.6.26
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
        AssignedTo: cpufreq@www.linux.org.uk
        ReportedBy: marvin@mydatex.cz


Latest working kernel version: 2.6.24.2
Earliest failing kernel version: 2.6.26
Distribution: Debian Sid
Hardware Environment: Sun E450/2x CPU 400Mhz/1GB Ram
Software Environment: Sid
Problem Description:
After I compile 2.6.26 an boots I get this:
------------[ cut here ]------------                                            
WARNING: at drivers/cpufreq/cpufreq.c:1391
cpufreq_register_notifier+0x50/0x60()
Modules linked in:                                                              
Call Trace:                                                                     
 [0000000000605270] cpufreq_register_notifier+0x58/0x60                         
 [00000000007708e0] start_kernel+0x1f0/0x324                                    
 [0000000000680e08] auxio_probe+0x0/0xe8                                        
 [0000000000000000] 0x8                                                         
---[ end trace 139ce121c98e96c9 ]---

Steps to reproduce:
Compile kernel with cpufreq enabled and boot.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
