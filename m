From: bugme-daemon@osdl.org
Subject: [Bug 3510] New: cpufreq speedstep-lib unable to detect SpeedStep CPU
Date: Mon, 4 Oct 2004 06:44:42 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200410041344.i94DigxD003574@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugme.osdl.org/show_bug.cgi?id=3510

           Summary: cpufreq speedstep-lib unable to detect SpeedStep CPU
    Kernel Version: 2.6.8
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: wesley.janik@ubs.com


Distribution: Fedora Core 2
Hardware Environment: Dell Inspiron 5150 with Mobile Pentium 4 3.06GHz
Problem Description:

cpufreq is unable to detect the processor in a (or, at least my) Dell Inspiron 
5150.  Having looked at the speedstep-lib.c code, I discovered the bit that 
fails:

if ((ebx == 0x0e) || (strstr(c->x86_model_id,"Mobile Intel(R) Pentium(R) 4") != 
NULL))
   return SPEEDSTEP_PROCESSOR_P4M;

For some reason, my processor indentifies itself using `cat /proc/cpuinfo` as 
a "Genuine Intel(R) CPU 3.06GHz."  Changing the above lines of code to read:

if ((ebx == 0x0e) || (strstr(c->x86_model_id,"Mobile Intel(R) Pentium(R) 4") != 
NULL) || (strstr(c->x86_model_id,"Genuine Intel(R) CPU 3.06GHz") != NULL))
   return SPEEDSTEP_PROCESSOR_P4M;

works great on my machine but, obviously, this code is far from generic.  
Windows XP was ;) able to detect SpeedStep on the processor, so it doesn't seem 
likely to me the processor is misidentifying itself.

I can provide more information about the kernel/machine config if needed.

Steps to reproduce:

modprobe speedstep-ich

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
