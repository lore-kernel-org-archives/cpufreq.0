From: bugme-daemon@osdl.org
Subject: [Bug 3150] New: modprobe speedstep-centrino fails
Date: Tue, 3 Aug 2004 03:35:34 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200408031035.i73AZYVh018579@fire-1.osdl.org>
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

http://bugme.osdl.org/show_bug.cgi?id=3150

           Summary: modprobe speedstep-centrino fails
    Kernel Version: 2.6.7
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: mkrueger@mkru.de


Distribution: Debian testing (3.1) 
Hardware Environment: Laptop ASUS M2N 
Software Environment: 
Problem Description: The frequency scaling won't work. This is due to the 
problem that the module can't be loaded. I don't get a fatal error message. 
Instead I get an oops and a call trace. 
 
Steps to reproduce: I don't know what to say here. I just compiled the kernel 
I got from kernel.org. I did not use LAPIC in case this information matters. 
So after compiling the kernel and the modules I reboot, log in as root and do 
a modprobe processor; modprobe speedstep-centrino. 
 
Did I miss something? I haven't tried the 2.6.5 kernel which according to some 
websites seems to work.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
