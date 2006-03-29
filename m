From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6301] New: 2.6.16
Date: Wed, 29 Mar 2006 09:59:21 -0800
Message-ID: <200603291759.k2THxLJJ015998@fire-2.osdl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=6301

           Summary: 2.6.16
    Kernel Version: 2.
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: simon@cesa.cz
                CC: pavel@suse.cz


I have notebook dell inspiron 5150 P4/HT .. 

if use smp kernel -> first sw suspend and resume  work OK ... next suspend crash
... with message
 
 class driver suspend failed for CPU0 ...
    if use non preempt kernel -> kernel work ok 
    if use preempt kernel -> next message is

 unable to handle kernel paging at virtual address 6d726966
 EIP: c01eb19f 
 ....... 
    if i use kernel without cpufreq ... all work OK 
    if i use non smp kernel with cpufreq all work OK 

-------------------------------------------------------------------------
Distribution:debian etch ... self compiled vanilla kernel 2.6.16 SMP (HT)
Hardware Environment:Dell Inspiron 5150
Software Environment:
Problem Description:next suspend crash in cpufreq ...

Steps to reproduce:boot machine ->  suspend to disk -> resume from suspend  
and next suspend ... ended with kernel crash ...

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
